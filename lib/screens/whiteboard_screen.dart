import 'package:flutter/material.dart';
import 'dart:ui' as ui show ParagraphBuilder, ParagraphStyle, ParagraphConstraints, TextStyle, PointMode;
import '../styles/custom_app_bar.dart';
import '../services/validation_service.dart';
import 'package:logging/logging.dart';

class WhiteboardScreen extends StatefulWidget {
  const WhiteboardScreen({super.key});

  @override
  State<WhiteboardScreen> createState() => _WhiteboardScreenState();
}

class _WhiteboardScreenState extends State<WhiteboardScreen> {
  List<DrawingPoint?> points = [];
  final GlobalKey _canvasKey = GlobalKey();
  bool _isValidated = false;
  final Logger _logger = Logger('WhiteboardScreen');
  Color selectedColor = Colors.black;
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();
    _checkValidation();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!_isInitialized) {
        _initializeCanvas();
      }
    });
  }

  void _initializeCanvas() {
    final RenderBox renderBox = _canvasKey.currentContext!.findRenderObject() as RenderBox;
    final size = renderBox.size;
    final center = Offset(size.width / 2, size.height / 2);
    
    setState(() {
      points.add(DrawingPoint(center, Colors.blue, isText: true, text: "Hello Picasso"));
      _isInitialized = true;
    });

    // Programar la eliminación del texto después de 5 segundos
    Future.delayed(const Duration(seconds: 5), () {
      setState(() {
        points.removeWhere((point) => point?.isText == true);
      });
    });
  }

  Future<void> _checkValidation() async {
    final isValidated = await ValidationService.getComponentValidation(
      'WhiteboardScreen',
      'WhiteboardScreen',
    );
    if (isValidated != _isValidated) {
      _logger.info('Estado de validación de WhiteboardScreen cambiado a: $isValidated');
      setState(() {
        _isValidated = isValidated;
      });
    }
  }

  void _changeColor(Color color) {
    setState(() {
      selectedColor = color;
    });
  }

  void _clearCanvas() {
    setState(() {
      points.clear();
      _isInitialized = false;
      _initializeCanvas();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(
        title: 'Whiteboard',
        showBackButton: true,
      ),
      body: Stack(
        children: [
          GestureDetector(
            onPanUpdate: (details) {
              final RenderBox renderBox = _canvasKey.currentContext!.findRenderObject() as RenderBox;
              final localPosition = renderBox.globalToLocal(details.globalPosition);
              setState(() {
                points.add(DrawingPoint(localPosition, selectedColor));
              });
            },
            onPanEnd: (details) {
              setState(() {
                points.add(null);
              });
            },
            child: CustomPaint(
              key: _canvasKey,
              painter: WhiteboardPainter(points: points),
              size: Size.infinite,
            ),
          ),
          Positioned(
            bottom: 20,
            left: 20,
            child: Row(
              children: [
                _buildColorButton(Colors.black),
                _buildColorButton(Colors.red),
                _buildColorButton(Colors.blue),
                _buildColorButton(Colors.green),
                const SizedBox(width: 20),
                IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: _clearCanvas,
                  tooltip: 'Borrar todo',
                ),
              ],
            ),
          ),
          Positioned(
            top: 10,
            right: 10,
            child: ValidationService.buildValidationRing(
              'WhiteboardScreen',
              'Body',
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildColorButton(Color color) {
    return GestureDetector(
      onTap: () => _changeColor(color),
      child: Container(
        margin: const EdgeInsets.only(right: 10),
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
          border: Border.all(color: Colors.grey),
        ),
        child: selectedColor == color
            ? const Icon(Icons.check, color: Colors.white, size: 20)
            : null,
      ),
    );
  }
}

class DrawingPoint {
  final Offset offset;
  final Color color;
  final bool isText;
  final String? text;

  DrawingPoint(this.offset, this.color, {this.isText = false, this.text});
}

class WhiteboardPainter extends CustomPainter {
  final List<DrawingPoint?> points;

  WhiteboardPainter({required this.points});

  @override
  void paint(Canvas canvas, Size size) {
    for (int i = 0; i < points.length; i++) {
      if (points[i] != null) {
        if (points[i]!.isText) {
          _drawText(canvas, points[i]!);
        } else if (i + 1 < points.length && points[i + 1] != null) {
          Paint paint = Paint()
            ..color = points[i]!.color
            ..strokeCap = StrokeCap.round
            ..strokeWidth = 3.0;
          canvas.drawLine(points[i]!.offset, points[i + 1]!.offset, paint);
        } else {
          Paint paint = Paint()
            ..color = points[i]!.color
            ..strokeCap = StrokeCap.round
            ..strokeWidth = 3.0;
          canvas.drawPoints(ui.PointMode.points, [points[i]!.offset], paint);
        }
      }
    }
  }

  void _drawText(Canvas canvas, DrawingPoint point) {
    final paragraphBuilder = ui.ParagraphBuilder(
      ui.ParagraphStyle(
        textAlign: TextAlign.center,
        fontSize: 30,
      ),
    )
      ..pushStyle(ui.TextStyle(color: point.color))
      ..addText(point.text!);
    final paragraph = paragraphBuilder.build()
      ..layout(const ui.ParagraphConstraints(width: 300));

    canvas.drawParagraph(
      paragraph,
      point.offset - Offset(150, paragraph.height / 2),
    );
  }

  @override
  bool shouldRepaint(WhiteboardPainter oldDelegate) => true;
}

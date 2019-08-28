
odoo.define('advance_website_settings.advance_website_settings', function (require) {
"use strict";
    var base = require('web_editor.base');
    var ajax = require('web.ajax');
    var core = require('web.core');
    var _t = core._t;
    $(document).ready(function(){
        $('.oe_website_sale').on('click', 'a[href$="/shop/checkout?express=1"]', function (ev)
        {   
            console.log($(this))
            var conf_value = $('.oe_website_sale').find('.wk_cart_values').attr('conf_value');
            var cart_value = $('#order_total span.oe_currency_value').text();
            var cart_value = cart_value.replace(",", "");
            var cart_value = parseFloat(cart_value);
            var currency_symbol = $('.oe_website_sale').find('.wk_cart_values').attr('currency_symbol');
            var $link = $(this);
            if (cart_value<conf_value)
            {
                ev.preventDefault();
                $(this).popover({
                //   content:"A minimum purchase total of "+ currency_symbol+" "+ conf_value+" is required to validate your order, current purchase total is "+ currency_symbol+" "+ cart_value,
                  title:"WARNING!!",
                  placement:"top",
                  trigger:'focus',
                });
                $(this).attr('data-content',_t("A minimum purchase total of ")+ currency_symbol+" "+ conf_value+_t(" is required to validate your order, current purchase total is ")+ currency_symbol+" "+ cart_value);
                $(this).popover('show');

            }
            setTimeout(function() {$link.popover("hide");},3000);
        });

       var totalPriceElem = $('#sub_total span');
       var quantityField = $('.css_quantity input[type="text"].quantity');
       var defaultPrice = $('.oe_price_h4 b.oe_price .oe_currency_value');
       var price;

       function numberWithCommas(x) {
          var parts = x.toString().split(".");
          parts[0] = parts[0].replace(/\B(?=(\d{3})+(?!\d))/g, ",");
          return parts.join(".");
        }

       defaultPrice.on('DOMSubtreeModified',function(){
          try {
            price = parseFloat(defaultPrice.text().replace(',',''));
            totalPriceElem.text(numberWithCommas((quantityField.val()*price).toFixed(2)));
          } catch (e) {
            console.error(e);
          }
        });
    });

    $('.oe_website_sale').each(function () {
        var oe_website_sale = this;

      /*  $(oe_website_sale).on('click', 'span.btn_delete', function (ev)
        {
        	ev.preventDefault();
            var $link = $(ev.currentTarget);
            var $input = $link.parent().parent().parent().find(".js_quantity");
            var $val = $link.parent().parent().parent().find(".js_quantity").val();
            var min = parseFloat($input.data("min") || 0);
            var max = parseFloat($input.data("max") || Infinity);
            var quantity = 0
            $input.val(quantity > min ? (quantity < max ? quantity : max) : min);
            $('input[name="'+$input.attr("name")+'"]').val(quantity > min ? (quantity < max ? quantity : max) : min);
            $input.change();
            return false;
    	});*/
	});
});
# -*- coding: utf-8 -*-
#################################################################################
#
# Copyright (c) 2018-Present Webkul Software Pvt. Ltd. (<https://webkul.com/>:wink:
# See LICENSE file for full copyright and licensing details.
#################################################################################

from odoo import fields, models
from odoo import models
from odoo.tools.translate import _
import logging
_logger = logging.getLogger(__name__)

class website(models.Model):
	_inherit = 'website'

	def check_redirect_to(self, cr, uid, ids, context=None):
		redirect_to_cart = 'same' if self.env['ir.default'].sudo().get('advance.website.settings', 'redirect_to_cart') == None else self.env['ir.default'].sudo().get('advance.website.settings', 'redirect_to_cart')
		if redirect_to_cart == 'same':
			return 1
		else:
			return 0

	def show_subTotal(self):
		return True if self.env['ir.default'].sudo().get('advance.website.settings', 'sub_total') == None else self.env['ir.default'].sudo().get('advance.website.settings', 'sub_total')

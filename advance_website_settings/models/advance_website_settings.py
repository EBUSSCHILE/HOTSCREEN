# -*- coding: utf-8 -*-
#################################################################################
#
# Copyright (c) 2018-Present Webkul Software Pvt. Ltd. (<https://webkul.com/>:wink:
# See LICENSE file for full copyright and licensing details.
#################################################################################
from odoo import api, fields, models
from odoo import tools
import logging
_logger = logging.getLogger(__name__)

class AdvancedWebsiteSettings(models.TransientModel):
	_inherit = 'res.config.settings'
	_name = 'advance.website.settings'


	redirect_to_cart =  fields.Selection([('same','Same Page'),('cart','Cart Summary')], string='Redirect page after adding to cart')
	# delete_option = fields.Boolean(string = 'Show Delete Button In Cart')
	sub_total = fields.Boolean(string = 'Show Subtotal of Order Lines')
	minimum_order_value = fields.Float(string = 'Minimum Cart Value To Validate Order')

	@api.multi
	def set_values(self):
		super(AdvancedWebsiteSettings, self).set_values()
		IrDefault = self.env['ir.default'].sudo()
		IrDefault.set('advance.website.settings', 'redirect_to_cart','same' if self.redirect_to_cart == None else self.redirect_to_cart)
		IrDefault.set('advance.website.settings', 'sub_total',1 if self.sub_total == None else self.sub_total)
		IrDefault.set('advance.website.settings', 'minimum_order_value',1 if self.minimum_order_value == None else self.minimum_order_value)
		return True

	@api.model
	def get_values(self):
		res = super(AdvancedWebsiteSettings, self).get_values()
		IrDefault = self.env['ir.default'].sudo()
		res.update({
			'redirect_to_cart':'same' if IrDefault.get('advance.website.settings', 'redirect_to_cart') == None else IrDefault.get('advance.website.settings', 'redirect_to_cart'),
			'sub_total':1 if IrDefault.get('advance.website.settings', 'sub_total') == None else IrDefault.get('advance.website.settings', 'sub_total'),
			'minimum_order_value':1 if IrDefault.get('advance.website.settings', 'minimum_order_value') == None else IrDefault.get('advance.website.settings', 'minimum_order_value'),
			})
		return res


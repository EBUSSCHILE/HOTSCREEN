# -*- coding: utf-8 -*-
#################################################################################
#
# Copyright (c) 2018-Present Webkul Software Pvt. Ltd. (<https://webkul.com/>:wink:
# See LICENSE file for full copyright and licensing details.
#################################################################################
from odoo import http
from odoo.http import request
from odoo import SUPERUSER_ID
from odoo.addons.http_routing.models.ir_http import slug
from odoo.addons.website_sale.controllers.main import WebsiteSale
import logging
_logger = logging.getLogger(__name__)


class website_sale(WebsiteSale):
	def _filter_attributes(self, **kw):
		return {k: v for k, v in kw.items() if "attribute" in k}

	@http.route(['/shop/cart/update'], type='http', auth="public", methods=['POST'], website=True)
	def cart_update(self, product_id, wk_products_page_url=False, add_qty=1, set_qty=0, **kw):
		url=""
		wk_page_url=""
		product = request.env['product.product'].browse(int(product_id))
		if wk_products_page_url:
			wk_page_url = wk_products_page_url
		else:
			wk_page_url = '/shop/product/%s' % slug(product.product_tmpl_id)


		ir_values = 'same' if request.env['ir.default'].sudo().get('advance.website.settings', 'redirect_to_cart') == None else request.env['ir.default'].sudo().get('advance.website.settings', 'redirect_to_cart')

		if ir_values == 'same':
			url = wk_page_url
		else:
			url = "/shop/cart"
		request.website.sale_get_order(force_create=1)._cart_update(
		product_id=int(product_id),
		add_qty=float(add_qty),
		set_qty=float(set_qty),
		attributes=self._filter_attributes(**kw),
		)
		return request.redirect(url)
			

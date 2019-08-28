# -*- coding: utf-8 -*-
#################################################################################
#
# Copyright (c) 2018-Present Webkul Software Pvt. Ltd. (<https://webkul.com/>:wink:
# See LICENSE file for full copyright and licensing details.
#################################################################################
{
  "name"                 :  "Website Cart Settings",
  "summary"              :  "This module provides additional features to your cart settings (like delete button, subtotal, minimum order, etc).",
  "category"             :  "Website",
  "version"              :  "1.4.0",
  "sequence"             :  1,
  "author"               :  "Webkul Software Pvt. Ltd.",
  "license"              :  "Other proprietary",
  "website"              :  "https://store.webkul.com/Odoo-Website-Cart-Settings.html",
  "description"          :  """http://webkul.com/blog/website-cart-settings/""",
  "live_test_url"        :  "http://odoodemo.webkul.com/?module=advance_website_settings&version=12.0",
  "depends"              :  [
                             'website_sale',
                            ],
  "data"                 :  [
                            'views/template.xml',
                             'views/website.xml',
                            ],
  "images"               :  ['static/description/Banner.png'],
  "application"          :  True,
  "installable"          :  True,
  "auto_install"         :  False,
  "price"                :  29,
  "currency"             :  "EUR",
  "pre_init_hook"        :  "pre_init_check",
}
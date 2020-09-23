class CartObject < SitePrism::Page

    element :label_description_product, "td.cart_description > p > a"
    element :label_available, "td.cart_avail > span"
    element :label_unit_price, 'td.cart_unit > span'
    element :label_total_products, '#total_product'
    element :label_total_shipping, '#total_shipping'
    element :label_total_price_without_tax, '#total_price_without_tax'
    element :label_total_tax, '#total_tax'
    element :label_total_price, '#total_price'

    element :button_proceed_checkout, ".cart_navigation > .button > span"
    element :label_title_session, '#center_column > h1'
    element :label_title_sub_session,'#account-creation_form > div:nth-child(1) > h3'
    element :field_email_adress, "#email_create"
    element :button_create_account, "#SubmitCreate"

    element :radio_gender_male, '#id_gender1'
    element :radio_gender_female, '#id_gender2'
    element :field_customer_first_name, '#customer_firstname'
    element :field_customer_last_name, '#customer_lastname'
    element :field_password, '#passwd'
    element :dropbox_birth_day, '#days'
    element :dropbox_birth_month, '#months'
    element :dropbox_birth_year, '#years'
    element :checkbox_newsletter, '#newsletter'
    element :checkbox_special_offers, '#optin'

    element :field_address, "#address1"
    element :field_city, "#city"
    element :dropbox_state, "#id_state"
    element :field_postal_code, "#postcode"
    element :field_phone_mobile, "#phone_mobile"
    element :dropbox_country, '#id_country'
    element :field_alias, "#alias"
    element :button_submit_account, '#submitAccount'

    element :dropbox_address_chosen, '#id_address_delivery'

    element :delivery_label_full_name, '#address_delivery > li.address_firstname.address_lastname'
    element :delivery_label_address, '#address_delivery > li.address_address1.address_address2'
    element :delivery_label_city_state_zip, "#address_delivery > li.address_city.address_state_name.address_postcode"
    element :delivery_label_country, '#address_delivery > li.address_country_name'
    element :delivery_label_phone_mobile, '#address_delivery > li.address_phone_mobile'

    element :billing_label_full_name, '#address_invoice > li.address_firstname.address_lastname'
    element :billing_label_address, '#address_invoice > li.address_address1.address_address2'
    element :billing_label_city_state_zip, "#address_invoice > li.address_city.address_state_name.address_postcode"
    element :billing_label_country, '#address_invoice > li.address_country_name'
    element :billing_label_phone_mobile, '#address_invoice > li.address_phone_mobile'  
    
    element :button_proceed_shipping, '#center_column > form > p > button'

    element :label_shipping_full_ship, '#form > div > div.delivery_options_address > div.delivery_options > div > div > table > tbody > tr > td.delivery_option_price > div'
    element :checkbox_terms_service, '#cgv'

    element :button_proceed_payment, '#form > p > button > span'

    element :module_pay_by_bank_wire, '#HOOK_PAYMENT > div:nth-child(1) > div > p > a'
    element :module_pay_by_check, '#HOOK_PAYMENT > div:nth-child(2) > div > p > a'

    element :button_confirm_order, "#cart_navigation > button"

    element :label_message_success_check, "#center_column > p.alert.alert-success"
    element :label_message_success_bank_wire, '#center_column > div > p'
    

end    
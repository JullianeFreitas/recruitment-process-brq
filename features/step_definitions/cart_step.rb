require_relative '../../controller/capybara_controller.rb'
require 'faker'


Dado("eu valido se a {string} está no carrinho com as seguintes informações:") do |cloth_description, parameters|
    args = parameters.hashes.first
    Utils.validate_equal_field(cloth_description, cart.label_description_product.text)
    Utils.validate_equal_field(args['disponibilidade'], cart.label_available.text)
    Utils.validate_equal_field(args['preco_unitario'], cart.label_unit_price.text)
    Utils.validate_equal_field(args['total_produtos'], cart.label_total_products.text)
    Utils.validate_equal_field(args['total_frete'], cart.label_total_shipping.text)
    Utils.validate_equal_field(args['total_sem_taxas'], cart.label_total_price_without_tax.text)
    Utils.validate_equal_field(args['taxas'], cart.label_total_tax.text)
    Utils.validate_equal_field(args['preco_total'], cart.label_total_price.text)
end

Dado("avanço para a aba de autenticação") do 
    cart.button_proceed_checkout.click
end  

Dado("eu crio uma conta com as seguintes informações pessoais:") do |parameters|
    args = parameters.hashes.first
    
    email= Faker::Internet.email
    cart.field_email_adress.set email
    cart.button_create_account.click
    
    cart.wait_until_radio_gender_male_visible  
    if args['titulo'] == 'Mr.' 
        cart.radio_gender_male.click
    elsif args['titulo'] == 'Mrs.' 
        cart.radio_gender_female.click
    end

    cart.field_customer_first_name.set args['nome']
    cart.field_customer_last_name.set args['sobrenome']
    cart.field_password.set args['senha']

    birth_info = args['data_nascimento'].split('/')
    birth_day = birth_info[0]
    birth_month = Utils.convert_month_to_description(birth_info[1])
    birth_year = birth_info[2]

    cart.wait_until_dropbox_birth_day_visible
    cart.wait_until_dropbox_birth_month_visible
    cart.wait_until_dropbox_birth_year_visible

    cart.dropbox_birth_day.select(birth_day)
    cart.dropbox_birth_month.select(birth_month)
    cart.dropbox_birth_year.select(birth_year)
    
    if args['receber_noticia'] == 'Sim' 
        cart.checkbox_newsletter.click
    end
    if args['receber_oferta'] == 'Sim' 
        cart.checkbox_special_offers.click
    end
   
end

Dado("com as seguintes informações de endereço:") do |parameters|
    args = parameters.hashes.first

    cart.field_address.set args['endereco']
    cart.field_city.set args['cidade']
    cart.dropbox_state.select(args['estado'])
    cart.field_postal_code.set args['cep']
    cart.field_phone_mobile.set args['celular']
    cart.field_alias.set args['apelido_endereco']
    args['pais'] = cart.dropbox_country.text
    Runtime.set_shared_variable(args)
end

Dado("avanço para a aba de endereço") do 
    cart.button_submit_account.click
    Utils.validate_current_path(cart, Runtime.get_settings.url_address)
end 



Dado("valido que o endereço registrado está correto") do 
    args = Runtime.get_shared_variable
    full_name = args['nome'].to_s + ' ' + args['sobrenome'].to_s
    city_state_zip = args['cidade']+ ', '+args['estado'] + ' ' + args['cep']    

    Utils.validate_equal_field(full_name, cart.delivery_label_full_name.text)
    Utils.validate_equal_field(args['endereco'], cart.delivery_label_address.text)
    Utils.validate_equal_field(city_state_zip, cart.delivery_label_city_state_zip.text)
    Utils.validate_equal_field(args['pais'].sub('- ', ''), cart.delivery_label_country.text)
    Utils.validate_equal_field(args['celular'], cart.delivery_label_phone_mobile.text)

    Utils.validate_equal_field(full_name, cart.billing_label_full_name.text)
    Utils.validate_equal_field(args['endereco'], cart.billing_label_address.text)
    Utils.validate_equal_field(city_state_zip, cart.billing_label_city_state_zip.text)
    Utils.validate_equal_field(args['pais'].sub('- ', ''), cart.billing_label_country.text)
    Utils.validate_equal_field(args['celular'], cart.billing_label_phone_mobile.text)
    

end 

Dado("avanço para a aba de envio") do 
    cart.button_proceed_shipping.click
    Utils.validate_current_path(cart, Runtime.get_settings.url_shipping)
end 


Dado("confirmo as informações de envio com os parâmetros:") do |parameters|
    args = parameters.hashes.first
    Utils.validate_equal_field(args['total_frete'], cart.label_shipping_full_ship.text)
    if args['aceita_termos_servico'] == 'Sim'
        cart.checkbox_terms_service.click
    end
end

Dado("avanço para a aba de pagamento") do 
    cart.button_proceed_payment.click
    Utils.validate_current_path(cart, Runtime.get_settings.url_payment)
end 


Dado("valido o valor total da compra de {string}") do |preco_total|
    Utils.validate_equal_field(preco_total, cart.label_total_price.text)
end

Dado("escolho o meio de pagamento por {string}") do |meio_pagamento|
    Runtime.set_shared_variable(meio_pagamento)
    if meio_pagamento == 'Cheque'
        cart.module_pay_by_check.click
        Utils.validate_current_path(cart, Runtime.get_settings.url_payment_by_check)
    elsif meio_pagamento == 'Transferência bancária'
        cart.module_pay_by_bank_wire.click
        Utils.validate_current_path(cart, Runtime.get_settings.url_payment_by_bank_wire)
    end
    
    
end

Dado("confirmo o pedido, validando se foi finalizada com sucesso") do 
    cart.button_confirm_order.click
    meio_pagamento = Runtime.get_shared_variable
    if meio_pagamento == 'Cheque'
        Utils.validate_equal_field("Your order on My Store is complete.", cart.label_message_success_check.text)
    elsif meio_pagamento == 'Transferência bancária'
        Utils.validate_equal_field("Your order on My Store is complete.", cart.label_message_success_bank_wire.text)
    end
end 
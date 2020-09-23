Dado("que eu busco pelo produto {string}") do |cloth_description|
  store.input_search_product.set cloth_description
  store.input_search_product_list.click
  Utils.validate_equal_field(cloth_description, store.field_cloth_description.text)
end

Dado("adiciono esse produto ao carrinho, validando o sucesso através da mensagem:") do |parameters|
  args = parameters.hashes.first
  store.button_add_cart.click
  Utils.validate_equal_field(args['mensagem'], store.field_product_added_successfully.text)
end

Dado("prossigo para o checkout") do 
  store.button_proceed_checkout.click
  Utils.validate_current_path(store, Runtime.get_settings.url_checkout)
end


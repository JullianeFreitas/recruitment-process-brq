class StoreObject < SitePrism::Page

    element :input_search_product, "#search_query_top"
    element :input_search_product_list, '.ac_even > strong:nth-child(1)'
    element :field_cloth_description, ".pb-center-column > h1:nth-child(1)"
    element :button_add_cart, "#add_to_cart > .exclusive"
    element :field_product_added_successfully, ".layer_cart_product > h2"
    element :button_proceed_checkout, ".button-medium > span"

end    
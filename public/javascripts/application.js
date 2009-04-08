// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

const DEFAULT_SEARCH_TEXT = 'Enter a product to search for';

function changeDefaultFieldOnFocus(elem) {
  if (elem.value == DEFAULT_SEARCH_TEXT) {
    elem.value = ''
  }
}

function changeDefaultFieldOnBlur(elem) {
  if (elem.value == '') {
    elem.value = DEFAULT_SEARCH_TEXT
  }
}

function addItemToShoppingCart() {
  var search_box_value = document.getElementById('item_name').value
  var shopping_cart_item_html = '<li>'+search_box_value+'</li>'
  Element.insert('shopping-list-content', { bottom: shopping_cart_item_html })
}

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

function insertItemAndHighlight(listId, itemName) {
   var list_item_html = '<li>'+itemName+'</li>'
   Element.insert(listId, { bottom: list_item_html })
   new Effect.Highlight(listId,{});
}

function clearFieldAndFocus(field) {
    field.value = ''
    field.focus()
}

function addItemToShoppingCart() {
  var search_field = document.getElementById('item_name')
  var search_box_value = search_field.value

  if (search_box_value != DEFAULT_SEARCH_TEXT) {
    Element.hide('getting-started')
    insertItemAndHighlight('shopping-list-content', search_box_value)
    clearFieldAndFocus(search_field)
  }
}

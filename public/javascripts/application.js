var DEFAULT_SEARCH_TEXT = 'Enter a product to search for';

function changeDefaultFieldOnFocus(elem, defaultText) {
  if (elem.value == (defaultText == null ? DEFAULT_SEARCH_TEXT : defaultText)) {
    elem.value = ''
  }
}

function changeDefaultFieldOnBlur(elem, defaultText) {
  if (elem.value == '') {
    elem.value = (defaultText == null ? DEFAULT_SEARCH_TEXT : defaultText)
  }
}


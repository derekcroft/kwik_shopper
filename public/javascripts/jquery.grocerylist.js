//
// create closure
//
(function($) {
  //
  // plugin definition
  //
  $.fn.grocerylist = function(options) {
    debug(this);
    // build main options before element iteration
    var opts = $.extend({}, $.fn.grocerylist.defaults, options);
    // iterate and reformat each matched element
    return this.each(function() {
      $this = $(this);
      // build element specific options
      var o = $.meta ? $.extend({}, opts, $this.data()) : opts;
      // update element styles
      $this.css({
        backgroundColor: o.background,
        color: o.foreground
      });
      var markup = $this.html();
      // call our format function
      markup = $.fn.grocerylist.format(markup);
      $this.html(markup);
    });
  };
  //
  // private function for debugging
  //
  function debug($obj) {
    if (window.console && window.console.log)
      window.console.log('hilight selection count: ' + $obj.size());
  };

  //
  // define and expose our format function
  //
  $.fn.grocerylist.format = function(txt) {
    return '<strong>' + txt + '</strong>';
  };

  //
  // define and expose shopping carts and categories
  //
  $.fn.grocerylist.category = {
    initialize: function(name) {
      this.name = name;
      this.items = [];
    },

    addItem: function(itemName) {
      this.items[this.items.length] = itemName;
    }
  };

  $.fn.grocerylist.cart = {
    initialize: function(name) {
      this.name = name;
      this.categories = [];
    },

    addItem: function(itemName, categoryName) {
      category = this.categories.find(function(n) {
        return n.name = categoryName;
      });
      if (category == undefined) {
        category = new Category(categoryName);
        this.categories[this.categories.length] = category;
      }
      category.addItem(itemName);
      alert(this.categories.length);
    },

    toJSON: function() {
      return this.categories.toJSON();
    }

  }
  // plugin defaults
  //
  $.fn.grocerylist.defaults = {
    foreground: 'red',
    background: 'yellow'
  };
  
//
// end of closure
//
})(jQuery);


function addDefaultFieldClicks(fields) {
  jQuery.each(fields, function() {
    // create variables for values within the hash
    var defaultValue = this.defaultValue;

    // add default click and blur behavior to element
    $(this.selector).click(function() {
      if (this.value == defaultValue) this.value = '';
    }).blur(function() {
      if (this.value == '') this.value = defaultValue;
    }).val(defaultValue);
  });
}

// specify the fields with default behaviors
var defaultFields = [
{
  selector: "#item_name",
  defaultValue: 'Enter a product to search for'
},
{
  selector: "#username",
  defaultValue: 'Username'
}
];

// main document ready function
$(document).ready(function() {
  addDefaultFieldClicks(defaultFields);
});

//
//function packShoppingCartIds() {
//  var i=0
//  $('shopping-list-content').eachLi(function(item) {
//    item.setAttribute('item_id', i++);
//  });
//  return i;
//}
//
//function removeItem(itemId) {
//  $('shopping-list-content').select('[item_id="'+itemId+'"]').each(function(item) {
//    Element.remove(item)
//  });
// return packShoppingCartIds();
//}
//
//function insertItemAndHighlight(listId, itemName) {
//   var list_item_html = '<li><a href="#" onclick="removeItem(Element.up(this).readAttribute(\'item_id\')); return false;">'+itemName+'</a></li>'
//   Element.insert(listId, { bottom: list_item_html })
//   new Effect.Highlight(listId,{});
//   return packShoppingCartIds();
//}
//
//function clearFieldAndFocus(field) {
//    field.value = ''
//    field.focus()
//}
//
//function addItemToShoppingCart() {
//  var search_field = document.getElementById('item_name')
//  var search_box_value = search_field.value
//
//  shoppingCart.addItem(search_box_value, "TestCat");
//  alert(shoppingCart.toJSON());
//
//  if (search_box_value != DEFAULT_SEARCH_TEXT && search_box_value != '') {
//    Element.hide('getting-started')
//    insertItemAndHighlight('shopping-list-content', search_box_value)
//    clearFieldAndFocus(search_field)
//  }
//}
//

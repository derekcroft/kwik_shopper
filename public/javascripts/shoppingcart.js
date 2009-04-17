// iterator function for tags
var Iterators = function() {
  var tags = "div p span ul ol li span form input select textarea h1 h2 h3 h4 h5 h6 dl dt em strong";
  var methods = {};
  $A(tags.split(' ')).each(function(tag) {
    methods["each" + tag.charAt(0).toUpperCase() + tag.substring(1)] = function(element, iterator) {
      element = $(element);
      element.cleanWhitespace();
      $A(element.getElementsByTagName(tag)).each(iterator);
    }
  });

  Element.addMethods(methods);
}();

// shopping cart specific JavaScript
var Category = Class.create({
  initialize: function(name) {
    this.name = name;
    this.items = [];
  },

  addItem: function(itemName) {
    this.items[this.items.length] = itemName;
  }
});

var Cart = Class.create({
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
});

var shoppingCart = new Cart("main_cart");


function packShoppingCartIds() {
  var i=0
  $('shopping-list-content').eachLi(function(item) {
    item.setAttribute('item_id', i++);
  });
  return i;
}

function removeItem(itemId) {
  $('shopping-list-content').select('[item_id="'+itemId+'"]').each(function(item) {
    Element.remove(item)
  });
 return packShoppingCartIds();
}

function insertItemAndHighlight(listId, itemName) {
   var list_item_html = '<li><a href="#" onclick="removeItem(Element.up(this).readAttribute(\'item_id\')); return false;">'+itemName+'</a></li>'
   Element.insert(listId, { bottom: list_item_html })
   new Effect.Highlight(listId,{});
   return packShoppingCartIds();
}

function clearFieldAndFocus(field) {
    field.value = ''
    field.focus()
}

function addItemToShoppingCart() {
  var search_field = document.getElementById('item_name')
  var search_box_value = search_field.value

  shoppingCart.addItem(search_box_value, "TestCat");
  alert(shoppingCart.toJSON());

  if (search_box_value != DEFAULT_SEARCH_TEXT && search_box_value != '') {
    Element.hide('getting-started')
    insertItemAndHighlight('shopping-list-content', search_box_value)
    clearFieldAndFocus(search_field)
  }
}


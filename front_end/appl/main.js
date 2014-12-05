$(function() {
  
  var subtotal = 0;
  var tip_perc = 0.15;   // static for now
  var tax_rate = 0.06; // Pennsylvania
  var total = 0;
  var numItems;  // number of items total
  var groupPin;

  var slider;

  // enable and disable pin number submit button
  $('#pin-input').on('keyup', function() {
    var val = $(this).val();
    if(val.length > 0) {
      $('#num-input-submit-button').removeClass('disabled');
      groupPin = parseInt(val, 10);
    } else {
      $('#num-input-submit-button').addClass('disabled');
    }
  });

  // enable and disable name submit button
  $('#name-input').on('keyup', function() {
    var val = $(this).val();
    if(val.length > 0) {
      $('#name-input-submit-button').removeClass('disabled');
    } else {
      $('#name-input-submit-button').addClass('disabled');
    }
  });

  $('#num-input-submit-button').on('click', function() {
    // only go if there is a valid pin number
    if( $('#num-input-submit-button').hasClass('disabled') ) {
      return;
    }

    populateItems(function() {
      slider.go_to_panel(1);
      
      setTimeout(function() {
        $('#name-input').focus();
      }, 500);
    });
    
  });

  $('#name-input-submit-button').on('click', function() {
    // only go if there is a valid pin number
    if( $('#name-input-submit-button').hasClass('disabled') ) {
      return;
    }

    slider.go_to_panel(2);
    
  });

  $('#selection-view-submit-button').on('click', function() {
    // only go if there is a valid pin number
    if( $('#selection-view-submit-button').hasClass('disabled') ) {
      return;
    }

    slider.go_to_panel(3);
    
  });

  $('.credit-card-info>input').on('keyup', function() {
    var name = $('.credit-card-name').val();
    var number = $('.credit-card-number').val();
    var mm = $('.credit-card-month').val();
    var yy = $('.credit-card-year').val();
    var csc = $('.credit-card-csc').val();
    if(name.length > 0 && number.length == 16 && isOnlyNum(number) &&
       mm.length == 2 && yy.length == 2 && csc.length == 3
       && isOnlyNum(mm) && isOnlyNum(yy) && isOnlyNum(csc) &&
       parseInt(mm, 10) <= 12 && parseInt(mm, 10) > 0 ) {
      console.log('yes');
      $('#credit-card-submit-button').removeClass('disabled');
    } else {
      console.log('no');
      $('#credit-card-submit-button').addClass('disabled');
    }
  });


  $('#credit-card-submit-button').on('click', function() {
    // only go if there is a valid pin number
    if( $('#credit-card-submit-button').hasClass('disabled') ) {
      return;
    }
    $('.payment-success-view').removeClass('invisible');
    
  });

  $('.payment-option-card').on('click', function() {
    console.log('here');

    $('.payment-method').addClass('invisible');
    $('.payment-method-card').removeClass('invisible');
    setTimeout(function() {
      slider.go_to_panel(4);
    }, 100);
  });

  $('.payment-option-cash').on('click', function() {
    console.log('here');

    $('.payment-method').addClass('invisible');
    $('.payment-method-cash').removeClass('invisible');
    setTimeout(function() {
      slider.go_to_panel(4);
    }, 100);
  });

  var current_items_screen = 1;
  $('.items-screen-images').on('click', function() {
    current_items_screen++;
    if(current_items_screen>4) {
      slider.go_to_panel(3);
    } else {
      $('.items-screen-image_'+current_items_screen).removeClass('invisible');
    }
  });

  // when an item is clicked

  function registerSelectionItemHandlers() {
    $('.selection-item').on('click', function() {
      $(this).toggleClass('selected');
      calculateTotal();
    });
  }

  // check all button
  $('#selection-view-selectall').on('click', function() {
    if(numItems === undefined) { return; }
    var checkedItems = itemsChecked();
    $('.selection-item').each(function(i, el) {
      if(numItems === checkedItems) {
        $(el).removeClass('selected');
      } else {
        $(el).addClass('selected');
      }
    });
    calculateTotal();
  });

  // tip field
  $('#tip-amount').on('change', function() {
    var val = $(this).val();
    tip_perc = val / 100;
    calculateTotal();
  });

  function init() {
    verticalAlign($('#num-input-main-contents'), -30, true);
    verticalAlign($('#name-input-main-contents'), -30, true);
    verticalAlign($('.payment-options'), -10, true);
    verticalAlign($('.credit-card-info'), -30, true);
    verticalAlign($('.payment-success-view-container'), -40, true);
    verticalAlign($('.payment-method-cash-text'), -40, true);
    
    slider = new Slider('#slider');
    window.slider = slider;

    /* listen key events */
    $(document).on('keydown', function(e) {
      switch(e.keyCode) {
        case(39): slider.next(); break; //right
        case(37): slider.prev(); break; //left
      }
    });
  }

  function isOnlyNum(str) {
    var num = parseInt(str, 10);
    return !isNaN(num) && /^\d+$/.test(str);
  }

  
  // gets items from server and renders them on items screen
  function populateItems(cb) {
    var url = "../data/order1.json";
    $.get(url)
    .done(function(data) {
      console.log(data);
      renderItems(data.order.ordered_items);
      $('#table-num').html( pickATableNumber() );
      if(cb !== undefined) { cb(); }
    })
    .fail(function() {
      alert("error retrieving data from the server");
    });
  }

  function renderItems(items) {
    var $selection_items = $('#selection-items');
    items.map(renderItem).forEach(function($item) {
      $selection_items.append($item);
    });
    numItems = items.length;
    registerSelectionItemHandlers();
  }

  // takes item data and returns jquery object
  function renderItem(itemData, i){
    console.log(itemData);
    var $item = $('<div>').addClass('selection-item');
    var $itemNum = $('<span>').addClass('selection-item-number').html((i+1)+'.');
    var $name = $('<span>').addClass('selection-item-name').html(itemData.item.name);
    var $check = $('<i>').addClass('fa fa-check selection-item-check');
    var $price = $('<span>').addClass('selection-item-price').html(itemData.item.cost);

    $item.append($itemNum);
    $item.append($name);
    $item.append($check);
    $item.append($price);

    return $item;

  }

  // looks at all items to see when are checked and then updates the view
  // with the correct amount
  function calculateTotal() {
    subtotal = 0;
    $('.selection-item.selected').each(function(i, el) {
      var $el = $(el);
      var priceString = $el.find('.selection-item-price').html();
      var price = dollarsToFloat(priceString);
      subtotal += price;
    });
    var tax = tax_rate * subtotal;
    var tip = tip_perc * subtotal;
    total = subtotal + tax + tip;

    $('#selection-view-subtotal-amount').html( floatToDollars(subtotal) );
    $('#selection-view-tax-amount').html( floatToDollars(tax) );
    $('#selection-view-tip-amount').html( floatToDollars(tip) );
    $('#selection-view-total-amount').html( floatToDollars(total) );

    if(subtotal > 0) {
      $('#selection-view-submit-button').removeClass('disabled');
    } else {
      $('#selection-view-submit-button').addClass('disabled');
    }

  }

  function dollarsToFloat(dollarsStr) {
    return parseFloat( dollarsStr.replace('$','') );
  }

  function floatToDollars(num) {
    return '$'+num.toFixed(2);
  }

  // returns the number of items that are checked
  function itemsChecked() {
    var n = 0;
    $('.selection-item').each(function(i, el) {
      if( $(el).hasClass('selected') ) { n+=1; }
    });
    return n;
  } 

  function pickATableNumber() {
    var maxTableNum = 35;
    return (groupPin * 29104) % maxTableNum;
    // return Math.floor(Math.random() * (maxTableNum - 1 + 1)) + 1;
  }


  init();
});
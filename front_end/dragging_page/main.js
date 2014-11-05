$(function() {
  
  var slider;

  // enable and disable pin number submit button
  $('#pin-input').on('keyup', function() {
    var val = $(this).val();
    if(val.length === 6) {
      $('#num-input-submit-button').removeClass('disabled');
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
    slider.go_to_panel(1);
    
    setTimeout(function() {
      $('#name-input').focus();
    }, 500);
    
  });

  $('#name-input-submit-button').on('click', function() {
    // only go if there is a valid pin number
    if( $('#name-input-submit-button').hasClass('disabled') ) {
      return;
    }
    slider.go_to_panel(2);
    
  });

  function init() {
    verticalAlign($('#num-input-main-contents'), -30, true);
    verticalAlign($('#name-input-main-contents'), -30, true);
    
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

  init();
});
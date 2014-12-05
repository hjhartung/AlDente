(function() {

  // elements to actively maintain at their centered position
  // on window resizes
  var actives = [];

  $(window).on('resize', function() {
    actives.forEach(function(data) {
      verticalAlign(data['$el'], data['offset']);
    });
  });
  
  window.verticalAlign = function verticalAlign($el, offset, active) {
    if(offset === undefined) { offset = 0; }
    if(active === undefined) { offset = false; }
    var height = $el.height(),
        $parent = $el.parent(),
        parentHeight = $parent.height();

    var top = (parentHeight / 2) - (height / 2) + offset;

    $el.css('top', top+'px');

    if(active) { actives.push({'$el': $el, 'offset': offset}); }
  };

})();
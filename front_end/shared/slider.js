;(function(){
  
  function Slider(s){this.init(s);}
  Slider.prototype = {
    init: function(selector) {
      this._$els = {
        slider: $(selector),
        wrapper: $($(selector).children().get(0)),
        panels: $($(selector).children().get(0)).children()
      };

      this._data = {
        transition_time: 250
      };

      setup_el.call(this);
      $(window).on('resize', function(e) {
        handle_resize.call(this);
      }.bind(this));
    },
    
    next: function() {
      if( !this.has_next() ) return;
      this.go_to_panel(this.current_panel()+1);
    },

    prev: function() {
      if( !this.has_prev() ) return;
      this.go_to_panel(this.current_panel()-1);
    },

    current_panel: function() {
      return this._data.current_panel;
    },

    has_next: function() {
      return this.current_panel() < this.number_of_panels() - 1;
    },

    has_prev: function() {
      return this.current_panel() > 0;
    },

    number_of_panels: function() {
      return this._$els.panels.length;
    },

    /* moves slides to panel n, if no_effect
    then turns off slides  */
    go_to_panel: function(n, no_effect) {
      var old_id = this.current_panel();
      /* check bounds */
      if(n<0 || n>=this._$els.panels.length) return;

      this._data.current_panel = n;

      if (no_effect) turn_off_transition.call(this);
      else turn_on_transition.call(this);

      var width = this._$els.slider.width();
      var offset = width * n * (-1);

      this._$els.wrapper.css({
        '-webkit-transform': 'translate3d('+offset+'px, 0, 0)',
        '-moz-transform': 'translate3d('+offset+'px, 0, 0)',
        'transform': 'translate3d('+offset+'px, 0, 0)'
      });

      /* fix height of slider depending on which
      panel is taller */

      adjust_height.call(this, this.current_panel(), old_id);


      if(this._data.trans_timeout) clearTimeout(this._data.trans_timeout);
      this.show_all_panels();
      this._data.trans_timeout = setTimeout(function(){
        this.hide_all_panels_except(n);
        // adjust_height.call(this);
        this._data.trans_timeout = undefined;
      }.bind(this), this._data.transition_time+200);

    },

    set_transition_time: function(ms) {
      this._data.transition_time = ms;
      turn_off_transition.call(this);
      turn_on_transition.call(this);
    },

    hide_all_panels_except: function(n) {
      return;
      this._$els.panels.each(function(i, panel) {
        var vis;
        var height;
        if (n===i) {
          vis = 'visible'
          height = '100%';
        }
        else{
          vis = 'hidden';
          height = '1%';
        }
        $(panel).css({
          'visibility': vis,
          // 'height': height
        });
      });
    },

    show_all_panels: function() {
      this._$els.panels.css({
        'visibility': 'visible',
        // 'height': '100%'
      });
    },


  };

  /* private methods */
  function turn_off_transition() {
    if(!this._data.transition_on) return;

    this._$els.wrapper.css({
      '-moz-transition' : '',
      '-webkit-transition' : '',
      'transition' : ''
    });

    this._data.transition_on = false;
  }

  function turn_on_transition() {
    if(this._data.transition_on) return;

    var t = this._data.transition_time;
    
    this._$els.wrapper.css({
      '-moz-transition' : '-moz-transform '+t+'ms ease-in-out',
      '-webkit-transition' : '-webkit-transform '+t+'ms ease-in-out',
      'transition' : 'transform '+t+'ms ease-in-out'
    });

    this._data.transition_on = true;
  }

  function handle_resize() {
    turn_off_transition.call(this);

    var slider = this._$els.slider;
    var wrapper = this._$els.wrapper;
    var panels = this._$els.panels;

    var slider_width = slider.width();
    wrapper.width(panels.length * slider_width);
    panels.width(slider_width);

    this.go_to_panel(this.current_panel(), false);

  }

  /* makes of slider equal to height of
  the currently active panel */
  function adjust_height(new_id, old_id) {
    var new_height = $(this._$els.panels[new_id]).height() || 0;
    var old_height = $(this._$els.panels[old_id]).height() || 0;
    if(new_height >= old_height) {
      this._$els.slider.height(new_height);
    }
    else {
      setTimeout(function() {
        this._$els.slider.height(new_height);
      }.bind(this), this._data.transition_time+200);
    }
    // this._$els.wrapper.height(height);


  }

  /* sets the appropriate CSS on the
  Slider's $el */
  function setup_el(){
    var slider = this._$els.slider;
    var wrapper = this._$els.wrapper;
    var panels = this._$els.panels;
    
    slider.css({
      'overflow': 'hidden',
      // 'height': '100%'
    });

    wrapper.css({
      // 'height': '100%'

    });

    panels.css({
      'float': 'left',
      // 'height': '100%'
    });

    wrapper.append($('<div>').addClass('clearfix'));

    this.go_to_panel(0);
    handle_resize.call(this);
  }

  /* export to global scope */
  window.Slider = Slider;
})();
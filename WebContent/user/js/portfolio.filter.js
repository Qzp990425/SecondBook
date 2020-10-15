
/* Portfolio Sorting/Filtering Script
-------------------------------------------------------------------------------------*/

(function($) {
    $.fn.sorted = function(customOptions) {
        var options = {
            reversed: false,
            by: function(a) {
                return a.text();
            }
        };
        $.extend(options, customOptions);
    
        $data = $(this);
        arr = $data.get();
        arr.sort(function(a, b) {
            
            var valA = options.by($(a));
            var valB = options.by($(b));
            if (options.reversed) {
                return (valA < valB) ? 1 : (valA > valB) ? -1 : 0;              
            } else {        
                return (valA < valB) ? -1 : (valA > valB) ? 1 : 0;  
            }
        });
        return $(arr);
    };

})(jQuery);

$(function() {
  
  var read_button = function(class_names) {
    var r = {
      selected: false,
      type: 0
    };
    for (var i=0; i < class_names.length; i++) {
      if (class_names[i].indexOf('current') == 0) {
        r.selected = true;
      }
    };
    return r;
  };
  
  var determine_sort = function($buttons) {
    var $selected = $buttons.parent().filter('[class*="current"]');
    return $selected.find('a').attr('id');
  };
  
  var determine_kind = function($buttons) {
    var $selected = $buttons.parent().filter('[class*="current"]');
    return $selected.find('a').attr('id');
  };
  
  var $list = $('#filter');
  var $data = $list.clone();
  
  var $controls = $('#filter-list');
  
  $controls.each(function(i) {
    
    var $control = $(this);
    var $buttons = $control.find('a');
    
    $buttons.bind('click', function(e) {
      
      var $button = $(this);
      var $button_container = $button.parent();
      var button_properties = read_button($button_container.attr('class').split(' '));      
      var selected = button_properties.selected;
      var button_segment = button_properties.segment;

      if (!selected) {

        $buttons.parent().removeClass('current'); $button_container.addClass('current');
        
        var sorting_type = determine_sort($controls.eq(1).find('a'));
        var sorting_kind = determine_kind($controls.eq(0).find('a'));
        
        if (sorting_kind == 'all') {
          var $filtered_data = $data.find('li');
        } else {
          var $filtered_data = $data.find('li.' + sorting_kind);
        }
        
        if (sorting_type == 'size') {
          var $sorted_data = $filtered_data.sorted({
            by: function(v) {
              return parseFloat($(v).find('span').text());
            }
          });
        } else {
          var $sorted_data = $filtered_data.sorted({
            by: function(v) {
              return $(v).find('strong').text().toLowerCase();
            }
          });
        }
        
         $list.quicksand($sorted_data, {
            easing: 'easeInOutQuad',
            duration: 800
         }, function() {
            
            // Callback a script after sorting the portfolio items
            
            $(document).ready(function(){
                
                // Pagination

                if( $("#jPages").length ) {
                    $("div.holder").jPages({
                        containerID: "filter",
                        perPage: 8,
                        startPage: 1,
                        startRange: 1,
                        midRange: 15,
                        endRange: 1,
                        links: "blank",
                        previous: "previous",
                        next: "next"
                    });
                }
                
                // Image Overlays
                    
                $('.lower-panel').mosaic({
                    animation: 'slide'
                });
                
                $('.upper-panel').mosaic({
                    animation: 'slide',
                    anchor_y: 'top'
                });
            
                $('.zoom').mosaic({
                    opacity: 0.7
                });
                
                // Circle
                
                if( $(".multi").length ) {
                    $('.multi').cycle({ 
                        fx:     'scrollVert', 
                        speed:   500, 
                        timeout: 0, 
                        next:   '#down', 
                        prev:   '#up' 
                    });
                }
                
                // Image Tooltip
                
                if( $(".imageTooltip").length ) {
                    $(".imageTooltip .imagebox a").tooltip({
                        showTitle: true,
                        track: true, 
                        bodyHandler: function() {
                            return $("<img/>").attr("src", $(this).attr("rel"));
                        }
                    });
                }

                // prettyPhoto
                
                $("#filter a[rel^='prettyPhoto']").prettyPhoto({
                    theme: 'light_square', // or "dark_square" for dark style
                    animation_speed: 'fast',
                    overlay_gallery: false
                });
                
                // External Link Replacement
                
                $('a[rel="external"]').each(function(){
                    $(this).attr('target', '_blank');
                });
                
                //--> End

            });
        });
    }  
    e.preventDefault();
    });
    
  }); 
  
});
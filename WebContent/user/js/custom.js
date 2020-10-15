
/* Top Menu
-------------------------------------------------------------------------------------*/

$(document).ready(function(){
    //<![CDATA[
        $('ul#menu').superfish({
            delay:       0,
            animation:   {opacity: 'show', height: 'show'},
            speed:       'fast'
        });
    //]]>
});

/* Social Media
-------------------------------------------------------------------------------------*/

$(document).ready(function() {
    $(".social li img").hover(
        function() { this.src = this.src.replace("_off", "_on");
    },
        function() { this.src = this.src.replace("_on", "_off");
    });
});

/* Scroll to Top
-------------------------------------------------------------------------------------*/

$(function() {
    $(window).scroll(function() {
        if($(this).scrollTop() != 0) {
            $('#toTop').fadeIn();   
        } else {
            $('#toTop').fadeOut();
        }
    });
 
    $('#toTop').click(function() {
        $('body, html').animate({scrollTop:0},800);
    }); 
});

/* External Link Replacement
-------------------------------------------------------------------------------------*/

$(document).ready(function(){
    $('a[rel="external"]').each(function(){
        $(this).attr('target', '_blank');
    });
});

/* Image Opacity Rollover Plugin
-------------------------------------------------------------------------------------*/

/* 
 *  Copyright (c) 2009 Trent Foley (http://trentacular.com)
 *  Licensed under the MIT License:
 *  http://www.opensource.org/licenses/mit-license.php
 */
 
$(document).ready(function(){
    var defaults = {
        mouseOutOpacity:   1.0,
        mouseOverOpacity:  0.7,
        fadeSpeed:         'fast',
        exemptionSelector: '.selected'
    };

    $.fn.opacityrollover = function(settings) {
        // Initialize the effect
        $.extend(this, defaults, settings);

        var config = this;

        function fadeTo(element, opacity) {
            var $target = $(element);
            
            if (config.exemptionSelector)
                $target = $target.not(config.exemptionSelector);    
            
            $target.fadeTo(config.fadeSpeed, opacity);
        }

        this.css('opacity', this.mouseOutOpacity)
            .hover(
                function () {
                    fadeTo(this, config.mouseOverOpacity);
                },
                function () {
                    fadeTo(this, config.mouseOutOpacity);
                });

        return this;
    };
    
    $('.rollover img').opacityrollover({
        mouseOutOpacity:   1.0,
        mouseOverOpacity:  0.7,
        fadeSpeed:         'fast',
        exemptionSelector: '.selected'
    });

    $('.rollout img').opacityrollover({
        mouseOutOpacity:   0.7,
        mouseOverOpacity:  1.0,
        fadeSpeed:         'fast',
        exemptionSelector: '.selected'
    });
    
});

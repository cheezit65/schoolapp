// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
//= require jquery.slick

var request;
var $current;
var cache   ={};
var $frame  = $('#photo-viewer');
var $thumb  = $('.thumb');

function crossfade($img){
    if ($current) {
        $current.stop().fadeOut('slow');
    }
    
    img.css({
        marginLeft: -$img.width() /2,
        marginTop: -$img.height() /2
    });
    
    $img.stop().fadeTo('slow', 1);
    
    $current = $img;
}

$(document).on('click', '.thumb', function(e){
    var $img;
    var src = this.href;
    request = src;
    
    e.preventDefault();
    
    $thumbs.removeClass('active');
    $(this).addClass('active');
    
    if (cache.hasOwnProperty(src)){
        if (cache[src].isLoading === false){
            crossfade(cache[src].$img);
        }
    } else {
        $img = $('<img/>');
        cache[src] = {
            $img: $img,
            isLoading: true
        };
        
        $img.on('load', function(){
            $img.hide();
            $frame.removeClass('is-loading').append($img);
            cache[src].isLoading = false;
            if (request === src){
                crossfade($img);
            }
        });
        
        $frame.addClass('is-loading');
        
        $img.attr({
            'src': src,
            'alt': this.title || ''
        });
    }
});

$('.thumb').eq(0).click();



#= require jquery
#= require jquery_ujs
#= require bootstrap-sprockets
#= require masonry/jquery.masonry
#= require imagesloaded
#= require_self

$ ->
  $('#notice-collection').imagesLoaded ->
    $('#notice-collection').masonry
      itemSelector: '.notice-item'
      columnWidth: 0

// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap
//= require_tree .


$(".new-list-button").on('click', function(){
  setTimeout(function() {
    $('.create-new-list-form').fadeToggle("fast");
  }, 0);
});

 $(".list-group-item").on('click', function(){

    $(this).toggleClass('disabled');
    if ($('.list-group').find('.disabled').length > 0) {
      $('.delete-todo-button').show();
    } else {
      $('.delete-todo-button').hide();
    };
    
 });
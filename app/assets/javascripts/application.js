// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
$(document).on('turbolinks:load', function(){
  $("#post_term").keyup(function(){
    autocomplete()
  });

  function autocomplete(){
    $.ajax({
      url: '/posts/ajax_search',
      type: 'GET',
      data: {query: $("#post_term").val()},
//takes the form data and authenticity toke and converts it into a standard URL
      dataType: 'json', //specify what type of data you're expecting back from the servers
      error: function() {
          console.log("Something went wrong");
      },
      success: function(data) {

        $("#caption").html("");

        data.forEach(function(element) {
          var option = document.createElement("option");
          option.value = element;
          //append option to list
          $("#caption").append(option);
          console.log(option)
        });
      }
    });
  }
});

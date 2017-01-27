// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require foundation
//= require_tree .

$(function(){
  $(document).foundation();
});

$(document).ready(function() {
  if (document.getElementById('upvote')) {
    $('#upvote').on('click', function(me) {
      me.preventDefault();

      var $this = $(this);
      var reviewId = document.getElementById('upvote').dataset.reviewid;
      var monsterId = document.getElementById('upvote').dataset.monsterid;

      var request = $.ajax({
        method: "POST",
        url: '/monsters/' + monsterId + '/reviews/' + reviewId + '/votes/handle_vote',
        data: { value: "+" }
      });

      request.done(function() {
        var response = $.ajax({
          method: "GET",
          url: '/reviews/' + reviewId,
        });

        response.done(function() {
          $('#upvote-count').html(response.responseJSON.upvotes);
          $('#downvote-count').html(response.responseJSON.downvotes);
        });
      });
    });

    $('#downvote').on('click', function(me) {
      me.preventDefault();

      var $this = $(this);
      var reviewId = document.getElementById('downvote').dataset.reviewid;
      var monsterId = document.getElementById('downvote').dataset.monsterid;

      var request = $.ajax({
        method: "POST",
        url: '/monsters/' + monsterId + '/reviews/' + reviewId + '/votes/handle_vote',
        data: { value: "-" }
      });

      request.done(function() {
        var response = $.ajax({
          method: "GET",
          url: '/reviews/' + reviewId,
        });

        response.done(function() {
          $('#upvote-count').html(response.responseJSON.upvotes);
          $('#downvote-count').html(response.responseJSON.downvotes);
        });
      });
    });
  }
});

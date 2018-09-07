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
//= require turbolinks
//= require_tree .

$(document).ready(function () {
  // Collapse sidebar
  $('#sidebarCollapse').on('click', function () {
    $('#sidebar').toggleClass('active');
    $(this).toggleClass('active');
  });

  // Pusing save button
  $('.pulse-save').on({
    'click': function(e) {
      $(this).trigger('reset');
    },

    // Success function aka saved
    'saved': function(e) {
      $(this)
        .addClass('ok')
        .removeClass('error')
        .text('OK');
    },

    // Failed function aka error
    'error': function(e) {
      $(this)
        .addClass('error')
        .removeClass('ok')
        .text('ERROR');
    },

    // Resets the success and failure statues. Send form that includes the button
    'reset': function(e) {
      $(this)
        .removeClass('ok error')
        .text('SAVE');

      form = $(this).parents('form');

      $.ajax({
        url: form.attr('action'),
        data: form.serialize(),
        type: 'POST',
        success: function(xhr) {
          var t = setTimeout(function() {
            $('.pulse-save').trigger('saved');
            // Redirect to url sent by the backend
            window.location.href = xhr.redirect_url;
          }, 2000);
        },
        error: function(xhr) {
          var t = setTimeout(function() {
            $('.pulse-save').trigger('error');
            // TODO: Change this to put the errors in the page
            alert($.parseJSON(xhr.responseText).errors.join('\n'));
          }, 2000);
        }
      });
    }
  })
});

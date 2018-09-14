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

$(function () {
  // Collapse sidebar
  $('#sidebarCollapse').on('click', function () {
    $sidebar = $('#sidebar');
    if ($sidebar.hasClass('active')) {
      Cookies.set('aymishd', 'open');
    } else {
      Cookies.set('aymishd', 'close');
    }
    $sidebar.toggleClass('active');
    $(this).toggleClass('active');
  });

  // Initialize tooltips
  $('[data-toggle="tooltip"]').tooltip(
    {delay: {show: 1000, hide: 100}}
  );

  // Fetch comment and display in modal textbox
  $(".js-answer-comment-btn").click(function() {
    cont = $(this).data('postpoint');
    id = $(this).data('answer-id');
    target = $(this).data('target')

    $.ajax({
      url: '/' + cont + '/get_comment/' + id,
      type: 'GET',
      success: function(xhr) {
        $(target + ' textarea').val(xhr.comment);
        $(target + ' #answer_comment_id').val(id);
      },
      error: function(xhr) {
        console.log(xhr);
        alert($.parseJSON(xhr.responseText).errors);
      }
    });
  });

  // Fetch comment and display in modal paragraph
  $(".js-answer-comment-view").click(function() {
    cont = $(this).data('postpoint');
    id = $(this).data('answer-id');
    target = $(this).data('target')

    $.ajax({
      url: '/' + cont + '/get_comment/' + id,
      type: 'GET',
      success: function(xhr) {
        $(target + ' p').text(xhr.comment);
      },
      error: function(xhr) {
        console.log(xhr);
        alert($.parseJSON(xhr.responseText).errors);
      }
    });
  });

  //Modal save comment
  $('#write-comment-modal').on('hide.bs.modal', function() {
    cont = $(this).data('postpoint');
    point_id = $('#answer_comment_id').val();
    comment = $(this).find('textarea').val();

    $.ajax({
      url: '/' + cont + '/' + point_id,
      data: { 'answer[comment]': comment},
      type: 'PATCH',
      success: function(xhr) {
        if(xhr.comment == true) {
          $('.js-answer-comment-btn[data-answer-id="'+point_id+'"]').removeClass('opaque');
        } else {
          $('.js-answer-comment-btn[data-answer-id="'+point_id+'"]').addClass('opaque');
        }
      },
      error: function(xhr) {
        console.log(xhr);
        alert($.parseJSON(xhr.responseText).errors);
      }
    })
  });

  // Pulsing save button
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

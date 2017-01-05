( function($, Materialize) {
$(function() {

  function showProgress(e) {
    var $button = $(e.target);
    var $row = $button.closest('.long-job-button-row');
    $row.find('button').hide();
    $row.find('.show-progress').show();
  }

  $('.button-collapse').sideNav();
  $('select').material_select();

  $('.long-job-button-row button').click(showProgress);


  if (typeof toastMessage !== 'undefined') {
    Materialize.toast(toastMessage, 4000);
  }

});
} )(jQuery, Materialize);
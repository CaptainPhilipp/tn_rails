$(document).ready(function() {
  $('.edit_train_open').click(function(e) {
    var id = $(this).data('trainId');
    $(".edit_train_form").hide();
    $(".edit_train_row").show();

    $("#train_row_" + id).hide();
    $("#train_form_" + id).show();
  });

  $('.edit_train_close').click(function(e) {
    e.preventDefault();
    var id = $(this).data('trainId');
    $("#train_form_" + id).hide();
    $("#train_row_"  + id).show();
  });
});

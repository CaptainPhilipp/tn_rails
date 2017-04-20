$(document).ready(function() {
  $('.open_edit_form').click(function() {
    var id = $(this).data('objectId');
    $(".edit_form").hide();
    $(".edit_row").show();

    $("#edit_row_" + id).hide();
    $("#edit_form_" + id).show();
  });

  $('.close_edit_form').click(function(e) {
    e.preventDefault();
    var id = $(this).data('objectId');
    $("#edit_form_" + id).hide();
    $("#edit_row_"  + id).show();
  });
});

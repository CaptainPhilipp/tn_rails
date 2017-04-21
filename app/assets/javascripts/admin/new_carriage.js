$(document).on("turbolinks:load", function() {
  $('#carriage_type').change(function() {
    console.log('change');
    var field_groups = $('.carriage_type')
    field_groups.hide();
    field_groups.find('input:text').val(0);

    var type = ""
    if(type) {
      type = $(this).find('option:selected').val();
    } else {
      type = $('#current_type').text();
    }
    $("#" + type).show();
  });
});

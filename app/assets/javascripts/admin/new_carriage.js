$(document).on("turbolinks:load", function() {
  var collectionSelect = $('#carriage_type')

  changeFieldset = function() {
    var field_groups = $('.carriage_type')
    field_groups.hide();
    field_groups.find('input:text').val(0);
    type = collectionSelect.find('option:selected').val();
    $("#" + type).show();
  };

  changeFieldset();
  collectionSelect.change(function() { changeFieldset() });
});

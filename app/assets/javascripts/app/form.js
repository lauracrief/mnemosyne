$(document).ready(function() {
  $('.checkbox input:checkbox').change(function(){
    if($(this).is(":checked")) {
      $(this).parent().addClass("checked");
    } else {
      $(this).parent().removeClass("checked");
    }
  });
});

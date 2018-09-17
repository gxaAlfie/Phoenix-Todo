$(document).ready(function(){
  $("input[type='checkbox']").on("change", function(){
    var $taskTitle = $(this).parent().siblings(".pull-left").find("h3")
    if(this.checked) {
      $taskTitle.addClass("strike")
    } else {
      $taskTitle.removeClass("strike")
    }
  })
})

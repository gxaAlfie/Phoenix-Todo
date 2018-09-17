$(document).ready(function(){
  $("input[type='checkbox']").on("change", function(){
    var $taskTitle = $(this).parent().siblings(".pull-left").find("h3")
    if(this.checked) {
      $taskTitle.addClass("strike")
    } else {
      $taskTitle.removeClass("strike")
    }
  })

  $("[data-toggle=popover]").popover({
    html: true,
    content: function() {
      return $("#add-task-form").html()
    }
  }).on("shown.bs.popover", function(){
    $(".popover-body #task-item-accomplish-at").datetimepicker()
  }).on("hide.bs.popover", function(){
    $(".popover-body #task-item-accomplish-at").datetimepicker("destroy")
  })
})

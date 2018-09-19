$(document).ready(function(){
  $("input[type='checkbox']").on("change", function() {
    var $taskTitle = $(this).parents(".task-item-actions").siblings(".task-item-details").find(".task-title")
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
    $(".popover-body .input-group-append").on("click", function(){
      $(".popover-body #task-item-accomplish-at").datetimepicker("show")
    })
  }).on("hide.bs.popover", function(){
    $(".popover-body #task-item-accomplish-at").datetimepicker("destroy")
  })
})

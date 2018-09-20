let datepicker = function() {
  $("[data-toggle=popover]").popover({
    html: true,
    content: function() {
      return $("#add-task-form-container").html()
    }
  }).on("shown.bs.popover", function(){
    $(".popover-body #task-item-accomplish-at").datetimepicker({
      closeOnDateSelect: true
    })
    $(".popover-body .input-group-append").on("click", function(){
      $(".popover-body #task-item-accomplish-at").datetimepicker("show")
    })
  }).on("hide.bs.popover", function(){
    $(".popover-body #task-item-accomplish-at").datetimepicker("destroy")
  })
}

export { datepicker }

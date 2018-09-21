let datepicker = function() {
  $("[data-toggle=popover]").popover({
    html: true,
    content: function() {
      return $("#add-task-form-container").html()
    }
  }).on("shown.bs.popover", function(){
    $(".popover-body #task-item-accomplish-at").datetimepicker({
      format: 'Y/m/d H:00',
      closeOnDateSelect: true,
      minDate: 0
    })
    $(".popover-body .input-group-append").on("click", function(){
      $(".popover-body #task-item-accomplish-at").datetimepicker("show")
    })
  }).on("hide.bs.popover", function(){
    $(".popover-body #task-item-accomplish-at").datetimepicker("destroy")
  })
}

export { datepicker }

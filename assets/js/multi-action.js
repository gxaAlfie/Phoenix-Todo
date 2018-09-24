let handleMultiSelect = function() {
  $(".update-task-item").on("click", function(){
    let isFinishedAction = $(this).parent().data("finished")
    let $parentContainer = $(".tab-pane")

    let checkedTaskIds = $parentContainer.find("input[type='checkbox']:checked").map(function(){
      return $(this).closest(".task-item").data("id")
    }).get()

    $.ajax({
      url: "/api/task_item",
      method: "put",
      data: {
        id: checkedTaskIds,
        status: isFinishedAction
      },
      success: function(response) {
        location.reload()
      }
    })
  })

  $(".delete-task-item").on("click", function() {
    let isFinishedAction = $(this).parent().data("finished")
    let $parentContainer = $(".tab-pane")

    let checkedTaskIds = $parentContainer.find("input[type='checkbox']:checked").map(function(){
      return $(this).closest(".task-item").data("id")
    }).get()

    $.ajax({
      url: "/api/task_item",
      method: "delete",
      data: {
        id: checkedTaskIds
      },
      success: function(response) {
        $(".task-item").each(function(){
          if (checkedTaskIds.includes($(this).data("id"))) {
            $(this).fadeOut("fast", function(){
              $(this).remove()

              let remainingTaskItems = $parentContainer.find(".task-item").length
              let isMultiActionDisabled = remainingTaskItems == 0
              $parentContainer.find(".multi-action-container button").prop("disabled", isMultiActionDisabled)
            })
          }
        })
      }
    })
  })
}

export { handleMultiSelect }

let strikethrough = function() {
  $("input[type='checkbox']").on("change", function() {
    var $taskTitle = $(this).parents(".task-item-actions").siblings(".task-item-details").find(".task-title")
    if(this.checked) {
      $taskTitle.addClass("strike")
    } else {
      $taskTitle.removeClass("strike")
    }

    var $categoryContainer = $(this).closest(".tab-pane")
    var checkedItemsCount = $categoryContainer.find("input[type='checkbox']:checked").length

    if(checkedItemsCount == 0) {
      $categoryContainer.find(".multi-action-container button").prop("disabled", true)
    } else {
      $categoryContainer.find(".multi-action-container button").prop("disabled", false)
    }
  })
}

export { strikethrough }

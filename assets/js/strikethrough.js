let strikethrough = function() {
  $("input[type='checkbox']").on("change", function() {
    var $taskTitle = $(this).parents(".task-item-actions").siblings(".task-item-details").find(".task-title")
    if(this.checked) {
      $taskTitle.addClass("strike")
    } else {
      $taskTitle.removeClass("strike")
    }
  })
}

export { strikethrough }

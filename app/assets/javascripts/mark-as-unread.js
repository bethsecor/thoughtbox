function markAsUnread() {
  $("#links-list").delegate("#unread", 'click', function() {
    var $button = $(this);
    var $link = $button.closest(".link");

    var linkUnread = {
      link: {
        read: false
      }
    };

    $.ajax({
      type: "PUT",
      url: "/api/v1/links/" + $link.attr('data-id') + ".json",
      data: linkUnread,
      success: function(updateLink) {
        $link.attr('data-read', "false");
        $link.removeClass("read-true");
        $link.addClass("read-false");
        $button.replaceWith("<button name='read' id='read'>Mark As Read</button>");
      },
      error: function(xhr) {
        console.log(xhr.responseText);
      }
    });
  });
}

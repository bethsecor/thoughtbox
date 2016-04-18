function markAsRead() {
  $("#links-list").delegate("#read", 'click', function() {
    var $button = $(this);
    var $link = $button.closest(".link");

    var linkRead = {
      link: {
        read: true
      }
    };

    $.ajax({
      type: "PUT",
      url: "/api/v1/links/" + $link.attr('data-id') + ".json",
      data: linkRead,
      success: function(updateLink) {
        $link.attr('data-read', "true");
        $link.removeClass("read-false");
        $link.addClass("read-true");
        $button.replaceWith("<button name='unread' id='unread'>Mark As Unread</button>");
      },
      error: function(xhr) {
        console.log(xhr.responseText);
      }
    });
  });
}

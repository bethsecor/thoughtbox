function filterStatus() {
  $('#link_status_filter').on('change', function(){
    var status = this.value;
    $('.link').each(function(index, link) {
      var $link = $(link);
      var link_status = $link.data('read') ? "Read" : "Unread";

      if (status === "") {
        $link.show();
      } else if (link_status === status) {
        $link.show();
      } else {
        $link.hide();
      }
    });
  });
}

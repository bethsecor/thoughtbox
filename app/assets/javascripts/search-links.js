function searchLinks() {
  $('#link_search_filter').on('keyup', function(){
    var searchLink = this.value.toLowerCase();
    $('.link').each(function(index, link) {
      var $link = $(link);

      if ($link.data('title').toLowerCase().indexOf(searchLink) >= 0) {
        $link.show();
      } else {
        $link.hide();
      }
    });
  });
}

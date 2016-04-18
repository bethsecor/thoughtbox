function sortAlphabetically() {
  $('#sort-alphabetically').on('click', function(){
    $("#links-list .link").sort(function (a, b) {
        if ( ($(a).attr("data-title").toLowerCase() > $(b).attr("data-title").toLowerCase()) )  {
            return 1;
        } else if ( ($(a).attr("data-title").toLowerCase() == $(b).attr("data-title").toLowerCase()) ){
            return 0;
        } else {
            return -1;
        }
    }).each(function () {
        var elem = $(this);
        elem.remove();
        $(elem).appendTo("#links-list");
    });
  });
}

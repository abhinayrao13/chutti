$(document).ready(function() {
  $("#checks").infinitescroll( {
    navSelector: "nav.pagination",
    nextSelector: "nav.pagination a[rel=next]",
    itemSelector: "#checks"
  });
})

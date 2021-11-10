$(document).on('turbolinks:load', function() {  //<<-----------------------------------------
  $(".likeList").click(function() {
      $("#likeitems").empty();  // <<----------------- empty the unordered-list node before insert new child nodes
      const userNames = $(this).attr("likes-data").split(',');
      // console.log("HELLO", userNames);
      for(name of userNames) {
        $("#likeitems").append(`<li><a href="/profile/${name}">${name}</a></li>`)  //<<-------- can't use the path helper
      }               // << javascript string interpolation
      $("#likesModal").show();
    });
});
  
$(document).on('turbolinks:load', function() {  //<<-----------------------------------------
  $(".likeList").click(function() {
      $("#likeitems").empty();
      const userNames = $(this).attr("likes-data").split(',');
      console.log("HELLO", userNames);
      for(name of userNames) {
        $("#likeitems").append(`<li><a href="/profile/${name}">${name}</a></li>`)
      }
      $("#likesModal").show();
    });
});
  
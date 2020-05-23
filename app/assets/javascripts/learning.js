$(function(){
  let clickNum = 0;
  $(".menu-icon").click(function(){
    clickNum += 1
    if (clickNum % 2 === 0){
      $(".pulldownlist").hide();
    } else {
      $(".pulldownlist").show();
    }
  });
});
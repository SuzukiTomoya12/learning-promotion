$(function(){
  $(window).on('load', function(){
    let url = location.href
    if (url == 'http://localhost:3000/reports/new' || url == 'http://18.176.92.110/reports/new') {
      console.log('OK');
    }
  });
});
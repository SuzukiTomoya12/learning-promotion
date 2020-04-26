$(function(){
  $('.submit').on('click',function(){
    let tagId = $(this).attr('id');
    let userId = $('.user_id').attr('value');
    let url = `/users/${userId}/register`;
    $.ajax({
      type: 'POST',
      url: url,
      data: { tag_id: tagId },
      dataType: 'json'
    })
    .done(function(){
      console.log('成功です');
    })
    .fail(function() {
      alert("メッセージ送信に失敗しました");
    });
  });
});
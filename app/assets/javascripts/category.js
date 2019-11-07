window.addEventListener('DOMContentLoaded',function(){ 
  $(function(){

    // カテゴリーの値が入ったらカテゴリテーブルからデータを拾って挿入
    $(document).on('change','#item_category_id',function(e){
      e.preventDefault();
      
      var url = $(this).attr('action');
      $.ajax({
        type: 'GET',
        url: '/users',
        data: { keyword: input}, 
        dataType: 'json'
      })
      .done(function(data) {  
        
        var html = buildHTML(data);      
        $('.messages').append(html);     
        $('#new_message')[0].reset();
        $('.messages').animate({scrollTop: $('.messages')[0].scrollHeight});     
      })
      .fail(function() {
        alert('送信に失敗しました');
      })
      .always(function(){
        $('.form__submit').prop('disabled',false);
      })
  






      $(".hidden-category-second-field").css('display',"block");
    });





    $(document).on('change','#item_category_id',function(){
      $(".hidden-category-third-field").css('display',"block");
    });

    $(document).on('change','#item_category_id',function(){
      $(".hidden-size-field").css('display',"block");
      $(".hidden-brand-field").css('display',"block");
    })

    $(document).on('change','#item_delivery_cost',function(){
      $(".hidden-delivery-field").css('display',"block");
    });

  }); 
});



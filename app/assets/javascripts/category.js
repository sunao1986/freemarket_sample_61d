window.addEventListener('DOMContentLoaded',function(){ 
  $(function(){
  
    function selectHTML(option){
      var html = `<div class="hidden-category-second-field">
                    <div class="hidden-category-second-field__box">
                      <select name="item[category_id]" id="item_category_id" >
                        ${option}
                      </select>
                    </div>
                  </div>`
      return html;
    }

    // カテゴリーの値が入ったらカテゴリテーブルからデータを拾って挿入
    $(document).on('change','#item_category_id',function(e){
      e.preventDefault();
      // inputには選択した親カテゴリのidが入る
      // var input = {request: $('#item_category_id').val()};
      var input = $(this).val();
      console.log(input);
      $.ajax({
        type: 'GET',
        url: '/items/new',
        data: { ancestry: input}, 
        dataType: 'json',
      })

      .done(function(data) {  
        console.log(data);       
        // 配列jsonで取得した子カテゴリデータを変数に入れる
        var option = []
        $.each(data,
          function(index,child) {
          option += `<option value="${index}">${child.id}</option>`
          console.log(option); 
          return option;
        })
        console.log(option); 
        var select = selectHTML(option)
        $(".exhibit-detail-field__category").append(select);
        console.log(select); 
        $(".hidden-category-second-field").css('display',"block");
      })
      .fail(function() {
        alert('送信に失敗しました');
      })     
    });





    $(document).on('change','#child-category',function(){
      $(".hidden-category-third-field").css('display',"block");
    });

    $(document).on('change','#child-category',function(){
      $(".hidden-size-field").css('display',"block");
      $(".hidden-brand-field").css('display',"block");
    })

    $(document).on('change','#item_delivery_cost',function(){
      $(".hidden-delivery-field").css('display',"block");
    });

  }); 
});



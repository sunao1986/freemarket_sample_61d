window.addEventListener('DOMContentLoaded',function(){ 
  $(function(){

    //selectの中身の作成。デフォルトのselectはidが振られないのでカスタム属性でつけておく
    function optionHTML(data){
      var html = `<option value="${data.id}" data-category-id="${data.id}">${data.name}</option>`;
      return html;
    }
    // 子カテゴリーを丸ごと作成
    function appendchidHTML(insertOPTION){
      var childselect = '';
      childselect = `<div class='exhibit-detail-category-wrape__box' id= 'child_box'>
                        <select class="exhibit-detail-category-wrape__box--input" id="child_category" name="item[category_id]">
                          <option value="---" data-category-id="---">---</option>
                          ${insertOPTION}
                        <select>
                        <i class='fas fa-angle-dowx fa-2x exhibit-detail-category-wrape__box--angle'></i>
                     </div>`;
      $('.exhibit-detail-category-wrape').append(childselect);
    }

    // 孫カテゴリーを丸ごと作成
    function appendgchidHTML(insertOPTION){
      var gchildselect = '';
      gchildselect = ` <div class='exhibit-detail-category-wrape__box' id= 'gchild_box'>
                          <select class="exhibit-detail-category-wrape__box--input" id= "gchild_category" name="item[category_id]">
                            <option value="---" data-category-id="---">---</option>
                            ${insertOPTION}
                          </select>
                          <i class='fas fa-angle-dowx fa-2x exhibit-detail-category-wrape__box--angle'></i>
                       </div>`;
      $('.exhibit-detail-category-wrape').append(gchildselect);
    }
    

    // 親カテゴリーの値が入ったらカテゴリテーブルからデータを拾って挿入
    $(document).on('change','#parent_category',function(e){
      e.preventDefault();
      // inputには選択した親カテゴリのnameが入る
      var input = $(this).val();
      console.log(input);
      if (input != "---"){ 

        $.ajax({
          type: 'GET',
          url: 'category_child',
          data: { parent_name: input}, 
          dataType: 'json',
        })

        //発火したら子以下を削除してからデータを入れこんだHTMLを挿入する
        .done(function(childcategory) {  
          $('#child_box').remove(); 
          $('#gchild_box').remove();
          console.log(childcategory);
          var insertOPTION= '';
          // dataには子カテゴリーがid付きで配列取得されている
          childcategory.forEach(function(childData){
            insertOPTION += optionHTML(childData);
          });
          appendchidHTML(insertOPTION);
        })

        .fail(function() {
          alert('送信に失敗しました');
        })   

      }else{
        $('#child_box').remove(); 
        $('#gchild_box').remove();
      }
    });
    
     // 子カテゴリー選択後のイベント
    $(document).on('change', '#child_category', function(){
      //子カテゴリーにはidをつけてあるのでそのままidを取得して変数に入れる
      var childid = $('#child_category option:selected').data('category-id'); 
      console.log(childid);
      if (childid != "---"){ 
        $.ajax({
          url: 'category_gchild',
          type: 'GET',
          data: { child_id: childid },
          dataType: 'json'
        })
        .done(function(gchildcategory){
          console.log(gchildcategory);
          $('#gchild_box').remove(); 
          if (gchildcategory.length != 0) {            
            var insertOPTION = '';
            gchildcategory.forEach(function(gchildData){
              insertOPTION += optionHTML(gchildData);
            });
            appendgchidHTML(insertOPTION);
            $(".hidden-size-field").css('display',"block");
            $(".hidden-brand-field").css('display',"block");
          }
        })
        .fail(function(){
          alert('カテゴリー取得に失敗しました');
        })
      }else{
        $('#gchild_box').remove(); 
      }
    });
    



    // 起動させていない
    $(document).on('change','item_category_id',function(){
      $(".hidden-category-second-field").css('display',"block");
      $(".hidden-category-third-field").css('display',"block");
      $(".hidden-size-field").css('display',"block");
      $(".hidden-brand-field").css('display',"block");
    })

    $(document).on('change','#item_delivery_cost',function(){
      $(".hidden-delivery-field").css('display',"block");
    });

  }); 
});



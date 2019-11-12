window.addEventListener('DOMContentLoaded',function(){ 
  $(function(){

    function optionHTML(data){
      var html = `<option value="${data.id}" data-category-id="${data.id}">${data.name}</option>`;
      return html;
    }

    function appendchidHTML(insertOPTION){
      var childselect = '';
      childselect = `<div class='exhibit-detail-category-wrape__box' id= 'child_box'>
                        <i alt="angle-down" class="fa fa-angle-down fas fa-angle-dowx fa-2x" id= "second-category-angle"></i>
                        <select class="exhibit-detail-category-wrape__box--input" id="child_category" name="item[category_id]">
                          <option value="---" data-category-id="---">---</option>
                          ${insertOPTION}
                        <select>
                     </div>`;
      $('.exhibit-detail-category-wrape').append(childselect);
    }

    function appendgchidHTML(insertOPTION){
      var gchildselect = '';
      gchildselect = ` <div class='exhibit-detail-category-wrape__box' id= 'gchild_box'>
                          <i alt="angle-down" class="fa fa-angle-down fas fa-angle-dowx fa-2x" id= "second-category-angle"></i>
                          <select class="exhibit-detail-category-wrape__box--input" id= "gchild_category" name="item[category_id]">
                            <option value="---" data-category-id="---">---</option>
                            ${insertOPTION}
                          </select>
                       </div>`;
      $('.exhibit-detail-category-wrape').append(gchildselect);
    }
    
    $(document).on('change','#parent_category',function(e){
      e.preventDefault();
      var input = $(this).val();
      console.log(input);
      if (input != "---"){ 

        $.ajax({
          type: 'GET',
          url: '/items/category_child',
          data: { parent_name: input}, 
          dataType: 'json',
        })

        .done(function(childcategory) {  
          $('#child_box').remove(); 
          $('#gchild_box').remove();
          var insertOPTION= '';
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
    
    $(document).on('change', '#child_category', function(){
      var childid = $('#child_category option:selected').data('category-id'); 
      if (childid != "---"){ 
        $.ajax({
          url: '/items/category_gchild',
          type: 'GET',
          data: { child_id: childid },
          dataType: 'json'
        })
        .done(function(gchildcategory){
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
    

    $(document).on('change','#item_delivery_cost',function(){
      $(".hidden-delivery-field").css('display',"block");
    });

  }); 
});



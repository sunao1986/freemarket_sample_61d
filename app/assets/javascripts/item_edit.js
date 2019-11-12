window.addEventListener('DOMContentLoaded',function(){ 

  if (window.location.href.match(/\/items\/\d+\/edit/)){ 
    window.onload = function(){

      function previewHTML(src,id){
        var html = `<div id="hidden-adjustment">
                      <div id="hidden-upload-style">
                        <img src="${src}" alt="image_file" id="add-images")
                      </div>
                      <div id="hidden-delete-btn-edit" data-image-name="${id}">削除
                      </div>
                    </div>`
        return html;
      }

    function inputHTML(src){
      var input = `<div id=custom-data-for data-image-name="hoge">
                     <label for="upload_file" class="box-click-label" >
                       <input type="file" id="upload_file" class="image_upload_file" name="item[images_attributes][][image_url]" style="display: none;">
                     </label>
                   </div>`
      return input;
    }

    function inputHIDDEN(src,index){
      var input = `<input type="hidden" value="${src}" id="item_images_attributes_${index}_image_url" name="item[images_attributes][${index}][image_url]">`
      return input;
    }

      var item_id = $(".exhibit-image-field").data('item-id')
      var href = window.location.href + '/'

      $.ajax({
        type: 'GET',
        url: href,
        data: { item_id: item_id} , 
        dataType: 'json',
      })

      .done(function(images) {  

        images.forEach(function(image,index){
          var src = image.image_url.url
          var id = image.id
          var width = $(".exhibit-image-box").width();
          var new_width = width - 124
          $('#custom-data-for').attr('data-image-name',id);
          var preview = previewHTML(src,id)
          var input = inputHIDDEN(src,index)
          $(".exhibit-image-box").css('width',new_width);         
          $(".increase-images-box").prepend(preview);
          // $(".box-click-label").prepend(input);
          $("#hidden-adjustment").css('float',"right");
          $("#hidden-adjustment").css('width',"114px");
          $("#hidden-adjustment").css('height',"162px");
          $("#hidden-adjustment").css('margin-right',"10px");
          $("#hidden-adjustment").css('border',"solid 1px rgb(211, 211, 211)");
          $("#hidden-adjustment").css('background-color',"rgb(233, 233, 233)");
          $("#hidden-upload-style").css('width',"112px");
          $("#hidden-upload-style").css('height',"110px");
          $("#add-images").css('width',"100%");
          $("#add-images").css('height',"110px");
          $("#add-images").css('object-fit',"cover");
          $("#hidden-delete-btn-edit").css('width',"114px");
          $("#hidden-delete-btn-edit").css('height',"52px");
          $("#hidden-delete-btn-edit").css('line-height',"52px");
          $("#hidden-delete-btn-edit").css('text-align',"center");
          $("#hidden-delete-btn-edit").css('color',"dodgerblue");
          $("#hidden-delete-btn-edit").css('cursor',"pointer");
          
          if (new_width < 100)
          $(".exhibit-image-box").css('display',"none");
        });
      }) 
      .fail(function() {
        alert('送信に失敗しました');
      }) 


    }
    $(document).on("click","#hidden-delete-btn-edit",function() {
      var image_name = $(this).data("image-name");
      // $('input[type="hidden"]',`[value="${image_name}"]`).remove();
      $(`input[value="${image_name}"]`).prev(".image_upload_file").remove();
      $(`input[value="${image_name}"]`).remove();
      $(this).parent("#hidden-upload-style").parent("#hidden-adjustment").remove();
      var width = $(".exhibit-image-box").width();
      var new_width = width + 124
      $(".exhibit-image-box").css('width',new_width);
      if (new_width > 1)
      $(".exhibit-image-box").css('display',"block");

    })
  };
});
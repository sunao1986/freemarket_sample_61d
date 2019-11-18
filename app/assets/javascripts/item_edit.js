window.addEventListener('DOMContentLoaded',function(){ 

  if (window.location.href.match(/\/items\/\d+\/edit/)){ 
    window.onload = function(){

      function previewHTML(src,id){
        var html = `<div id="hidden-adjustment">
                      <div id="hidden-upload-style">
                        <img src="${src}" alt="image_file" id="add-images")
                      </div>
                      <div id="hidden-delete-btn-edit" data-image-id="${id}">削除
                      </div>
                    </div>`
        return html;
      }

      function inputEditHTML(filenum){
        var input = `<div id=custom-data-for data-image-id="${filenum}">
                       <label for="upload_file" class="box-click-label" >
                         <input type="file" id="upload_file" class="image_upload_file" name="item[images_attributes][${filenum}][image_url]" style="display:none;">
                       </label>
                     </div>`
        return input;
      }

      var filenum = document.getElementsByClassName("image_upload_file").length;
      var input = inputEditHTML(filenum)
      $("#add-file-field-point").prepend(input);

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
          $('#custom-data-for').attr('data-image-id',id);
          var preview = previewHTML(src,id)
          $(".exhibit-image-box").css('width',new_width);         
          $(".increase-images-box").prepend(preview);
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
      var image_id = $(this).data("image-id");
      $(`input[value="${image_id}"]`).prev(".image_upload_file").remove();
      $(`input[value="${image_id}"]`).remove();
      $(this).parent("#hidden-upload-style").parent("#hidden-adjustment").remove();

      $.ajax({
        type: 'DELETE',
        url: "/images/" + image_id,
        data: { id: image_id},
        dataType: 'json',
      })

      .done(function(images) {  
        var width = $(".exhibit-image-box").width();
        var new_width = width + 124
        $(".exhibit-image-box").css('width',new_width);
        if (new_width > 1)
        $(".exhibit-image-box").css('display',"block");

      })
      .fail(function() {
        alert('送信に失敗しました');
      }) 
    })
  };
});
window.addEventListener('DOMContentLoaded',function(){ 
  $(function(){

    function previewHTML(src,imageId){
      var html = `<div id="hidden-adjustment">
                    <div id="hidden-upload-style">
                      <img src="${src}" alt="image_file" id="add-images")
                    </div>
                    <div id="hidden-delete-btn" data-image-id="${imageId}">削除
                    </div>
                  </div>`
      return html;
    }
    
    function inputHTML(imageId){
      var input = `<div id=custom-data-for data-image-id="${imageId +1 }">
                     <label for="upload_file" class="box-click-label" >
                       <input type="file" id="upload_file" class="image_upload_file" name="item[images_attributes][${imageId +1 }][image_url]" style="display:none;">
                     </label>
                   </div>`
      return input;
    }
    $(document).on('change','#upload_file',function(e){
      var imageId = $(this).parent(".box-click-label").parent("#custom-data-for").data("image-id")
      var file = e.target.files[0];
      var reader = new FileReader();
      reader.onload = (function(){
        return function(e){
        var width = $(".exhibit-image-box").width();
        var new_width = width - 124
        var src = e.target.result
        var input = inputHTML(imageId)
        var preview = previewHTML(src,imageId)
        $(".exhibit-image-box").css('width',new_width);
        $("#add-file-field-point").prepend(input);
        $(".increase-images-box").prepend(preview);
        //挿入した画像previewのcssを当てる
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
        $("#hidden-delete-btn").css('width',"114px");
        $("#hidden-delete-btn").css('height',"52px");
        $("#hidden-delete-btn").css('line-height',"52px");
        $("#hidden-delete-btn").css('text-align',"center");
        $("#hidden-delete-btn").css('color',"dodgerblue");
        $("#hidden-delete-btn").css('cursor',"pointer");
        
        if (new_width < 100)
        $(".exhibit-image-box").css('display',"none");

        };
      })
      (file);
      reader.readAsDataURL(file); 
    });

    $(document).on("click","#hidden-delete-btn",function() {
      var image_id = $(this).data("image-id");
      $('#upload_file',`[data-image-id="${image_id}"]`).remove();
      $(this).parent("#hidden-upload-style").parent("#hidden-adjustment").remove();
      var width = $(".exhibit-image-box").width();
      var new_width = width + 124
      $(".exhibit-image-box").css('width',new_width);
      if (new_width > 1)
      $(".exhibit-image-box").css('display',"block");
    })
  }); 
});
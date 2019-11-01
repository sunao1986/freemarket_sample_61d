window.addEventListener('DOMContentLoaded',function(){ 
  $(function(){

    function previewHTML(src){
      var html = `<div id="hidden-adjustment">
                    <div id="hidden-upload-style">
                      <img src="${src}" alt="image_file" id="add-images")
                    </div>
                    <div id="hidden-delete-btn">削除
                    </div>
                  </div>`
      return html;
    }

    //ドロップダウン試験中です
    $(".exhibit-image-box").on("drop", function(e){
        e.preventDefault();
        document.getElementById("upload_file").files = e.originalEvent.dataTransfer.files;
        var file = e.target.files[0];
        var reader = new FileReader();

      reader.onload = (function(file){
        return function(e){
        var width = $(".exhibit-image-box").width();
        var new_width = width - 124
        var src = e.target.result
        var preview = previewHTML(src)
        $(".exhibit-image-box").css('width',new_width);
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
        };
      })(file);
      reader.readAsDataURL(file);      
    });
          

    //ここからはクリックでアップロードした画像のプレビュー
    $('#upload_file').change(function(e){
      //ファイル情報を取得
      var file = e.target.files[0];
      var reader = new FileReader();
  
      //画像でない場合は処理終了
      if(file.type.indexOf("image") < 0){
        alert("画像ファイルを指定してください。");
        return false;
      }
  
      //アップロードした画像のその後
      reader.onload = (function(file){
        return function(e){
        var width = $(".exhibit-image-box").width();
        var new_width = width - 124
        var src = e.target.result
        var preview = previewHTML(src)
        $(".exhibit-image-box").css('width',new_width);
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
        };
      })(file);
      reader.readAsDataURL(file); 
    });
  }); 
}); 

  //input file ごと増やす作戦(休止中)
  // $("#add-file-field-point").prepend('<input type="file" class="image_upload_file" multiple="multiple" name=item[][image]" style="display: none;">');


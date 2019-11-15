$(function(){  
  $("#new_item").validate({
    rules : {
      "item[name]": {
        required: true,
      },
      "item[discription]": {
        required: true
      },
      "item[category_id]": {
        required: true,
      },
      "item[size_id]": {
        required: true,
      },
      "item[status]": {
        required: true,
      },
      "item[delivery_cost]": {
        required: true,
      },
      "item[delivery_method]": {
        required: true,
      },
      "item[delivery_area]": {
        required: true
      },
      "item[delivery_days]": {
        required: true
      },
      "item[price]": {
        required: true
      }
    },

    messages: {
      "item[name]": {
        required: "商品名 を入力してください",
      },
      "item[discription]": {
        required: '商品説明 を入力してください',
      },
      "item[category_id]": {
        required: 'カテゴリー を選んでください',
      },
      "item[size_id]": {
        required: 'サイズ を選んでください',
      },
      "item[status]": {
        required: '商品の状態 を選んでください',
      },
      "item[delivery_cost]": {
        required: '配送料の負担 を選んでください',
      },
      "item[delivery_method]": {
        required: '発送の方法 を選んでください',
      },
      "item[delivery_area]": {
        required: '配送元の地域 を選んでください'
      },
      "item[delivery_days]": {
        required: '発送までの日数 を選んでください'
      },
      "item[price]": {
        required: '販売価格 を入力してください'
      }
    },

    errorPlacement: function(error, element) {
      if(element.attr("name")=="item[name]"){
         error.insertAfter("#item-error-name");
      } else if(element.attr("name")=="item[discription]")  {
        error.insertAfter("#item-error-discription");
      } else if(element.attr("name")=="item[category_id]") {
        error.insertAfter("#item-error-category")
      } else if(element.attr("name")=="item[size_id]") {
        error.insertAfter("#item-error-size");
      } else if(element.attr("name")=="item[status]") {
        error.insertAfter("#item-error-status")
      } else if(element.attr("name")=="item[delivery_cost]") {
        error.insertAfter("#item-error-delivery-cost")
      } else if(element.attr("name")=="item[delivery_method]") {
        error.insertAfter("#item-error-delivery-method")
      } else if(element.attr("name")=="item[delivery_area]") {
        error.insertAfter("#item-error-delivery-area")
      } else if(element.attr("name")=="item[delivery_days]") {
        error.insertAfter("#item-error-delivery-days")
      } else if(element.attr("name")=="item[price]") {
        error.insertAfter("#item-error-price")
      } else{
        error.insertAfter(element);	
      }
    }
 });
}) 
$(function(){
  $.validator.addMethod("firstKana", function(value, element, regexpr) {          
    return regexpr.test(value);
  }, "姓カナ はカナ文字を入力してください"); 
  $.validator.addMethod("lastKana", function(value, element, regexpr) {          
    return regexpr.test(value);
  }, "名カナ はカナ文字を入力してください");
  $.validator.addMethod("firstName", function(value, element, regexpr) {          
    return regexpr.test(value);
  }, "姓 に数字は使用できません");
  $.validator.addMethod("lastName", function(value, element, regexpr) {          
    return regexpr.test(value);
  }, "名 に数字は使用できません");
  $.validator.addMethod("postalCode", function(value, element, regexpr) {          
    return regexpr.test(value);
  }, "フォーマットが不適切です");
  $.validator.addMethod("city", function(value, element, regexpr) {          
    return regexpr.test(value);
  }, "市区町村 に数字は使用できません");
  $("#new_shipping").validate({
    rules : {
      "shipping[first_name]": {
        required: true,
        firstName: /\D/
      },
      "shipping[last_name]": {
        required: true,
        lastName: /\D/
      },
      "shipping[first_kana]": {
        required: true,
        firstKana: /^([ァ-ン]|ー)+$/
      },
      "shipping[last_kana]": {
        required: true,
        lastKana: /^([ァ-ン]|ー)+$/
      },
      "shipping[postal_code]": {
        required: true,
        postalCode: /^\d{3}[-]\d{4}$|^\d{3}[-]\d{2}$|^\d{3}$|^\d{5}$|^\d{7}$/
      },
      "shipping[prefectures]": {
        required: true
      },
      "shipping[city]": {
        required: true,
        city: /\D/
      },
      "shipping[address]": {
        required: true
      }
    },
    messages: {
      "shipping[first_name]": {
        required: "姓 を入力してください"
      },
      "shipping[last_name]": {
        required: "名 を入力してください"
      },
      "shipping[first_kana]": {
        required: "姓カナ を入力してください"
      },
      "shipping[last_kana]": {
        required: "名カナ を入力してください"
      },
      "shipping[postal_code]": {
        required: "郵便番号 を入力してください"
      },
      "shipping[prefectures]": {
        required: "都道府県 を入力してください"
      },
      "shipping[city]": {
        required: "市区町村 を入力してください"
      },
      "shipping[address]": {
        required: "番地 を入力してください"
      }
    },
    errorPlacement: function(error, element) {
        error.insertAfter(element);
    }
 });
})  

$(function(){
  $.validator.addMethod("firstKana", function(value, element, regexpr) {          
    return regexpr.test(value);
  }, "姓カナ はカナ文字を入力してください"); 
  $.validator.addMethod("lastKana", function(value, element, regexpr) {          
    return regexpr.test(value);
  }, "名カナ はカナ文字を入力してください");
  $.validator.addMethod("firstName", function(value, element, regexpr) {          
    return regexpr.test(value);
  }, "姓 に数字は使用できません");
  $.validator.addMethod("lastName", function(value, element, regexpr) {          
    return regexpr.test(value);
  }, "名 に数字は使用できません");
  $.validator.addMethod("password", function(value, element, regexpr) {          
    return regexpr.test(value);
  }, "英字と数字両方を含むパスワードを設定してください");
  $("#new_user").validate({
    rules : {
      "user[nickname]": {
        required: true,
        maxlength : 20
      },
      "user[email]": {
        required: true
      },
      "user[password]": {
        required: true,
        maxlength : 128,
        minlength : 7,
        password : /([0-9].*[a-zA-Z]|[a-zA-Z].*[0-9])/s
      },
      "user[first_name]": {
        required: true,
        firstName: /\D/
      },
      "user[last_name]": {
        required: true,
        lastName: /\D/
      },
      "user[first_kana]": {
        required: true,
        firstKana: /^([ァ-ン]|ー)+$/
      },
      "user[last_kana]": {
        required: true,
        lastKana: /^([ァ-ン]|ー)+$/
      },
      "user[birthday]": {
        required: true
      }
    },
    messages: {
      "user[nickname]": {
        required: "ニックネーム を入力してください",
        maxlength : "20 文字以下で入力してください"
      },
      "user[email]": {
        required: 'メールアドレス を入力してください',
        email: "フォーマットが不適切です"
      },
      "user[password]": {
        required: 'パスワード を入力してください',
        minlength : "パスワードは7文字以上128文字以下で入力してください"
      },
      "user[first_name]": {
        required: '姓 を入力してください'
      },
      "user[last_name]": {
        required: '名 を入力してください'
      },
      "user[first_kana]": {
        required: '姓カナ を入力してください',
       
      },
      "user[last_kana]": {
        required: '名カナ を入力してください',
        
      },
      "user[birthday]": {
        required: '生年月日 を入力してください'
      }
    },
    errorPlacement: function(error, element) {
      if(element.attr("name")=="user[birthday]"){
         error.insertAfter("#last-birthday");
      } else if(element.attr("name")=="user[first_name]")  {
        error.insertAfter("#name-fullwidth");
      } else if(element.attr("name")=="user[last_name]") {
        error.insertAfter("#form-group-name")
      } else if(element.attr("name")=="user[first_kana]")  {
        error.insertAfter("#kana-fullwidth");
      } else if(element.attr("name")=="user[last_kana]") {
        error.insertAfter("#form-group-kana")
      } else{
        error.insertAfter(element);	
      }
  }   
 });
}) 
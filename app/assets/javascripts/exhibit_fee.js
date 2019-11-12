window.addEventListener('DOMContentLoaded',function(){ 


  //金額入れるinputボックスをセレクタに
  //入れた瞬間にだからインクリと同じkeyupを使う
  $('#item_price').on('keyup', function(){
    //inputの値を変数に入れる
      var price = $(this).val();
    //手数料10%だから×0.1
      var exhibit_fee = Math.floor(price * 0.1)
    //利益は引き算する
      var exhibit_profit = price - exhibit_fee
    
    //本家メルカリを調べると300円以上じゃないとコレ反応しないからifで分岐
    //然るべき場所にtextメソッドで表示
    //調べた記事は消費税でtoLocaleStringメソッドを使ってたが小数点出る時の切り捨て処理だからいらない
      if (price >= 300 && price <= 9999999) {
        $('.exhibit-fee-result').text('¥' + exhibit_fee)
        $('.exhibit-profit-result').text('¥' + exhibit_profit)
      } else {
    //299まで、普通の文字列は無反応
        $('.exhibit-fee-result').text('--')
        $('.exhibit-profit-result').text('--')
      }
    })
}); 
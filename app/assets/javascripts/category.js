window.addEventListener('DOMContentLoaded',function(){ 
  $(function(){

    $(document).on('change','#item_category_id',function(){
      $(".hidden-category-second-field").css('display',"block");
    });

    $(document).on('change','#item_category_id',function(){
      $(".hidden-category-third-field").css('display',"block");
    });

    $(document).on('change','#item_category_id',function(){
      $(".hidden-size-field").css('display',"block");
      $(".hidden-brand-field").css('display',"block");
    })

    $(document).on('change','#item_delivery_cost',function(){
      $(".hidden-delivery-field").css('display',"block");
    });

  }); 
});



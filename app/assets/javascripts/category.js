window.addEventListener('DOMContentLoaded',function(){ 
  $(function(){

    $(document).on('change','#item_category_id',function(){
      console.log("発火");
      $(".hidden-category-second-field").css('display',"block");
    });

    $(document).on('change','#item_category_id',function(){
      console.log("発火");
      $(".hidden-category-third-field").css('display',"block");
    });

    $(document).on('change','#item_category_id',function(){
      console.log("発火");
      $(".hidden-size-field").css('display',"block");
      $(".hidden-brand-field").css('display',"block");
    })

    $(document).on('change','#item_delivery_cost',function(){
      console.log("発火");
      $(".hidden-delivery-field").css('display',"block");
    });

  }); 
});



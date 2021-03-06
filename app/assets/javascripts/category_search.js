$(function(){

  function buildChildrenList(child){
    var html =`<a class="child_category" id="${child.id}" 
                href="/categories/${child.id}">${child.name}</a>`;
    return html;
  }

  function buildGChirdrenList(child){
    var html =`<a class="gchild_category" id="${child.id}"
               href="/categories/${child.id}">${child.name}</a>`;
    return html;
  }

  $(".category-brand").on("mouseover",function(){
    $(".category-list").css("display","block")
    $(".children-list").css("display","none")
    $(".gchildren-list").css("display","none")
  });
  $(".category-list").on("mouseleave",function(){
    $(".category-list").css("display","none")
  });
  $(".children_list").on("mouseleave",function(){
    $(".gchildren-list").css("display","none")
  });

  $(".patents-link").on("mouseover",function(){
    var id = $(this).attr("id")
    $(".child_category").remove();
    $(".gchild_category").remove();
    $(".gchildren-list").css("display","none")

    $.ajax({
      type: 'GET',
      url: '/categories/new',
      data: {category_id: id},
      dataType: 'json'

    }).done(function(children) {
      $(".children-list").css("display","block")
      children.forEach(function (child) {
        var html = buildChildrenList(child);
        $(".children-list").append(html);
      })
    });
  });


  $(document).on("mouseover",".child_category",function () {
    var id = $(this).attr("id")
    $(".gchild_category").remove();

    $.ajax({
      type: 'GET',
      url: '/categories/new',
      data: {category_id: id},
      dataType: 'json'

    }).done(function(children) {
      $(".gchildren-list").css("display","block")
    if (children !== null){
      children.forEach(function (child) {
        var html = buildGChirdrenList(child);
        $(".gchildren-list").append(html);
      })
    }
    }); 
  });  
});
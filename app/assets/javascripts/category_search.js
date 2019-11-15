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
  });
  $(".category-list").on("mouseleave",function(){
    $(this).css("display","none")
  });

  $(".patents-link").on("mouseover",function(){
    var id = $(this).attr("id")
    $(".child_category").remove();
    $(".gchild_category").remove();

    $.ajax({
      type: 'GET',
      url: '/categories/new',
      data: {category_id: id},
      dataType: 'json'

    }).done(function(children) {
      
      children.forEach(function (child) {
        var html = buildChildrenList(child);
        $(".children-list").append(html);
      })
    });
    // $(this).css("background-color","red")
  })
  // $(".patents-link").on("mouseleave",function(){
    // $(this).css("background-color","white")
  // });



  $(document).on("mouseover",".child_category",function () {
    var id = $(this).attr("id")
    console.log(id)
    $(".gchild_category").remove();

    $.ajax({
      type: 'GET',
      url: '/categories/new',
      data: {category_id: id},
      dataType: 'json'

    }).done(function(children) {
      console.log(children)
      children.forEach(function (child) {
        var html = buildGChirdrenList(child);
        console.log(html)
        $(".gchildren-list").append(html);
      })
    }); 
  });  
});
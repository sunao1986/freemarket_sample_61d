$(document).on('turbolinks:load', function(){
  $('.item-container__item-main__photo__act').slick({
    asNavFor:'.item-container__item-main__photo__inact',
    infinite: false,
  });
  $('.item-container__item-main__photo__inact').slick({
    asNavFor:'.item-container__item-main__photo__act',
    focusOnSelect: true,
    infinite: false,
    slidesToShow: 5,
  });
});
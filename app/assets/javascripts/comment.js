window.addEventListener('DOMContentLoaded',function(){ 
  $(function() {
    $('form').submit(function() {
      if($('#comarea').val() == '') {
        alert('空欄です！');
        return false;
      }
    });
  });
});
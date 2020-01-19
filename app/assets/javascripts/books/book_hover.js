$(function(){
  $('.book-hover').hover(
    function(){
      $(this).css(
        {
          boxShadow: '0 8px 17px 0 rgba(0, 0, 0, 0.6)'
        }
      )
    },
    function(){
      $(this).css(
        {
          boxShadow: '0 8px 17px 0 rgba(0.2,0.2,0.2,0.2)'
        }
      )
    }
  );
});
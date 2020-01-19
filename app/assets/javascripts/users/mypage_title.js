$(function(){
  $('.mypage-title').hover(
    function(){
      $(this).css(
        {
          color: 'gray'
        }
      )
    },
    function(){
      $(this).css(
        {
          color: 'black'
        }
      )
    }
  );
});
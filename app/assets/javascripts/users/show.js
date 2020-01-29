$(function(){
  $('.user-box__user__follow__followers__count').hover(
    function(){
      $(this).css(
        {
          fontWeight: 'bold',
        }
      )
    },
    function(){
      $(this).css(
        {
          fontWeight: 'normal',
        }
      )
    }
  );

  $('.user-box__user__follow__followings__count').hover(
    function(){
      $(this).css(
        {
          fontWeight: 'bold',
        }
      )
    },
    function(){
      $(this).css(
        {
          fontWeight: 'normal',
        }
      )
    }
  );
});
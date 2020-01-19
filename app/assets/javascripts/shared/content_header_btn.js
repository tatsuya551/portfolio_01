$(function(){
  $('.content-header-btn').hover(
    function(){
      $(this).css(
        {
          fontWeight: 'bold',
          paddingBottom: '3px',
          borderBottom: '2px solid gray'
        }
      )
    },
    function(){
      $(this).css(
        {
          fontWeight: 'normal',
          border: 'none'
        }
      )
    }
  );

  $('.content-header-follow-book-btn').hover(
    function(){
      $(this).css(
        {
          fontWeight: 'bold',
          borderBottom: '2px solid gray'
        }
      )
    },
    function(){
      $(this).css(
        {
          fontWeight: 'normal',
          border: 'none'
        }
      )
    }
  );

  $('.content-header-user-btn').hover(
    function(){
      $(this).css(
        {
          fontWeight: 'bold',
          paddingBottom: '3px',
          borderBottom: '2px solid #e59703'
        }
      )
    },
    function(){
      $(this).css(
        {
          fontWeight: 'normal',
          border: 'none'
        }
      )
    }
  );
});
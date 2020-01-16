$(function(){
  $('.header-text').hover(
    function(){
      $(this).css(
        {
          color: '#fff',
          fontWeight: 'bold',
          paddingBottom: '5px',
          borderBottom: '2px solid #fff'
        }
      )
    },
    function(){
      $(this).css(
        {
          color: 'gray',
          fontWeight: 'normal',
          border: 'none'
        }
      )
    }
  );
});
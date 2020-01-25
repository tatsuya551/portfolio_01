$(function(){
  $('.book-info-list__link__btn').click(function(){
    $('.book-info-list__link__form').fadeIn(15);
  });
  $('.back-btn').click(function(){
    $('.book-info-list__link__form').fadeOut(15);
  });

  $('.news-list,.news-list-main').hover(
    function(){
      $('.news-list-main').show()
    },
    function(){
      $('.news-list-main').hide()
    }
  );

  $('.news-list-main__box').hover(
    function(){
      $(this).css(
        {
          backgroundColor: '#039ae520'
        }
      )
    },
    function(){
      $(this).css(
        {
          backgroundColor: 'white'
        }
      )
    }
  );
});

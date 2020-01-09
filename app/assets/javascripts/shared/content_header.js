$(function(){
  $('.book-info-list__link__btn').click(function(){
    $('.book-info-list__link__form').fadeIn(15);
  });
  $('.back-btn').click(function(){
    $('.book-info-list__link__form').fadeOut(15);
  });
});
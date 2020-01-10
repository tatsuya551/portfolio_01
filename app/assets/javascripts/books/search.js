$(function(){
  let first_search_tabs = $(".first-set-tab");
  let second_search_tabs = $(".second-set-tab");
  
  function userBtnSwitch () {
    $(this).parent().parent().removeClass("active");
    const index = first_search_tabs.index(this);
    $(".search-book__main__box").eq(index).addClass("active")
  }
  function allBtnSwitch () {
    $(this).parent().parent().removeClass("active");
    const index = second_search_tabs.index(this);
    $(".search-book__main__box").eq(index).addClass("active")
  }
  
  first_search_tabs.click(userBtnSwitch);
  second_search_tabs.click(allBtnSwitch);

});
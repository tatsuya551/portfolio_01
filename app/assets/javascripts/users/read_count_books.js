$(function(){
  let once_tabs = $(".once-set-tab");
  let twice_tabs = $(".twice-set-tab");
  let three_tabs = $(".three-set-tab");
  
  function onceBtnSwitch () {
    $(this).parent().parent().removeClass("active");
    const index = once_tabs.index(this);
    $(".read-count-books__main__box").eq(index).addClass("active")
  }
  function twiceBtnSwitch () {
    $(this).parent().parent().removeClass("active");
    const index = twice_tabs.index(this);
    $(".read-count-books__main__box").eq(index).addClass("active")
  }
  function threeBtnSwitch () {
    $(this).parent().parent().removeClass("active");
    const index = three_tabs.index(this);
    $(".read-count-books__main__box").eq(index).addClass("active")
  }
  
  once_tabs.click(onceBtnSwitch);
  twice_tabs.click(twiceBtnSwitch);
  three_tabs.click(threeBtnSwitch);
});
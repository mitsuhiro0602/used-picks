$(function() {
  const inputForm = $(".search-form");
  const url = location.href;
  const search_list = $('.itemlist');

  function builtHTML(item) {
    let html = `
    　　<li>${item.name}</li>
    　　<div class="content_post" style="background-image: url(${item.image});">
    　　<li>${item.initial_price}</li>
    `
    search_list.append(html);
  }
  　// フォームに入力すると発火する
  inputForm.on("keyup", function(){
    const target = $(this).val();
    search(target);
  });

  function search(target) {
 　　 // ajaxの処理
    $.ajax({
      type: 'GET',
      url: '/item/search',
      data: { keyword: target},
      dataType: 'json'
    })
    .done(function(items){
      console.log(items);
      search_list.empty(); //再度検索した際の前のデータを消す処理
      if (items.length == 0){
        search_list.empty();
      }
      else if (items.length !== 0){
        items.forEach(function(item) { //dataは配列型に格納されているEach文を返す
          builtHTML(item);
        });
      }
      else {
        appendErrMsgToHTML('該当する商品はありません');
      }
    })
    .fail(function(items){
      alert('非同期通信に失敗しました');
    })
  }
});
$(function () {
  const inputForm = $("#searching-form");
  const url = '/item/search';
  const search_list = $('.itemlist');

  function appendItem(item) {
    var html = `<div class="itemlist">
                  <a href="/item/${item.id}" title="${ item.name }" class="itemlist__link"</a>
                    <div class="itemlist__image" style="background-image: url(${ item.image_url });" title="${ item.name }"></div>
                    <h3 class="name" text-overflow>
                      <span>${ item.name }</span>
                    </h3>
                </div>`

    search_list.append(html);
  }
  function appendErrMsgToHTML(msg) {
    var html = `<div class= 'name' >${ msg }</div>`
    search_list.append(html);
  }
  // フォームに入力すると発火する
  inputForm.on("keyup", function(){
    var target = inputForm.val();
    search(target);
    console.log(target);
  });

  // ajaxの処理
  function search(target){
    $.ajax({
      type: 'GET',
      url: url,
      data: { keyword: target},
      dataType: 'json'
    })
    .done(function(items){
      console.log(items);
      search_list.empty(); //再度検索した際の前のデータを消す処理
      if (items.length !== 0){
        items.forEach(function(item) { //dataは配列型に格納されているEach文を返す
          appendItem(item);
        });
      } else {
        appendErrMsgToHTML('該当する商品はありません')
      }
    })
    .fail(function(data){
      alert('非同期通信に失敗しました');
    })
  }
});


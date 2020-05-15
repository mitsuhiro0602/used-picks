$(function() {
  //カテゴリーセレクトボックスのオプションを作成
  function appendOption(category){
    var html = `<option value="${category.id}" data-category="${category.id}">${category.name}</option>`;
    return html;
  }
  //子カテゴリーの表示作成
  function appendChildrenBox(insertHTML){
    var childSelectHtml = '';
    childSelectHtml = `<div class='item-main__content-select__added' id= 'children_wrapper'>
                       <div class='item-main__content-select'>
                         <select class="item-main__content-select-default" id="child_category" name="item[category_id]">
                          <option value="---" data-category="---">---</option>
                          ${insertHTML}
                        <select>
                        <i class='fas fa-chevron-down item-main__content-select_icon'></i>
                      </div>
                    </div>`;
    $('.item-main__content-category').append(childSelectHtml);
  }
  //孫カテゴリーの表示作成
  function appendGrandchldrenBox(insertHTML){
    var grandchildSelectHtml = '';
    grandchildSelectHtml = `<div class='item-main__content-select__added' id= 'grandchildren_wrapper'>
                            <div class='item-main__content-select'>
                              <select class="item-main__content-select-default" id="grandchild_category" name="item[category_id]">
                                <option value="---" data-category="---">---</option>
                              ${insertHTML}
                              <select>
                              <i class='fas fa-chevron-down item-main__content-select_icon'></i>
                            </div>
                          </div>`;
    $('.item-main__content-category').append(grandchildSelectHtml);
  }
  //親カテゴリー選択後のイベント
  $('#parent_category').on('change', function(){
    var parentCategory = document.getElementById('parent_category').value; //選択された親カテゴリーの名前を取得する
    if (parentCategory !="---"){ //親カテゴリーが初期値でないことを確認
      $.ajax({
        url: 'get_category_children',
        type: 'GET',
        data: { parent_id: parentCategory },
        dataType: 'json'
      })
      .done(function(children){
        $('#children_wrapper').remove(); //親が変更された時、子以下を削除する
        $('#grandchildren_wrapper').remove();
        $('#size_wrapper').remove();
        $('#brand_wrapper').remove();
      })
    }
  });
  //子カテゴリー選択後のイベント
  $('.item-main__content-cateogry').on('change', '#child_category', function(){
    var childId = $('#child_category option:selected').data('category'); //選択された子カテゴリーのidを取得する
    if (childId != "---"){ //子カテゴリーが初期値でないことを確認
        $.ajax({
          url: 'get_category_grandchildren',
          type: 'GET',
          data: { child_id: childId },
          dataType: 'json'
        })
        .done(function(grandchildren){
          if (grandchildren.lenfgth != 0) {
            $('#grandchildren_wrapper').remove(); //子が変更された時に孫以下を削除する
            $('#size_wrapper').remove();
            $('#brand_wrapper').remove();
            var insertHTML = '';
            grandchildren.forEach(function(grandchild){
              insertHTML += appendOption(grandchild);
            });
          appendGrandchldrenBox(insertHTML);
          }
        })
        .fail(function(){
          alert('カテゴリー取得に失敗しました');
        })
    }else{
      $('#grandchidren_wrapper').remove(); //子カテゴリーが初期値になった時、孫以下を削除する
      $('#size_wrapper').remove();
      $('#brand_wrapper').remove();
    }
  });
  //サイズセレクトボックスのオプション作成
  function appendSizeOption(size){
    var html = `<option value="${size.id}">${size.size}</option>`;
    return html;
  }
  //サイズ・ブランド入力欄の表示作成
  function appendSizeBox(insertHTML){
    sizeSelectHtml = `<div class="item-main__content-head__size" id= 'size_wrapper'>
                        <label class="listing-default__label" for="サイズ">サイズ</label>
                        <span class='form-require>必須</span>
                        <div class='item-main__content-select__added--size>
                          <div class='item-main__content-select'>
                            <select class="item-main__content-select-default" id="size" name="size_id">
                              <option value="---">---</option>
                              ${insertHTML}
                            </select>
                            <i class='fas fa-chevron-down item-main__content-select_icon'></li>
                          </div>
                        </div>
                      </div>`;
    $('.item-main__content-category').append(sizeSelectHtml);
  }
  //孫カテゴリー選択後のイベント
  $('.item-main__content-category').on('change', '#grandchild_category', function(){
    var grandchildId = $('#grandchild_category option:selected').data('category'); //選択された孫カテゴリーのidを取得する
    if (grandchildId != "---"){
      //孫カテゴリーが初期値ではないことを確認
      $.ajax({
        url: 'get-size',
        type: 'GET',
        data: { grandchild_id: grandchildId},
        dataType: 'json'
      })
      .done(function (sizes){
        $('#size_wrapper').remove(); //孫が変更された時、サイズ欄以下を削除する
        $('#brand_wrapper').remove();
        if(sizes.length !=0){
          var insertHTML = '';
            sizes.forEach(function(size){
              insertHTML += appendSizeOption(size);
            });
            appendSizeBox(insertHTML);
        }
      })
    }else{
      $('size_wrapper').remove(); //孫カテゴリーが初期値になった時、サイズ欄以下を削除する
      $('brand-wrapper').remove();
    }
  });
});
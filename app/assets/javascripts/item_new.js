$(function(){
  // DataTransferオブジェクトでデータを格納する箱を作る
  var dataBox = new DataTransfer();
  // querySelectorfile_fieldを取得する
  var file_field = document.querySelector('input[type=file]')
  // fileが選択された時に発火するイベント
  $('#img-file').change(function() {
    //選択したfileのオブジェクトをpropで取得する
    var files = $('input[type="file"]').prop('files')[0];
    $.each(this.files, function(i, file){
      //FileReaderのreadAsDataURLで指定したFileオブジェクトを読み込む
      var fileReader = new FileReader();

      //DataTransferオブジェクトに対して、fileを追加する
      dataBox.items.add(file)
      //DataTransferオブジェクトに入ったfile一覧をfile_fieldの中に代入する
      file_field.files = dataBox.files

      var num = $('.item-image').length + 1 + i
      fileReader.readAsDataURL(file);
      //画像が10枚になり、超えたらドロップボックスを削除する
      if (num == 10){
        $('#image-box__container').css('display', 'none')
      }
      //読み込みが完了するとimage_urlにfileのURLを格納する
      fileReader.onloadend = function() {
        var image_url = fileReader.result
        var html = `<div class='item-image' data-image="${file.image_url}">
                      <div class='item-image__cotent'>
                        <div class='item-image__content--icon'>
                          <img src=${image_url} width="100" height="100">
                        </div>
                      </div>
                      <div class='item-image__operetion'>
                        <div class='item-image__operetion--delete'>削除</div>
                      </div>
                    </div>`
        $('#image-box__container').before(html);
      };
      //image-box__containerのクラスを変更し、cssでドロップボックスの大きさを変える
      $('image-box__container').attr('class', `item-num-${num}`)
    });
  });
  //削除ボタンをクリックすると発火するイベント
  $(document).on("click", '.item-image__operetion--delete', function(){
    //プレビュー要素を取得する
    var target_image = $(this).parent().parent()
    //プレビューを削除する
    target_image.remove();
    //inputタグに入ったファイルを削除する
    file_field.val("")
  })
});
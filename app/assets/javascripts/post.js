$(document).ready(function(){
  $('.demo_btn').on('click', function(e) {
    var text_data = document.querySelector('textarea#demo_textarea');    

    var text_val = demo_textarea.value;
    var all_len = text_val.length;
// selectionStartはカーソルの開始位置を取得する
    var select_len = demo_textarea.selectionStart;

// substr()は任意の文字列から位置を決めて切り出す
    var first = text_val.substr(0, select_len);
    var insert = $(this).attr('val');
    var latter = text_val.substr(select_len, all_len);
    text_val = first + insert + latter;
    demo_textarea.value = text_val;
  });
});
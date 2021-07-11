  $(function() {
    // 多さい画像に個別のクラス名を付与
    var i = 1;
    $("img.item-box-img").each(function(){
        $(this).addClass('show-img-' + (i++));
    });
    // closeクラスを付与して非表示に
    $("img.item-box-img").addClass('close');
    // 1枚目のみcloseクラスを消して表示させる
    $("img.show-img-1").removeClass('close');
  });

  $(function() {
    // 小さい画像に個別のクラス名を付与
    var n = 1;
    $("img.item-box-img-1").each(function(){
        $(this).addClass('show-small-' + (n++));
    });
    // 1枚目のみボーダーを表示させる
    $("img.show-small-1").css("border", "solid 5px gray");
  });

  $(function(){
    $("img.item-box-img-1").on("click", function(){
      const num = $("img.item-box-img-1").index(this);
      $(".item-box-img").addClass('close');
      $(".item-box-img").eq(num).removeClass('close');
      $("img.item-box-img-1").css("border", "solid 0px gray");
      $("img.item-box-img-1").eq(num).css("border", "solid 5px gray");
    });
  });

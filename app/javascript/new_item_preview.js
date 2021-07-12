document.addEventListener('DOMContentLoaded', function(){
  if ( document.getElementById('item_image_1')){
    const clickUpload = document.querySelector('.click-upload');
    const visibilityOriginal = clickUpload.style.visibility;
    const inputFile = document.getElementById('item_image_1');
    const inputImageFile = document.getElementById('input_image_file');
    const uploadItems = document.querySelector('.upload_items');
    // 画像表示範囲の大きさ設定
    uploadItems.classList.add("ul_have_item_0");
    clickUpload.classList.add("have_item_0");

    // 選択した画像を表示する関数
    const createImageHTML = (blob) => {
      // 画像を表示するためのdiv要素を生成
      const imageElement = document.createElement('li');
      imageElement.setAttribute('class', "image-element")
      const element = document.querySelectorAll('.image-element')
      let imageElementNum = element.length
      imageElement.setAttribute('id', `image-element${imageElementNum + 1}`)
      // 表示する画像を生成
      const blobImage = document.createElement('img');
      blobImage.setAttribute('src', blob);
      blobImage.setAttribute('id', `blob_image_${imageElementNum + 1}`)
      // "削除"の表示を生成
      const imageDelete = document.createElement('div');
      imageDelete.textContent = "削除";
      imageDelete.setAttribute('id', `item_image_delete${imageElementNum + 1}`)
      // ファイル選択ボタンを生成
      const inputHTML = document.createElement('input')
      inputHTML.setAttribute('accept', ".png, .jpeg, .jpg")
      inputHTML.setAttribute('id', `item_image_${imageElementNum + 2}`)
      inputHTML.setAttribute('name', 'item[images][]')
      inputHTML.setAttribute('type', 'file')
      inputHTML.style.display ="none";
      // 生成したHTMLの要素をブラウザに表示させる
      uploadItems.appendChild(imageElement); //ulの子要素にliを追加
      imageElement.appendChild(blobImage); //liの子要素にimgを追加
      imageElement.appendChild(imageDelete); //liの子要素に"削除”を追加
      if (imageElementNum <= 3) {
        inputImageFile.appendChild(inputHTML); //liの数が3以下なら子要素にファイル選択ボタンを追加
      };

      // 画像表示範囲の大きさ変更
      if (imageElementNum == 0) {
        uploadItems.classList.remove("ul_have_item_0");
        clickUpload.classList.remove("have_item_0");
        uploadItems.classList.add("ul_have_item_1");
        clickUpload.classList.add("have_item_1");
      } else if (imageElementNum == 1) {
        uploadItems.classList.remove("ul_have_item_1");
        clickUpload.classList.remove("have_item_1");
        uploadItems.classList.add("ul_have_item_2");
        clickUpload.classList.add("have_item_2");
      } else if (imageElementNum == 2) {
        uploadItems.classList.remove("ul_have_item_2");
        clickUpload.classList.remove("have_item_2");
        uploadItems.classList.add("ul_have_item_3");
        clickUpload.classList.add("have_item_3");
      } else if (imageElementNum == 3) {
        uploadItems.classList.remove("ul_have_item_3");
        clickUpload.classList.remove("have_item_3");
        uploadItems.classList.add("ul_have_item_4");
        clickUpload.classList.add("have_item_4");
      } else if (imageElementNum == 4) {
        uploadItems.classList.remove("ul_have_item_4");
        clickUpload.classList.remove("have_item_4");
        uploadItems.classList.add("ul_have_item_5");
        clickUpload.classList.add("have_item_5");
        clickUpload.style.visibility = 'hidden';
      };
      
        
      //ファイル選択ボタンの値が変更されたら選択した画像を表示する関数を実行する
      inputHTML.addEventListener('change', (e) => {
        file = e.target.files[0];
        blob = window.URL.createObjectURL(file);
        createImageHTML(blob);
      });

      // 削除時の画像表示範囲の大きさ変更の関数
      const delete_container = () => {
        clickUpload.style.visibility = visibilityOriginal;
        let elementNum = document.querySelectorAll('.image-element').length
        if (elementNum == 4) {
          uploadItems.className = "";
          clickUpload.className = "";
          uploadItems.classList.add("upload_items");
          uploadItems.classList.add("ul_have_item_4");
          clickUpload.classList.add("click-upload");
          clickUpload.classList.add("have_item_4");
        } else if (elementNum == 3) {
          uploadItems.className = "";
          clickUpload.className = "";
          uploadItems.classList.add("upload_items");
          uploadItems.classList.add("ul_have_item_3");
          clickUpload.classList.add("click-upload");
          clickUpload.classList.add("have_item_3");
        } else if (elementNum == 2) {
          uploadItems.className = "";
          clickUpload.className = "";
          uploadItems.classList.add("upload_items");
          uploadItems.classList.add("ul_have_item_2");
          clickUpload.classList.add("click-upload");
          clickUpload.classList.add("have_item_2");
        } else if (elementNum == 1) {
          uploadItems.className = "";
          clickUpload.className = "";
          uploadItems.classList.add("upload_items");
          uploadItems.classList.add("ul_have_item_1");
          clickUpload.classList.add("click-upload");
          clickUpload.classList.add("have_item_1");
        } else if (elementNum == 0) {
          uploadItems.className = "";
          clickUpload.className = "";
          uploadItems.classList.add("upload_items");
          uploadItems.classList.add("ul_have_item_0");
          clickUpload.classList.add("click-upload");
          clickUpload.classList.add("have_item_0");
        };
      };
      
      // "削除”をクリックしたら画像を削除
      document.getElementById(`item_image_delete${imageElementNum + 1}`).onclick = function(e) {
        //プレビューを削除
        document.getElementById(`image-element${imageElementNum + 1}`).remove();
        //inputタグに入ったファイルを削除
        document.getElementById(`item_image_${imageElementNum + 1}`).value = "";
        // 画像表示範囲の大きさ変更の関数を実行
        delete_container();
      };

      // 画像の順番を整える
      if (imageElementNum == 4) {
        element[0].id = "image-element1"
        element[0].firstChild.id = "blob_image_1"
        element[0].lastChild.id = "item_image_delete1"
        element[1].id = "image-element2"
        element[1].firstChild.id = "blob_image_2"
        element[1].lastChild.id = "item_image_delete2"
        element[2].id = "image-element3"
        element[2].firstChild.id = "blob_image_3"
        element[2].lastChild.id = "item_image_delete3"
        element[3].id = "image-element4"
        element[3].firstChild.id = "blob_image_4"
        element[3].lastChild.id = "item_image_delete4"
        element[4].id = "image-element5"
        element[4].firstChild.id = "blob_image_5"
        element[4].lastChild.id = "item_image_delete5"
      } else if (imageElementNum == 3) {
        element[0].id = "image-element1"
        element[0].firstChild.id = "blob_image_1"
        element[0].lastChild.id = "item_image_delete1"
        element[1].id = "image-element2"
        element[1].firstChild.id = "blob_image_2"
        element[1].lastChild.id = "item_image_delete2"
        element[2].id = "image-element3"
        element[2].firstChild.id = "blob_image_3"
        element[2].lastChild.id = "item_image_delete3"
        element[3].id = "image-element4"
        element[3].firstChild.id = "blob_image_4"
        element[3].lastChild.id = "item_image_delete4"
      } else if (imageElementNum == 2) {
        element[0].id = "image-element1"
        element[0].firstChild.id = "blob_image_1"
        element[0].lastChild.id = "item_image_delete1"
        element[1].id = "image-element2"
        element[1].firstChild.id = "blob_image_2"
        element[1].lastChild.id = "item_image_delete2"
        element[2].id = "image-element3"
        element[2].firstChild.id = "blob_image_3"
        element[2].lastChild.id = "item_image_delete3"
      } else if (imageElementNum == 1) {
        element[0].id = "image-element1"
        element[0].firstChild.id = "blob_image_1"
        element[0].lastChild.id = "item_image_delete1"
        element[1].id = "image-element2"
        element[1].firstChild.id = "blob_image_2"
        element[1].lastChild.id = "item_image_delete2"
      } else if (imageElementNum == 0) {
        element[0].id = "image-element1"
        element[0].firstChild.id = "blob_image_1"
        element[0].lastChild.id = "item_image_delete1"
      };

    };  

    // 画像表示エリアをクリックしたら非表示の'f.file_field'がクリックされる
    clickUpload.onclick = function() {
      if (inputFile.value == "") {
        inputFile.click();
      } else if (document.getElementById('item_image_2').value == ""){
        document.getElementById('item_image_2').click();
      } else if (document.getElementById('item_image_3').value == ""){
        document.getElementById('item_image_3').click();
      } else if (document.getElementById('item_image_4').value == ""){
        document.getElementById('item_image_4').click();
      } else if (document.getElementById('item_image_5').value == ""){
        document.getElementById('item_image_5').click();
      }
    };

    document.getElementById('item_image_1').addEventListener('change', function(e){
      const file = e.target.files[0];
      const blob = window.URL.createObjectURL(file);
      createImageHTML(blob);
    });

  }
});


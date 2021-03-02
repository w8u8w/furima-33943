document.addEventListener('DOMContentLoaded', function(){
  const ImageList = document.getElementById('image-list');

  // 選択した画像を表示する関数
  const createImageHTML = (blob) => {
    // 画像を表示するためのdiv要素を生成
    const imageElement = document.createElement('div');

    // 表示する画像を生成
    const blobImage = document.createElement('img');
    blobImage.setAttribute('src', blob);
    blobImage.setAttribute('id', 'target-image');

    // 生成したHTMLの要素をブラウザに表示させる
    imageElement.appendChild(blobImage);
    ImageList.appendChild(imageElement);

    // 表示する画像のリサイズ
    const targetImg = document.getElementById('target-image');
    targetImg.width = 400;  // 横幅を400pxにリサイズ
    targetImg.height = 250; // 縦幅を250pxにリサイズ
  };

  document.getElementById('item-image').addEventListener('change', function(e){
    // 画像が表示されている場合のみ、すでに存在している画像を削除する
    const imageContent = document.querySelector('img');
    if (imageContent){
      imageContent.remove();
    }
    const file = e.target.files[0];
    const blob = window.URL.createObjectURL(file);

    createImageHTML(blob)
  });
})

window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = Math.floor(Number(inputValue) * 0.1);
    const resultProfit = document.getElementById("profit");
    resultProfit.innerHTML = Math.floor(Number(inputValue) - Number(addTaxDom.innerHTML)
  )})
})
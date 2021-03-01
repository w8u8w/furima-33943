document.addEventListener('DOMContentLoaded', function(){
  const ImageList = document.getElementById('image-list');
  document.getElementById('item-image').addEventListener('change', function(e){
    const file = e.target.files[0];
    const blob = window.URL.createObjectURL(file);

    // 画像を表示するためのdiv要素を生成
    const imageElement = document.createElement('div');

    // 表示する画像を生成
    const blobImage = document.createElement('img');
    blobImage.setAttribute('src', blob);

    // 生成したHTMLの要素をブラウザに表示させる
    imageElement.appendChild(blobImage);
    ImageList.appendChild(imageElement);
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
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
const pay = () => {
  Payjp.setPublicKey("pk_test_");
  const form = document.getElementById("charge-form");
  form.addEventListener("submit", (e) => {
    e.preventDefault();
    
    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);

    const card = {
      number: formData.get("purchases_shipping[number]"),
      cvc: formData.get("purchases_shipping[cvc]"),
      exp_month: formData.get("purchases_shipping[exp_month]"),
      exp_year: `20${formData.get("purchases_shipping[exp_year]")}`,
    };

    Payjp.createToken(card, (status, response) => {
      if (status == 200) {
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} name='token' type="hidden"> `;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
        debugger;
      }

    document.getElementById("card-number").removeAttribute("name");
    document.getElementById("card-exp-month").removeAttribute("name");
    document.getElementById("card-exp_year").removeAttribute("name");
    document.getElementById("card-cvc").removeAttribute("name");

    document.getElementById("charge-form").submit();
    });
  })
};
window.addEventListener("load", pay);
window.addEventListener('load', () => {

  const priceInput = document.getElementById("item-price");
  const salesCommission = document.getElementById("add-tax-price");
  const salesProfit = document.getElementById("profit");
  priceInput.addEventListener('input', () => {
    const inputValue = priceInput.value;
    salesCommission.innerHTML = Math.floor(inputValue * 0.1);
    salesProfit.innerHTML = Math.floor(inputValue * 0.9);
  });
});

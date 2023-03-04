function calculation (){
  const input = document.getElementById("item-price");
  input.addEventListener("click", (e) => {
    e.preventDefault();
    const itemPrice = input.value
    const taxRate = 0.1;
    const commission = Math.floor(itemPrice * taxRate);
    const profit = Math.floor(itemPrice - commission);
    taxInput = document.getElementById("add-tax-price")
    taxInput.innerHTML = `${commission}`
    profitInput = document.getElementById("profit")
    profitInput.innerHTML = `${profit}`
  });
};
 
 window.addEventListener('load', calculation);
  const indicate_fee = () => {
    const price = document.getElementById("item-price");
  price.addEventListener("input", ()=>{
    const input = document.getElementById("item-price");
  const fee = document.getElementById('add-tax-price');
  const profit = document.getElementById('profit');
    let tax = Math.ceil(input.value / 10);
    fee.innerHTML = tax
    profit.innerHTML =  input.value - tax
  });
};

window.addEventListener("load",indicate_fee);


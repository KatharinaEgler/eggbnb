import "bootstrap";


const startDate = document.getElementById("booking_start_date");
  //startDate.addEventListener('keyup', )
const endDate = document.getElementById("booking_end_date")
const price = document.getElementById("booking_price")

//total.innerHTML = '$<%= ( startDate.jd - endDate.jd ) * price.to_f/100 %>'
const totalPrice = document.getElementById("total-price-calculated")

if (endDate) {

endDate.addEventListener("change", (event) => {
  const start = new Date(startDate.value);
  const end = new Date(endDate.value);
  const numberDays = (end - start) / (1000 * 60 * 60 * 24);
  totalPrice.innerHTML = "Total price: $"+(parseFloat(totalPrice.dataset.pricePerDay) * numberDays).toFixed(2)

});

}

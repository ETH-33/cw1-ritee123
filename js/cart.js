document.addEventListener("DOMContentLoaded", () => {
    const books = document.querySelectorAll(".book");
    const cartItems = document.getElementById("cart-items");
    const cartTotal = document.getElementById("cart-total");
    let cartTotalAmount = 0;

    books.forEach(book => {
        book.addEventListener("click", () => {
            const bookId = book.getAttribute("data-id");
            const bookTitle = book.getAttribute("data-title");
            const bookPrice = parseFloat(book.getAttribute("data-price"));

            // Check if the book is already in the cart
            const existingCartItem = cartItems.querySelector(`li[data-id="${bookId}"]`);
            if (existingCartItem) {
                alert(`${bookTitle} is already in the cart.`);
                return;
            }

            // Add book to the cart
            const cartItem = document.createElement("li");
            cartItem.setAttribute("data-id", bookId);
            cartItem.innerHTML = `${bookTitle} - $${bookPrice}`;
            cartItems.appendChild(cartItem);

            // Update total amount
            cartTotalAmount += bookPrice;
            cartTotal.textContent = cartTotalAmount.toFixed(2);
        });
    });
});


// Cart items array to store the selected books
let cartItems = [];

// Function to add a book to the cart
function addToCart(bookTitle, bookPrice) {
  cartItems.push({ title: bookTitle, price: bookPrice });
  updateCartDisplay();
}

// Function to update the cart display
function updateCartDisplay() {
  const cartElement = document.getElementById('cart-items');
  cartElement.innerHTML = '';
  let totalAmount = 0;
  cartItems.forEach(item => {
    cartElement.innerHTML += `<li>${item.title} - $${item.price.toFixed(2)}</li>`;
    totalAmount += item.price;
  });
  document.getElementById('cart-total').textContent = totalAmount.toFixed(2);
}

// Wait for the DOM to be fully loaded before attaching event listeners
document.addEventListener('DOMContentLoaded', () => {
  // Get all "Add to Cart" buttons
  const addToCartButtons = document.querySelectorAll('.add-to-cart');

  // Attach click event listener to each button
  addToCartButtons.forEach(button => {
    button.addEventListener('click', () => {
      const bookTitle = button.parentNode.querySelector('h3').textContent;
      const bookPrice = parseFloat(button.parentNode.querySelector('.price').textContent.slice(1));
      addToCart(bookTitle, bookPrice);
      alert(`${bookTitle} added to the cart!`);
    });
  });
});

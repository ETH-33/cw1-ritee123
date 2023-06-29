window.addEventListener('DOMContentLoaded', function () {
    const booksContainer = document.querySelector('.books-container');
    const bookImages = document.querySelectorAll('.book img');
    let draggedItem = null;

    bookImages.forEach(function (bookImage) {
        bookImage.addEventListener('dragstart', function (event) {
            draggedItem = event.target;
            event.dataTransfer.setData('text/plain', null); // Required for Firefox
        });

        bookImage.addEventListener('dragend', function () {
            draggedItem = null;
        });
    });

    booksContainer.addEventListener('dragover', function (event) {
        event.preventDefault();
    });

    booksContainer.addEventListener('drop', function (event) {
        event.preventDefault();
        if (draggedItem) {
            const clone = draggedItem.cloneNode(true);
            clone.classList.add('dragged');
            booksContainer.appendChild(clone);
            draggedItem = null;
        }
    });
});



/*image slider*/
var slides = document.querySelectorAll(".image_sliders");
var count = 0;


slides.forEach((slide, index) => {
  slide.style.left = index * 100 + "%";
  console.log(slide.style.left);

});

const slideImage = function () {
  console.log(slides)
  slides.forEach((slide, index) => {
    var angle = 360;
    slide.style.transform = "translateX(-" + count * 100 + "%)";
    if (index === count) {
      slide.classList.add("animate");
    } else {
      slide.classList.remove("animate");
    }
  });
  count++;
  if (count > 2) {
    count = 0;
    angle = 0;
  }
};

window.onload = function () {
  setInterval(slideImage, 3000);

};


// document.addEventListener('DOMContentLoaded', function() {
//   var demo = document.querySelector(".demo");
//   var strings = ["Explore the World of Lens and Cameras"];
//   var currentStringIndex = 0;
//   var currentCharIndex = 0;
//   var direction = 1;
//   var intervalId = setInterval(function() {
//     var currentString = strings[currentStringIndex];
//     var currentChar = currentString.charAt(currentCharIndex);
//     demo.textContent = currentString.substring(0, currentCharIndex + 1);
//     currentCharIndex += direction;
//     if (currentCharIndex === currentString.length || currentCharIndex === 0) {
//       direction = -direction;
//       currentStringIndex = (currentStringIndex + 1) % strings.length;
//     }
//   }, 70);
// });


// Get the element containing the text to be typed
var element = document.querySelector('.typewrite');

// Get the data-type attribute of the element and parse it as JSON
var data = JSON.parse(element.getAttribute('data-type'));

// Initialize the index of the current string, the current text and the flag to determine typing or erasing
var index = 0;
var currentText = '';
var isTyping = true;

// Define the function that will be called to type or erase the text
function type() {
  // Get the current string from the data array
  var text = data[index];

  // Set the text of the element to the current text
  element.innerHTML = currentText;

  // Check if the current text is equal to the current string, and if so, toggle the flag
  if (currentText === text) {
    isTyping = !isTyping;
  }

  // If typing, set the current text to a substring of the current string
  if (isTyping) {
    currentText = text.substring(0, currentText.length + 1);
  }
  // If erasing, set the current text to a substring of the current text
  else {
    currentText = currentText.substring(0, currentText.length - 1);
  }

  // If the current text is empty, move to the next string in the array
  if (currentText === '') {
    index++;
    if (index >= data.length) {
      index = 0;
    }
    isTyping = true;
  }

  // Use setTimeout to call the function again after a delay
  setTimeout(type, isTyping ? 100 : 50);
}

// Call the function to start the typing and erasing animation
setTimeout(type, 2000);


function openCity(category) {
  if (category === 'cameras') {
    document.getElementById('cameras').style.display = 'block';
    document.getElementById('lenses').style.display = 'none';
    document.getElementById('cells').style.display = 'none';
  }
  if (category === 'lenses') {
    document.getElementById('lenses').style.display = 'block';
    document.getElementById('cameras').style.display = 'none';
    document.getElementById('cells').style.display = 'none';
  }
  if (category === 'cells') {
    document.getElementById('cells').style.display = 'block';
    document.getElementById('cameras').style.display = 'none';
    document.getElementById('lenses').style.display = 'none';
  }

}



//Quick View Products   
const modals = document.querySelectorAll(".modal");
const viewBtns = document.querySelectorAll(".view-btn");

//Loop over each view button and add an event listener to open the corresponding modal
viewBtns.forEach((btn, index) => {
  btn.addEventListener("click", () => {
    event.preventDefault();
    modals[index].style.display = "block";
  });
});

//When the user clicks anywhere outside of the modal, close it
window.addEventListener("click", (event) => {
  modals.forEach((modal) => {
    if (event.target == modal) {
      modal.style.display = "none";
    }
  });
});



//Add Quantity
let quantity = 0; // initial quantity

function addQuantity() {
  quantity++; // increment quantity by 1
  updateQuantity(); // update quantity display
}

function subtractQuantity() {
  if (quantity > 0) { // check if quantity is greater than 0
    quantity--; // decrement quantity by 1
    updateQuantity(); // update quantity display
  }
}

function updateQuantity() {
  document.getElementById("quantity").innerHTML = quantity; // update quantity display
}


//Nabar JS
// Get the navbar element
const navbar = document.getElementsByClassName('navbar')[0];

// Get the offset position of the navbar
const stickyOffset = navbar.offsetTop + 150;
console.log(navbar.offsetTop);
console.log("Hello");
// Add a scroll event listener to the window
window.addEventListener('scroll', function() {
  // If the scroll position is below the offset position, add the "sticky" class to the navbar
  if (window.pageYOffset >= stickyOffset) {
    navbar.classList.add('sticky');
  } else {
    // Otherwise, remove the "sticky" class
    navbar.classList.remove('sticky');
  }
});









// author
const books = [
    { title: "Cold people", author: "Author 1" },
    { title: "saving time", author: "Author 2" },
    { title: "Book 3", author: "Author 3" },
    { title: "Book 4", author: "Author 4" },
    { title: "Book 5", author: "Author 5" }
];

function searchBooks() {
    const searchInput = document.getElementById("searchInput");
    const searchTerm = searchInput.value.toLowerCase();
    const searchResults = document.getElementById("searchResults");

    // Clear previous search results
    searchResults.innerHTML = "";

    // Find matching books
    const matchingBooks = books.filter(book => {
        return book.title.toLowerCase().includes(searchTerm) ||
            book.author.toLowerCase().includes(searchTerm);
    });

    if (matchingBooks.length === 0) {
        // Display error message when no books match the search term
        searchResults.textContent = "Error no such book available .";
    } else {
        // Display matching books
        matchingBooks.forEach(book => {
            const bookElement = document.createElement("div");
            bookElement.textContent = book.title + " by " + book.author;
            searchResults.appendChild(bookElement);
        });
    }
}
// Get references to the input field, search button, and results container
const input = document.getElementById('search-input');
const button = document.getElementById('search-button');
const resultsContainer = document.getElementById('results');


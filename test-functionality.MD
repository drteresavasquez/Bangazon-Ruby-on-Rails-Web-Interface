## Testing the App Functionality
1. User Signup and Login
* On the Bangazon home page, click the Signup button.
* The user should be taken to a form for entering user information and a password.
* On submit, the user will be returned to the home page. Menu option will appear in the navbar and a success message will appear.
* On login, the menu option and success message will also appear.
 
2. User log out
 * When the user clicks ACCOUNT > LOG OUT in the navbar, the user is logged out and returned to the home page. The menu options are hidden.
 
3. Shopping
* When the user clicks SHOP in the navbar, the user has the option to SEE PRODUCT CATEGORIES and FIND LOCAL ITEMS.
* Selecting SEE PRODUCT CATEGORIES Will show a page with: 1) All of the categories in the database. 2) The number of products available for each category. 3.) The first three products from each category.  
* Clicking on the product category shows a view with all of the products from that category. Clicking the product name returns all of the product details.
 * Clicking FIND LOCAL ITEMS returns a list of products from sellers whose cities match the city of the logged in user. To view this functionality, log in as email0@example.com, password: 123456 and click FIND LOCAL ITEMS. About 9 random items will be displayed. Inspecting the database will show that these are items from 9 users that were seeded to the database with the city Hill, TN. 
 
4. Selling
* When the user clicks SELL in the navbar, the user has the option to see MY PRODUCTS or to SELL IT! 
* Selecting MY PRODUCTS will either show a list of products and current inventory, or a view that says "You don't have any products" and button to add products.
* Selecting SELL IT! will take the user to the CREATE NEW PRODUCT form. The user can add information about the new product. The expiration date defaults to one month from the current date. The user has the option to make a product "local", which makes it available to users from the same city when those users select FIND LOCAL ITEMS. 
* The user has the ability to upload an image of the product. On submitting the form, the product and the image will be displayed. 

5. Account
* Clicking ACCOUNT > MY PROFILE takes the user to her or his profile page. The user can see user information, payment types, and the products they are selling. 
* A gravatar image for that user will be shown if the user has one (one can be created [here](https://en.gravatar.com/)). 
* Clicking EDIT ACCOUNT from the profile page, or clicking ACCOUNT > SETTINGS from the navbar, will take the user to a form where user information can be edited.
* Clicking ADD NEW PAYMENT from the profile page takes the user to a form where new payment information can be entered. 

6. Error messages
* When signing up, if any field is blank an error message will be shown. Also, a REGEX expression checks for valid email addresses, so example_example.com, example@examplecom, or example@example,com will produce an error message. Lastly, the signup checks for duplicate email addresses in the database, so signing up with example@example.com twice will show an error message.
* When creating a new product, if any field is blank, an error message will be shown. An error message will also be shown if the user enters an expiration date that precedes the current date.

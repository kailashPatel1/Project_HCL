<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>E-Commerce Home</title>
    <link rel="stylesheet" href="styles.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            text-align: center;
        }
        header {
            background:black;
            color: white;
            padding: 15px;
        }
        nav ul {
            list-style: none;
            padding: 0;
        }
        nav ul li {
            display: inline;
            margin: 0 15px;
        }
        nav ul li a {
            color: white;
            text-decoration: none;
        }
        .banner {
            background: #f4f4f4;
            padding: 50px;
        }
        .products {
            display: flex;
            justify-content: center;
            gap: 20px;
            padding: 20px;
        }
        .product {
            border: 1px solid #ddd;
            padding: 10px;
            width: 200px;
        }
          .product button {
            background-color: #28a745;
            color: white;
            border: none;
            padding: 10px;
            width: 100%;
            border-radius: 5px;
            cursor: pointer;
        }
        .product img {
            width: 200px;
            height: 200px;
            //object-fit: cover;
        }
        footer {
            background: #333;
            color: white;
            padding: 10px;
            margin-top: 20px;
        }
        header{
        	display: flex;
        	justify-content: space-between;
        	align-item:center;
        }
        nav{
        	display: flex;
        	margin:25px
        }
        button {
            background-color: red;
            color: white;
            border: none;
            padding: 10px;
            width: 10%;
            border-radius: 5px;
            cursor: pointer;
        }
        .search-container {
            position: relative;
            width: 300px;
        }
        .search-input {
            width: 100%;
            padding: 10px;
            border: 2px solid #ccc;
            border-radius: 20px;
            outline: none;
        }
        .search-button {
            position: absolute;
            right: 10px;
            top: 50%;
            transform: translateY(-50%);
            background: none;
            border: none;
            cursor: pointer;
        }
        .search-button img {
            width: 16px;
            height: 16px;
        }
        ul{
        margin:20px
        }
    </style>
</head>
<body>
    <header>
        <h1>MyShop</h1>
        <nav>
            <ul>
                <li><a href="home.jsp">Home</a></li>
                <li><a href="viewProduct.jsp">Products</a></li>
                <li><a href="contact.jsp">Contact Us</a></li>
                <li><a href="myCart.jsp">Cart</a></li>               
            </ul>
            <div class="search-container">
        <input type="text" class="search-input" placeholder="Search...">
    </div>
            
        </nav>
                
    </header>
    
    <section class="banner">
        <h2>Best Deals on Latest Products</h2>
        <!--<li><a href="viewProduct.jsp">Cart</a></li>-->
        <button onclick="shopNow()">Shop Now</button>
         
    </section>
    
    <section id="products" class="products">
        <div class="product">
            <img src="image/t1.jpg" alt="Product 1">
            <h3>T-shirt </h3>
            <p>Rs299</p>
            <button onclick="addToCart('Product 1')">Add to Cart</button>
        </div>
        <div class="product">
            <img src="image/t2.jpg" alt="Product 2">
            <h3>Shirt</h3>
            <p>Rs850</p>
            <button onclick="addToCart('Product 2')">Add to Cart</button>
            
        </div>
        
        <div class="product">
            <img src="image/t18.jpg" alt="Product 2">
            <h3>Jacket</h3>
            <p>Rs999</p>
            <button onclick="addToCart('Product 2')">Add to Cart</button>
        </div>
        
        <div class="product">
            <img src="image/t8.jpg" alt="Product 2">
            <h3>Bag</h3>
            <p>Rs799</p>
            <button onclick="addToCart('Product 2')">Add to Cart</button>
        </div>
        
         <div class="product">
            <img src="image/t7.jpg" alt="Product 2">
            <h3>Cap</h3>
            <p>Rs149</p>
            <button onclick="addToCart('Product 2')">Add to Cart</button>
        </div>
        
         <div class="product">
            <img src="image/t9.jpg" alt="Product 2">
            <h3>Paint</h3>
            <p>Rs899</p>
            <button onclick="addToCart('Product 2')">Add to Cart</button>
        </div>
        
        
    </section>
    
   
    <script>
        function shopNow() {
           // alert("Redirecting to Shop Page!");
           window.location = "viewProduct.jsp";
        }
        function addToCart(product) {
            //alert(product + " added to cart!");
            window.location = "myCart.jsp";
        }
    </script>
</body>
</html>

    
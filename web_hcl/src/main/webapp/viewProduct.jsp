 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

   <!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Product Page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            text-align: center;
            margin: 0;
            padding: 20px;
        }
        .product-container {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 20px;
            max-width: 1000px;
            margin: auto;
        }
        .product {
            background: white;
            padding: 15px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .product img {
            width: 100%;
            border-radius: 5px;
        }
        .product h3 {
            margin: 10px 0;
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
        .product button:hover {
            background-color: #218838;
        }
    </style>
</head>
<body>
    <h2>Our Products</h2>
    <div class="product-container">
       
        <div class="product">
            <img src="image/t7.jpg" alt="Product 4">
            <h3>Product 1</h3>
            <p>Rs799.00</p>
            <button onclick="addToCart('Product 4')">Add to Cart</button>
        </div>
        <div class="product">
            <img src="image/t6.jpg" alt="Product 5">
            <h3>Product 2</h3>
            <p>Rs899.00</p>
            <button onclick="addToCart('Product 5')">Add to Cart</button>
        </div>
        <div class="product">
            <img src="image/t5.jpg" alt="Product 6">
            <h3>Product 3</h3>
            <p>Rs999.00</p>
            <button onclick="addToCart('Product 6')">Add to Cart</button>
        </div>
        
        <div class="product">
            <img src="image/t16.jpg" alt="Product 7">
            <h3>Product 4</h3>
            <p>Rs1199.00</p>
            <button onclick="addToCart('Product 7')">Add to Cart</button>
        </div>
        <div class="product">
            <img src="image/t14.jpg" alt="Product 8">
            <h3>Product 5</h3>
            <p>Rs12999.00</p>
            <button onclick="addToCart('Product 8')">Add to Cart</button>
        </div>
        <div class="product">
            <img src="image/t15.jpg" alt="Product 9">
            <h3>Product 6</h3>
            <p>Rs1299.00</p>
            <button onclick="addToCart('Product 9')">Add to Cart</button>
        </div>
        <div class="product">
            <img src="image/t2.jpg" alt="Product 9">
            <h3>Product 7</h3>
            <p>Rs1299.00</p>
            <button onclick="addToCart('Product 9')">Add to Cart</button>
        </div>
    <div class="product">
            <img src="image/t27.jpg" alt="Product 9">
            <h3>Product 8</h3>
            <p>Rs699.00</p>
            <button onclick="addToCart('Product 9')">Add to Cart</button>
        </div>
    <div class="product">
            <img src="image/t19.jpg" alt="Product 9">
            <h3>Product 9</h3>
            <p>Rs1299.00</p>
            <button onclick="addToCart('Product 9')">Add to Cart</button>
        </div>
     <div class="product">
            <img src="image/t28.jpg" alt="Product 9">
            <h3>Product 10</h3>
            <p>Rs4999.00</p>
            <button onclick="addToCart('Product 9')">Add to Cart</button>
        </div>
         <div class="product">
            <img src="image/t25.jpg" alt="Product 9">
            <h3>Product 11</h3>
            <p>Rs999.00</p>
            <button onclick="addToCart('Product 9')">Add to Cart</button>
        </div>
         <div class="product">
            <img src="image/t26.jpg" alt="Product 9">
            <h3>Product 12</h3>
            <p>Rs1259.00</p>
            <button onclick="addToCart('Product 9')">Add to Cart</button>
        </div>
    
    
    
    <script>
    function addToCart(product) {
        //alert(product + " added to cart!");
        window.location = "myCart.jsp";
    }
    </script>
</body>
</html>





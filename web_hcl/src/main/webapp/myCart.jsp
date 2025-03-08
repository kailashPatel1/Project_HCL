
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Shopping Cart</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            text-align: center;
            margin: 0;
            padding: 20px;
        }
        .cart-container {
            max-width: 600px;
            margin: auto;
            background: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .cart-item {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px;
            border-bottom: 1px solid #ccc;
        }
        .cart-item img {
            width: 50px;
            border-radius: 5px;
        }
        .cart-item button {
            background-color: #dc3545;
            color: white;
            border: none;
            padding: 5px 10px;
            border-radius: 5px;
            cursor: pointer;
        }
        .cart-item button:hover {
            background-color: #c82333;
        }
        .checkout-btn {
            background-color: #28a745;
            color: white;
            border: none;
            padding: 10px;
            width: 100%;
            border-radius: 5px;
            cursor: pointer;
            margin-top: 10px;
        }
        .checkout-btn:hover {
            background-color: #218838;
        }
    </style>
</head>
<body>
    <h2>Your Shopping Cart</h2>
    <div class="cart-container">
        <div class="cart-item">
            <img src="image/t7.jpg" alt="Product 1">
            <span>Product 1 - Rs199.00</span>
            <button>Remove</button>
        </div>
        <div class="cart-item">
            <img src="image/t8.jpg" alt="Product 2">
            <span>Product 2 - Rs499.00</span>
            <button>Remove</button>
        </div>
        <div class="cart-item">
            <img src="image/t6.jpg" alt="Product 3">
            <span>Product 3 - Rs999.00</span>
            <button>Remove</button>
        </div>
       
        <button class="checkout-btn" onclick="window.location.href='processcheckout.jsp'">Proceed to Checkout</button>
        
    </div>
</body>
</html>

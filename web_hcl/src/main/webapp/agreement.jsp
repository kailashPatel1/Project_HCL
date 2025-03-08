<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Agreement</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            text-align: center;
            margin: 0;
            padding: 20px;
        }
        .agreement-box {
            background: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            max-width: 600px;
            margin: auto;
            text-align: left;
        }
        .agreement-box h2 {
            text-align: center;
        }
        .agreement-box p {
            font-size: 14px;
            line-height: 1.6;
        }
        .buttons {
            display: flex;
            justify-content: space-between;
            margin-top: 20px;
        }
        .buttons button {
            padding: 10px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            width: 48%;
        }
        .accept-btn {
            background-color: #28a745;
            color: white;
        }
        .decline-btn {
            background-color: #dc3545;
            color: white;
        }
    </style>
</head>
<body>
    <div class="agreement-box">
        <h2>User Agreement</h2>
        <p>By using this website, you agree to the following terms and conditions:</p>
        <p>1. You must be at least 18 years old to use our services.</p>
        <p>2. We are not responsible for any loss or damage caused by misuse of this website.</p>
        <p>3. Your data will be stored securely and will not be shared with third parties without your consent.</p>
        <p>4. We reserve the right to update these terms at any time.</p>
        
        <form action="agreementHandler.jsp" method="post">
        
            <div class="buttons">
                <button type="submit" name="action" value="accept" class="accept-btn">Accept</button>
                <button type="submit" name="action" value="decline" class="decline-btn">Decline</button>
            </div>
        </form>
    </div>
</body>
</html>


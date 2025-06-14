<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Booking Successful</title>
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            background: linear-gradient(135deg, #dfa974 0%, #fff6e0 100%);
            min-height: 100vh;
            font-family: 'Montserrat', sans-serif;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .success-container {
            background: #fff;
            border-radius: 16px;
            box-shadow: 0 8px 32px rgba(0,0,0,0.1);
            padding: 48px 32px;
            text-align: center;
            max-width: 400px;
            width: 100%;
        }
        .success-icon {
            font-size: 64px;
            color: #dfa974;
            margin-bottom: 24px;
        }
        .success-title {
            font-size: 2rem;
            font-weight: 700;
            margin-bottom: 16px;
            color: #333;
        }
        .success-message {
            font-size: 1.1rem;
            color: #555;
            margin-bottom: 32px;
        }
        .redirect-message {
            font-size: 0.95rem;
            color: #888;
        }
        .btn-home {
            background: #dfa974;
            color: #fff;
            border: none;
            padding: 12px 32px;
            border-radius: 8px;
            font-weight: 600;
            transition: background 0.2s;
        }
        .btn-home:hover {
            background: #b97b4a;
            color: #fff;
        }
    </style>
    <script>
        setTimeout(function() {
            window.location.href = '<?= base_url() ?>home';
        }, 4000); // Redirect after 4 seconds
    </script>
</head>
<body>
    <div class="success-container">
        <div class="success-icon">
            <svg width="64" height="64" fill="none" xmlns="http://www.w3.org/2000/svg"><circle cx="32" cy="32" r="32" fill="#dfa974" opacity="0.15"/><path d="M20 34l8 8 16-16" stroke="#dfa974" stroke-width="4" stroke-linecap="round" stroke-linejoin="round"/></svg>
        </div>
        <div class="success-title">Booking Successful!</div>
        <div class="success-message">Thank you for your reservation.<br>We look forward to welcoming you at Luxe Hotel.</div>
        <a href="<?= base_url() ?>home" class="btn btn-home">Go to Home</a>
        <div class="redirect-message mt-3">You will be redirected to the home page shortly...</div>
    </div>
</body>
</html>
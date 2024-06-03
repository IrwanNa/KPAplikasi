<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="csrf-token" content="{{ csrf_token() }}">

        <title>{{ config('app.name', 'Laravel') }}</title>

        <!-- Fonts -->
        <link rel="preconnect" href="https://fonts.bunny.net">
        <link href="https://fonts.bunny.net/css?family=figtree:400,500,600&display=swap" rel="stylesheet" />

        <!-- Scripts -->
        @vite(['resources/css/app.css', 'resources/js/app.js'])
         <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

    <!-- Custom CSS -->
    <style>
        .login-container {
            max-width: 400px;
            padding: 20px;
            border: 1px solid #28a745;
            border-radius: 10px;
            background-color: #f8f9fa;
            display: flex;
            flex-direction: column;
            align-items: center;
        }
        .login-header {
            text-align: center;
            margin-bottom: 20px;
        }
        .login-header img {
            width: 300px;
            height: auto;
            margin-bottom: 10px;
        }
        .login-header h3 {
            color: #28a745;
        }
        .center-screen {
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }
    </style>
</head>
<body class="font-sans antialiased">
    <div class="min-h-screen bg-gray-100 dark:bg-gray-900">
        <div class="center-screen">
            <div class="login-container">
                <div class="login-header">
                    <img src="{{ asset('images/logo.png') }}" alt="Logo">
                    <h3>Zona Admin</h3>
                </div>
                <div class="mt-6">
                    {{ $slot }}
                </div>
            </div>
        </div>
    </div>
    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>

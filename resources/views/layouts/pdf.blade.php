<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Invoice PDF</title>

    <link href="{{ asset('vendor/fontawesome-free/css/all.min.css') }}" rel="stylesheet">
    <link href="{{ asset('css/sb-admin-2.min.css') }}" rel="stylesheet">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <style>
        @media print {
            @page {
                size: A4;
                margin: 20mm;
            }

            .row {
                display: flex;
                flex-wrap: nowrap;
            }

            .col-md-6 {
                flex: 0 0 50%;
                max-width: 50%;
            }

            .mb-4 {
                margin-bottom: 5mm;
            }

            p {
                margin: 0;
                padding: 0;
                line-height: 1.3;
                font-size: 10pt;
            }

            body {
                font-family: Arial, sans-serif;
                font-size: 10pt;
                line-height: 1.3;
            }

            table {
                border-collapse: collapse;
                width: 100%;
            }

            table,
            th,
            td {
                border: 1px solid black;
            }
        }
       table {
            border-collapse: collapse;
            width: 100%;
        }
        table,th,td {
            border: 1px solid black;
        }
    </style>
</head>

<body>
    @yield('content')
</body>

</html>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Valentine's Day Special</title>
    <style>
        body {
            background-color: #ffcccb;
            font-family: 'Arial', sans-serif;
            text-align: center;
            margin: 0;
            overflow: hidden;
            color: #800000;
        }

        h1 {
            margin-top: 50px;
            font-size: 3em;
        }

        .balloon {
            position: absolute;
            bottom: -100px;
            width: 60px;
            height: 80px;
            border-radius: 50%;
            background-color: #ff69b4;
            animation: float 4s ease-in-out infinite;
        }

        .balloon::after {
            content: '';
            position: absolute;
            left: 50%;
            bottom: -10px;
            width: 2px;
            height: 10px;
            background-color: #ff69b4;
            transform: translateX(-50%);
        }

        .balloon:nth-child(2) {
            left: 20%;
            animation-duration: 5s;
            background-color: #ff4500;
        }

        .balloon:nth-child(3) {
            left: 40%;
            animation-duration: 6s;
            background-color: #ff1493;
        }

        .balloon:nth-child(4) {
            left: 60%;
            animation-duration: 7s;
            background-color: #db7093;
        }

        .balloon:nth-child(5) {
            left: 80%;
            animation-duration: 8s;
            background-color: #ff6347;
        }

        @keyframes float {
            0% {
                transform: translateY(0);
            }

            50% {
                transform: translateY(-200px);
            }

            100% {
                transform: translateY(0);
            }
        }

        .button-container {
            margin-top: 50px;
            position: relative;
        }

        .button {
            display: inline-block;
            padding: 15px 30px;
            margin: 10px;
            font-size: 1.2em;
            color: white;
            background-color: #ff69b4;
            border: none;
            border-radius: 25px;
            cursor: pointer;
            position: relative;
        }

        .button: hover {
            background-color: #ff1493;
        }

        .moving-button {
            position: absolute;
            transition: transform 0.3s ease;
        }
    </style>
</head>

<body>
    <h1>Happy Valentine's Day!</h1>
    <div class="balloon"></div>
    <div class="balloon"></div>
    <div class="balloon"></div>
    <div class="balloon"></div>
    <div class="balloon"></div>

    <div class="button-container">
        <button class="button" onclick="window.location.href='upload.html'">Upload Pictures</button>
        <button class="button moving-button">Catch Me!</button>
    </div>

    <script>
        const movingButton = document.querySelector('.moving-button');

        movingButton.addEventListener('mouseover', () => {
            const x = Math.random() * (window.innerWidth - movingButton.clientWidth);
            const y = Math.random() * (window.innerHeight - movingButton.clientHeight);
            movingButton.style.transform = `translate(${x}px, ${y}px)`;
        });

        movingButton.addEventListener('click', () => {
            alert("Nice try! Keep chasing me!");
        });
    </script>
</body>

</html>

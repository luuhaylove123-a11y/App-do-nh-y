<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Độ Nhạy Free Fire - Zeres Device</title>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;600;700;800;900&display=swap" rel="stylesheet">
    <style>
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
            font-family: 'Montserrat', sans-serif;
            user-select: none; /* Ngăn chặn bôi đen text */
        }

        body {
            background-color: #050a15; /* Nền tối */
            background-image: radial-gradient(circle at center, #143059 0%, #050a15 100%);
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px 15px;
            color: white;
        }

        /* Khung viền chính */
        .app-card {
            background: rgba(20, 40, 80, 0.6);
            border: 2px solid #4a90e2;
            border-radius: 20px;
            padding: 25px 20px;
            width: 100%;
            max-width: 400px;
            box-shadow: 0 0 25px rgba(74, 144, 226, 0.5), inset 0 0 15px rgba(74, 144, 226, 0.2);
            backdrop-filter: blur(5px);
            text-align: center;
            position: relative;
            overflow: hidden;
        }

        /* Tiêu đề */
        .header h1 {
            font-size: 22px;
            color: #ffffff;
            font-weight: 800;
            text-transform: uppercase;
            letter-spacing: 1px;
            text-shadow: 0 0 10px #00d2ff, 0 0 20px #00d2ff;
            margin-bottom: 5px;
        }

        .header p {
            font-size: 12px;
            color: #ffffff;
            font-weight: 700;
            text-transform: uppercase;
            margin-bottom: 25px;
            letter-spacing: 1px;
        }

        /* Ô nhập liệu */
        .input-group {
            margin-bottom: 15px;
        }

        .input-group input {
            width: 100%;
            background: #0c1830;
            border: 1px solid #1a305a;
            border-radius: 12px;
            padding: 15px;
            color: #ffffff;
            font-size: 14px;
            font-weight: 600;
            outline: none;
            text-align: center;
            transition: border-color 0.3s;
        }

        .input-group input::placeholder {
            color: #8fa5c1;
            font-weight: 500;
        }

        .input-group input:focus {
            border-color: #00d2ff;
            box-shadow: 0 0 10px rgba(0, 210, 255, 0.3);
        }

        /* Nút NHẬN ĐỘ NHẠY */
        .btn-generate {
            width: 100%;
            background: linear-gradient(90deg, #00e5ff 0%, #7ef2ff 40%, #ffea00 100%);
            border: none;
            border-radius: 12px;
            padding: 15px;
            color: #0a1428;
            font-size: 16px;
            font-weight: 800;
            text-transform: uppercase;
            cursor: pointer;
            box-shadow: 0 0 15px rgba(0, 229, 255, 0.4);
            transition: transform 0.1s, box-shadow 0.3s;
            margin-bottom: 20px;
        }

        .btn-generate:active {
            transform: scale(0.98);
        }

        /* Khu vực hiển thị kết quả */
        .result-section {
            display: none;
            animation: fadeIn 0.4s ease-in-out;
        }

        .result-section.show {
            display: block;
        }

        .device-name {
            font-size: 14px;
            font-weight: 700;
            color: #ffffff;
            margin-bottom: 15px;
            text-transform: uppercase;
        }

        /* Danh sách thông số */
        .sens-list {
            list-style: none;
            display: flex;
            flex-direction: column;
            gap: 8px;
        }

        .sens-list li {
            background: #122a52;
            border: 1px solid #1a3b6a;
            border-radius: 8px;
            padding: 12px 15px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            font-size: 13px;
            color: #ffffff;
            font-weight: 700;
            box-shadow: inset 0 0 10px rgba(0, 0, 0, 0.2);
        }

        .sens-list li .value {
            color: #ffffff;
            font-size: 15px;
            font-weight: 800;
            text-shadow: 0 0 5px rgba(255, 255, 255, 0.5);
        }

        /* Footer */
        .footer {
            margin-top: 25px;
            color: #8fa5c1;
            font-size: 11px;
            font-weight: 600;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(10px); }
            to { opacity: 1; transform: translateY(0); }
        }
    </style>
</head>
<body>

<div class="app-card">
    <div class="header">
        <h1>ĐỘ NHẠY FREE FIRE</h1>
        <p>APP ĐỘ NHẠY TỰ ĐỘNG 100%</p>
    </div>

    <div class="input-group">
        <input type="text" id="deviceInput" placeholder="Nhập tên thiết bị: iPhone 11, Redmi Note 12...">
    </div>

    <button class="btn-generate" id="generateBtn">NHẬN ĐỘ NHẠY</button>

    <div class="result-section" id="resultSection">
        <p class="device-name">Thiết bị: <span id="displayDevice">SAMSUNG A05S</span></p>
        <ul class="sens-list" id="sensList">
            <!-- Dữ liệu sẽ được thêm bằng JS -->
        </ul>
    </div>

    <div class="footer">Made by Zeres Device</div>
</div>

<script>
    document.getElementById('generateBtn').addEventListener('click', function() {
        const deviceInput = document.getElementById('deviceInput').value.trim();
        const displayDevice = document.getElementById('displayDevice');
        const resultSection = document.getElementById('resultSection');
        const sensList = document.getElementById('sensList');

        // Lấy tên thiết bị, nếu trống thì để mặc định giống trong hình
        const deviceName = deviceInput ? deviceInput.toUpperCase() : 'SAMSUNG A05S';
        displayDevice.textContent = deviceName;

        // Cấu hình các thông số độ nhạy (Giới hạn min-max để tạo số ngẫu nhiên)
        const settings = [
            { name: 'Nhìn Xung Quanh', min: 100, max: 200 },
            { name: 'Red Dot', min: 100, max: 200 },
            { name: 'Ống Ngắm 2X', min: 100, max: 200 },
            { name: 'Ống Ngắm 4X', min: 150, max: 200 },
            { name: 'Ống Ngắm AWM', min: 100, max: 150 },
            { name: 'Nhìn Tự Do', min: 90, max: 150 },
            { name: 'Nút Bắn', min: 40, max: 60, isPercent: true }
        ];

        // Xóa danh sách cũ
        sensList.innerHTML = '';

        // Tạo và thêm các thẻ li mới
        settings.forEach(setting => {
            // Tạo số ngẫu nhiên trong khoảng min - max
            const randomValue = Math.floor(Math.random() * (setting.max - setting.min + 1)) + setting.min;
            
            const li = document.createElement('li');
            li.innerHTML = `
                <span>${setting.name}</span>
                <span class="value">${randomValue}${setting.isPercent ? '%' : ''}</span>
            `;
            sensList.appendChild(li);
        });

        // Hiển thị kết quả
        resultSection.classList.add('show');
    });
</script>

</body>
</html>

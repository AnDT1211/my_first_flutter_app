import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: BouncingButton(),
        ),
      ),
    );
  }
}

// Tạo riêng một Widget có trạng thái để quản lý hiệu ứng phóng to/thu nhỏ
class BouncingButton extends StatefulWidget {
  const BouncingButton({super.key});

  @override
  State<BouncingButton> createState() => _BouncingButtonState();
}

class _BouncingButtonState extends State<BouncingButton> {
  // Biến tỉ lệ: 1.0 là kích thước chuẩn, 1.15 là phóng to 15%
  double _scale = 1.0;

  void _onTap() async {
    // 1. Phóng to nút
    setState(() {
      _scale = 1.15;
    });

    // 2. Chờ 120ms trong lúc nút đang to
    await Future.delayed(const Duration(milliseconds: 120));

    // 3. Trả về kích thước ban đầu
    setState(() {
      _scale = 1.0;
    });

    print('Đã kích hoạt hành động!');
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedScale(
      scale: _scale,
      duration: const Duration(milliseconds: 150), // Thời gian biến đổi độ lớn
      curve: Curves.easeOut,                       // Gia tốc chuyển động mượt mà
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
          backgroundColor: Colors.blueAccent,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: _onTap,
        child: const Text(
          'Bấm thử xem!',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
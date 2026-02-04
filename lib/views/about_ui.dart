import 'package:flutter/material.dart';

class AboutUi extends StatefulWidget {
  const AboutUi({super.key});

  @override
  State<AboutUi> createState() => _AboutUiState();
}

class _AboutUiState extends State<AboutUi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 10),
                Text(
                  'Body Health Calculator',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),

                const SizedBox(height: 20),

                Image.asset(
                  'assets/images/calculator.png',
                  width: 120,
                  height: 120,
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 20),

                Text(
                  'คำนวณหาค่าดัชนีมวลกาย (BMI)',
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),

                Text(
                  'คำนวณหาค่าแคลอรี่ที่ร่างกายต้องการในแต่ละวัน (BMR)',
                  textAlign: TextAlign.center,
                ),
        ],
      ),
    ),

                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                Image.network(
                  'https://upload.wikimedia.org/wikipedia/commons/4/47/Logosau-02.png',
                  width: 60,
                ),
                Text(
                  'Developed by Chatinon SAU 2026',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: 40),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

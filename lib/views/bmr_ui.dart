import 'package:flutter/material.dart';

class BmrUi extends StatefulWidget {
  const BmrUi({super.key});

  @override
  State<BmrUi> createState() => _BmrUiState();
}

class _BmrUiState extends State<BmrUi> {
  TextEditingController wCtrl = TextEditingController();
  TextEditingController hCtrl = TextEditingController();
  TextEditingController ageCtrl = TextEditingController();

  String gender = 'male'; // 'male' or 'female'
  double bmrValue = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Center(
            child: Column(
              children: [
                SizedBox(height: 10),
                Text(
                  'คำนวณอัตราการเผาผลาญพื้นฐาน (BMR)',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[800],
                  ),
                ),
                SizedBox(height: 30),
                Image.asset(
                  'assets/images/bmi.png',
                  width: 160,
                  height: 160,
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 35),

                Align(
                  alignment: Alignment.centerLeft,
                  child: Text('เพศ'),
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: RadioListTile<String>(
                        title: Text('ชาย'),
                        value: 'male',
                        groupValue: gender,
                        onChanged: (v) {
                          setState(() {
                            gender = v!;
                          });
                        },
                      ),
                    ),
                    Expanded(
                      child: RadioListTile<String>(
                        title: Text('หญิง'),
                        value: 'female',
                        groupValue: gender,
                        onChanged: (v) {
                          setState(() {
                            gender = v!;
                          });
                        },
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 10),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text('อายุ (ปี)'),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: ageCtrl,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'กรอกอายุของคุณ',
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 20,
                      horizontal: 20,
                    ),
                  ),
                ),

                SizedBox(height: 20),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text('น้ำหนัก (kg.)'),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: wCtrl,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'กรอกน้ำหนักของคุณ',
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 20,
                      horizontal: 20,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text('ส่วนสูง (cm.)'),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: hCtrl,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'กรอกส่วนสูงของคุณ',
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 20,
                      horizontal: 20,
                    ),
                  ),
                ),
                SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    // Validate inputs
                    if (wCtrl.text.isEmpty || hCtrl.text.isEmpty || ageCtrl.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('กรุณากรอกข้อมูลให้ครบถ้วน'),
                          backgroundColor: Colors.red,
                          duration: Duration(seconds: 2),
                        ),
                      );
                      return;
                    }

                    double w = double.parse(wCtrl.text);
                    double h = double.parse(hCtrl.text);
                    double age = double.parse(ageCtrl.text);

                    double result = 0;
                    if (gender == 'male') {
                      result = 66 + (13.7 * w) + (5 * h) - (6.8 * age);
                    } else {
                      result = 665 + (9.6 * w) + (1.8 * h) - (4.7 * age);
                    }

                    setState(() {
                      bmrValue = result;
                    });
                  },
                  child: Text(
                    'คำนวณ BMR',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepOrange,
                    textStyle: TextStyle(fontSize: 18),
                    fixedSize: Size(
                      MediaQuery.of(context).size.width,
                      55.0,
                    ),
                  ),
                ),
                SizedBox(height: 15),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      wCtrl.text = '';
                      hCtrl.text = '';
                      ageCtrl.text = '';
                      gender = 'male';
                      bmrValue = 0;
                    });
                  },
                  child: Text(
                    'ล้างข้อมูล',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[400],
                    textStyle: TextStyle(fontSize: 18),
                    fixedSize: Size(
                      MediaQuery.of(context).size.width,
                      55.0,
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(8),
                  ),      
                  child: Center(
                    child: Column(
                      children: [
                        Text(
                          'BMR (kcal/day)',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[800],
                          ),
                        ),
                        Text(
                          bmrValue.toStringAsFixed(2),
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: Colors.red[800],
                          ),
                        ),
                      ],
                    ),
                  ),            
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:fn_641463011/regis.dart';
import 'package:fn_641463011/menu.dart';

class Login extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  void SubmitLogin(BuildContext context) async {
    String email = emailController.text;
    String password = passwordController.text;
// URL ของ API ที่คุณต้องการเรียกใช้ (saveregister.php)
    String apiUrl = 'http://localhost/api/checklogin.php';
//print(apiUrl);
// สร้าง body ของ request เพื่อส่งข้อมูล
    Map<String, dynamic> requestBody = {
      'email': email,
      'password': password,
    };
    try {
      var response = await http.post(
        Uri.parse(apiUrl),
        body: requestBody,
      );
      print(response.statusCode);
      if (response.statusCode == 200) {
        print('Login Successfully');
        showSuccessDialog(context);
      } else {
// ด าเนินการเมื่อ request ไม่ส าเร็จ
        print('Login Error');
        showLoginErrorDialog(context);
      }
    } catch (error) {
// ด าเนินการเมื่อเกิดข้อผิดพลาดในการเชื่อมต่อ
      print('เกิดข้อผิดพลาดในการเชื่อมต่อ: $error');
      showNotConnectDialog(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image(
                image: AssetImage(
                    'images/smf.jpg'), // เปลี่ยนเป็นที่อยู่ของรูปภาพที่คุณใช้
                width: 200.0, // กำหนดความกว้าง
                height: 200.0, // กำหนดความสูง
              ),
              Text(
                'Smart Farm Platform for Farmer',
                style: TextStyle(
                  fontSize: 30, // ปรับขนาดตามที่ต้องการ
                  fontWeight: FontWeight
                      .bold, // เพิ่มส่วนของการกำหนดความหนาของตัวหนังสือตามต้องการ
                ),
              ),
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(labelText: 'username'),
              ),
              TextFormField(
                controller: passwordController,
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true, // ซ่อนข้อความในรหัสผ่าน
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  SubmitLogin(context);
                },
                child: Text(
                  'เข้าสู่ระบบ',
                  style: TextStyle(fontSize: 20),
                ),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                ),
              ),
              SizedBox(height: 8.0),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => Regis(),
                  ));
                },
                child: Text(
                  'ลงทะเบียนใช้งาน',
                  style: TextStyle(fontSize: 20),
                ),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void showNotConnectDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('การเชื่อมต่อล้มเหลว???'),
        content: Text('การเชื่อมต่อของคุณล้มเหลว...'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // ปิดป๊อปอัพ
            },
            child: Text('กลับ'),
          ),
        ],
      );
    },
  );
}

void showSuccessDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('สำเร็จ!'),
        content: Text('ทำการลงชื่อเข้าใช้สำเร็จเรียบร้อย'),
        actions: [
          TextButton(
            onPressed: () {
//Navigator.of(context).pop(); // ปิดป๊อปอัพ
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => MainMenu()));
            },
            child: Text('ไปยังหน้าเมนูหลัก'),
          ),
        ],
      );
    },
  );
}

void showLoginErrorDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('ลงชื่อเช้าใช้ล้มเหลว'),
        content: Text(
            'ไม่มีข้อมูลผู้ใช้นี้ กรุณาลองตรวจสอบ Email หรือ password ของท่านใหม่'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // ปิดป๊อปอัพ
            },
            child: Text('OK'),
          ),
        ],
      );
    },
  );
}

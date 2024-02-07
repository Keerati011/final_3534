import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:fn_641463011/login.dart';

class Regis extends StatefulWidget {
  @override
  _RegisterUserFormState createState() => _RegisterUserFormState();
}

class _RegisterUserFormState extends State<Regis> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  void registerUser() async {
    String firstName = firstNameController.text;
    String lastName = lastNameController.text;
    String address = addressController.text;
    String phone = phoneController.text;
    String email = emailController.text;
    String user = usernameController.text;
    String password = passwordController.text;

    String apiUrl = 'http://localhost/api/saveregister.php';

    Map<String, dynamic> requestBody = {
      'firstname': firstName,
      'lastname': lastName,
      'address': address,
      'phone': phone,
      'email': email,
      'user': user,
      'password': password,
    };
    try {
      var response = await http.post(
        Uri.parse(apiUrl),
        body: requestBody,
      );
      print(response.statusCode);

      if (response.statusCode == 200) {
        showSuccessDialog(context);
      } else {
        print('ไม่สามารถสมัครสมาชิกได้');
      }
    } catch (error) {
      print('เกิดข้อผิดพลาดในการเชื่อมต่อ : $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('หน้าลงทะเบียน'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              controller: firstNameController,
              decoration: InputDecoration(labelText: 'ชื่อจริง'),
            ),
            TextFormField(
              controller: lastNameController,
              decoration: InputDecoration(labelText: 'นามสกุล'),
            ),
            TextFormField(
              controller: addressController,
              decoration: InputDecoration(labelText: 'ที่อยู่'),
            ),
            TextFormField(
              controller: phoneController,
              decoration: InputDecoration(labelText: 'เบอร์โทรศัพท์'),
            ),
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextFormField(
              controller: usernameController,
              decoration: InputDecoration(labelText: 'username'),
            ),
            TextFormField(
              controller: passwordController,
              decoration: InputDecoration(labelText: 'Password'),
            ),
            ElevatedButton(
              onPressed: registerUser,
              child: Text(
                'บันทึก',
                style: TextStyle(fontSize: 20),
              ),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              ),
            ),
            TextButton(
              onPressed: () {
// เพิ่มการไปหน้าสร้างผู้ใช้ที่นี่
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => Login(),
                ));
              },
              child: Text(
                'ย้อนกลับ',
                style: TextStyle(fontSize: 20),
              ),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void showSuccessDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('สำเร็จเรียบร้อย'),
        content: Text('ข้อมูลของคุณถูกบันทึกเรียบร้อยแล้ว'),
        actions: [
          TextButton(
            onPressed: () {
//Navigator.of(context).pop(); // ปิดป๊ อปอัพ
              Navigator.of(context).pushReplacement(MaterialPageRoute(
//builder: (context) => MainMenu(),
                  builder: (context) => Login()));
            },
            child: Text('ไปยังหน้าเข้าใช้งาน'),
          ),
        ],
      );
    },
  );
}

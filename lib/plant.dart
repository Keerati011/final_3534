import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:fn_641463011/editplant.dart';

class PlantsDataPage extends StatefulWidget {
  @override
  _PlantsDataPageState createState() => _PlantsDataPageState();
}

class _PlantsDataPageState extends State<PlantsDataPage> {
  late Future<List<Map<String, dynamic>>> _plantsData;

  Future<List<Map<String, dynamic>>> _fetchPlantsData() async {
    final response =
        await http.get(Uri.parse('http://localhost/api/selectplants.php'));
    print(response.statusCode);
    if (response.statusCode == 200) {
      final List<dynamic> parsed = json.decode(response.body);
      return parsed.cast<Map<String, dynamic>>();
    } else {
      throw Exception('ไม่สามารถเชื่อมต่อข้อมูลได้ กรุณาตรวจสอบ');
    }
  }

  @override
  void initState() {
    super.initState();
    _plantsData = _fetchPlantsData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen.shade400,
        leading: IconButton(
          icon: Icon(Icons.home_outlined),
          color: Colors.red,
          onPressed: () {},
        ),
        title: Text(
          'Plants Data',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: _plantsData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('ไม่พบข้อมูล'));
          } else {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(width: 10),
                    Text(
                      'Plants Data',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: DataTable(
                      columns: <DataColumn>[
                        DataColumn(label: Text(' ')),
                        DataColumn(label: Text('Plant ID')),
                        DataColumn(label: Text('Plant Name')),
                        DataColumn(label: Text('Edit')),
                      ],
                      rows: snapshot.data!.map((data) {
                        return DataRow(
                          cells: <DataCell>[
                            DataCell(Text(' ')),
                            DataCell(Text(data['plant_id'].toString())),
                            DataCell(Text(data['plant_name'].toString())),
                            DataCell(IconButton(
                              icon: Icon(Icons.edit),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        EditDataPage(data: data),
                                  ),
                                );
                              },
                            )),
                          ],
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: PlantsDataPage(),
  ));
}

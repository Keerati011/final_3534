import 'package:flutter/material.dart';
import 'package:fn_641463011/plant.dart';

class MainMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('เมนูหลัก'),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        padding: EdgeInsets.all(10),
        children: [
          InkWell(
            onTap: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => PlantsDataPage(),
              ));
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                  image: AssetImage('images/plant.png'),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.5),
                    BlendMode.dstATop,
                  ),
                ),
              ),
              child: Center(
                child: Text(
                  'ข้อมูลพืช',
                  style: TextStyle(
                    color: const Color.fromARGB(255, 0, 0, 0),
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              // เพิ่มโค้ดเมื่อคลิกเมนู 'ข้อมูลแหล่งปลูก'
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                  image: AssetImage('images/greenhouse.png'),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.5),
                    BlendMode.dstATop,
                  ),
                ),
              ),
              child: Center(
                child: Text(
                  'ข้อมูลแหล่งปลูก',
                  style: TextStyle(
                    color: const Color.fromARGB(255, 0, 0, 0),
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              // เพิ่มโค้ดเมื่อคลิกเมนู 'ข้อมูลรอบการปลูก'
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                  image: AssetImage('images/clock.png'),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.5),
                    BlendMode.dstATop,
                  ),
                ),
              ),
              child: Center(
                child: Text(
                  'ข้อมูลรอบการปลูก',
                  style: TextStyle(
                    color: const Color.fromARGB(255, 0, 0, 0),
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              // เพิ่มโค้ดเมื่อคลิกเมนู 'ข้อมูลเก็บเกี่ยวผลผลิต'
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                  image: AssetImage('images/harvest.png'),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.5),
                    BlendMode.dstATop,
                  ),
                ),
              ),
              child: Center(
                child: Text(
                  'ข้อมูลเก็บเกี่ยวผลผลิต',
                  style: TextStyle(
                    color: const Color.fromARGB(255, 0, 0, 0),
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

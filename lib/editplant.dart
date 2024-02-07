import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class EditDataPage extends StatefulWidget {
  final Map<String, dynamic> data;

  EditDataPage({required this.data});

  @override
  _EditDataPageState createState() => _EditDataPageState();
}

class _EditDataPageState extends State<EditDataPage> {
  late TextEditingController plantIdController;
  late TextEditingController plantNameController;

  @override
  void initState() {
    super.initState();
    plantIdController =
        TextEditingController(text: widget.data['plant_id'].toString());
    plantNameController =
        TextEditingController(text: widget.data['plant_name'].toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Plant Data'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: plantIdController,
              decoration: InputDecoration(labelText: 'Plant ID'),
            ),
            TextFormField(
              controller: plantNameController,
              decoration: InputDecoration(labelText: 'Plant Name'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                String updatedPlantId = plantIdController.text;
                String updatedPlantName = plantNameController.text;

                String apiUrl = 'http://localhost/api/updateplant.php';

                Map<String, dynamic> requestBody = {
                  'plant_id': updatedPlantId,
                  'plant_name': updatedPlantName,
                };

                try {
                  var response = await http.post(
                    Uri.parse(apiUrl),
                    body: requestBody,
                  );

                  if (response.statusCode == 200) {
                    showSuccessDialog(
                        context, "Plant data updated successfully");
                  } else {
                    showSuccessDialog(context,
                        "Failed to update plant data. ${response.body}");
                  }
                } catch (error) {
                  showSuccessDialog(
                      context, 'Error connecting to the server: $error');
                }
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    plantIdController.dispose();
    plantNameController.dispose();
    super.dispose();
  }

  void showSuccessDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Success'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}

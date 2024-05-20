import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class NewBill extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Screen'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Text Field 1',
                ),
              ),
              SizedBox(height: 8.0),
              // Provides some space between the text fields
              TextField(
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*')),
                ],
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Text Field 2',
                ),
              ),
              SizedBox(height: 8.0),
              // Provides some space between the text fields
              ElevatedButton(
                child: Text('Select Date'),
                onPressed: () async {
                  final DateTime? picked = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2070),
                  );
                  if (picked != null) {
                    print(picked.toString());
                  }
                },
              ),
              SizedBox(height: 8.0),
              ElevatedButton(
                  onPressed: pickFile,
                child: Text("Upload image"),
              ),
            ],
          ),
        ),
      ),
    );
  }


  Future<void> pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'pdf', 'png'],
    );

    if (result != null) {
      PlatformFile file = result.files.first;

      print('Name: ${file.name}');
      print('Bytes size: ${file.size}');
      print('Path: ${file.path}');
    } else {
      // User canceled the picker
    }
  }

}

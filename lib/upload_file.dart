import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:upload_file_api/imageapi.dart';
import 'package:upload_file_api/main.dart';

class UploadFile extends StatefulWidget {
  @override
  UploadFileState createState() => UploadFileState();
}

class UploadFileState extends State<UploadFile> {
  FilePickerResult filePickerResult;
  File file;
  String fileName;
  int fileSize;
  String base64Convert;
  bool isEnabled = false;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Upload File')),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: filePick, child: Text('Click Here')),
                ElevatedButton(
                  onPressed: isEnabled ? fileUpload : null,
                  child: Text('upload'),
                ),
              ],
            ),
          ),
          isLoading ? LoadingPage() : Container()
        ],
      ),
    );
  }

  filePick() async {
    filePickerResult = await FilePicker.platform.pickFiles();
    if (filePickerResult == null) {
      print('No file selected.!');
    } else {
      file = File(filePickerResult.files.single.path);
      fileName = file.path.split("/").last;
      base64Convert = base64Encode(file.readAsBytesSync());
      fileSize = file.lengthSync();
      setState(() {
        isEnabled = true;
      });
      print('File Path --> $file');
      print('File name --> $fileName');
      print('base64Convert --> $base64Convert');
      print('File size --> $fileSize');
    }
  }

  fileUpload() async {
    setState(() {
      isLoading = true;
    });
    String response = await uploadImage(fileName, base64Convert, fileSize);
    response == 'true'
        ? snackBar(Colors.green, response)
        : snackBar(Colors.red, response);
    setState(() {
      isLoading = false;
      isEnabled = false;
    });
  }

  snackBar(color, response) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: color,
        content: Text(response),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:upload_file_api/upload_file.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo for upload image',
      debugShowCheckedModeBanner: false,
      home: UploadFile(),
    );
  }
}

class LoadingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.8),
        ),
        child: CupertinoActivityIndicator(),
      ),
    );
  }
}

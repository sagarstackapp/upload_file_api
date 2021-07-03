import 'dart:convert';

import 'package:http/http.dart' as http;

Future<String> uploadImage(
    String fileName, String filePath, int fileSize) async {
  String url = 'http://217.16.197.86:8091/api/Order/FilesUploadForDentist';
  var body = jsonEncode([
    {
      "OrderId": 103481,
      "FileName": fileName,
      "FileId": 0,
      "CreatedDate": DateTime.now().toIso8601String(),
      "FileSize": fileSize,
      "ContentType": "application/${fileName.split(".").last}",
      "File": filePath
    }
  ]);
  print('Body --> $body');
  try {
    final response = await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
      },
      body: body,
    );
    print('Url --> ${response.request.url}');
    print('Headers --> ${response.request.headers}');
    print('Status Code --> ${response.statusCode}');
    print('Body --> ${response.body}');
    return response.body;
  } catch (e) {
    print('Error --> $e');
    return e;
  }
}

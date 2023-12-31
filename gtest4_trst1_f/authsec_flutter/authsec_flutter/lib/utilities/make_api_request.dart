import 'dart:convert';
import 'dart:io';
import 'package:authsec_flutter/resources/api_constants.dart';
import 'package:http/http.dart' as http;

Future<Map<String, dynamic>> getData(
    {required String urlPath, String? authKey}) async {
  String backendServiceHost = "${ApiConstants.baseUrl}" + urlPath;
  var response;
  try {
    response = await http.get(
      Uri.parse(backendServiceHost),
      headers: <String, String>{
        'Content-Type': 'application/json',
        if (authKey != null) 'Authorization': authKey
      },
    );
  } on SocketException {
    return {'internetConnectionError': 'no internet connection'};
  }
  return jsonDecode(response.body);
}

Future<Map<String, dynamic>> sendData(
    {required String urlPath,
    required Map<String, dynamic> data,
    String? authKey}) async {
  String backendServiceHost = "${ApiConstants.baseUrl}" + urlPath;
  var response;
  try {
    response = await http.post(
      Uri.parse(backendServiceHost),
      headers: <String, String>{
        'Content-Type': 'application/json',
        if (authKey != null) 'Authorization': authKey
      },
      body: jsonEncode(data),
    );
  } on SocketException {
    return {'internetConnectionError': 'no internet connection'};
  }
  return jsonDecode(response.body);
}

Future<int> checkUrlValidity(String url) async {
  try {
    final response = await http.get(Uri.parse(url));

    return response.statusCode;
  } catch (e) {
    return 404;
  }
}

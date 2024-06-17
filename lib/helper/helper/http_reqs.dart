import 'dart:convert';
import 'dart:io';

// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:path/path.dart';

import 'app_url.dart';

class API {
  postRequest(
      {required String route, required Map<String, dynamic> data}) async {
    String url = "${AppUrl.baseUrl}$route";
    Map<String, String>? headers = await _header();
    var response = await http.post(
      Uri.parse(url),
      body: jsonEncode(data),
      headers: headers,
    );

    // print("Full token: ${headers['Authorization']!.substring(200, 300)}");
    return response;
  }
}

// 2beca7dc-9575-44f6-8042-17bed7a10e4f
// {
// "groupId": "5e45b883-3eb0-4d65-862d-1d00012363e4",
// "type": "ACCOUNT",
// "email": "kencliff@gmail.com",
// "mobile": "670260611"
// }
patchRequest(
    {required String route, required Map<String, dynamic> data}) async {
  final String url = "${AppUrl.baseUrl}$route";
  final Map<String, String>? headers = await _header();
  final response = await http.patch(
    Uri.parse(url),
    body: jsonEncode(data),
    headers: headers,
  );
  print('$url');

  return response;
}

Future<dynamic> getRequest({required String route}) async {
  String url = "${AppUrl.baseUrl}$route";
  try {
    Map<String, String> headers = await _header();
    final result = await http.get(Uri.parse(url), headers: headers);
    return result;
  } catch (error) {
    return " the error is $error";
  }
}

// Future<String> getToken() async {
//   final cognitoPlugin = Amplify.Auth.getPlugin(AmplifyAuthCognito.pluginKey);
//   final session = await cognitoPlugin.fetchAuthSession();
//   if (session.isSignedIn == true) {
//     return session.userPoolTokensResult.value.idToken.toJson();
//   } else {
//     return '';
//   }
// }

Future<Map<String, String>> _header() async {
  // final cognitoPlugin = Amplify.Auth.getPlugin(AmplifyAuthCognito.pluginKey);
  // final session = await cognitoPlugin.fetchAuthSession();
  // if (session.isSignedIn == true) {
  return {
    'Content-type': 'application/json',
    'Accept': 'application/json',
    // 'Authorization': "Bearer"
  };
  //   } else {
  //     return {
  //       'Content-type': 'application/json',
  //       'Accept': 'application/json',
  //     };
  //   }
}

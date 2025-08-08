import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class Api {
  Future<http.Response> get({required String url}) async {
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception(
          'there is a problem in etatus code${response.statusCode}');
    }
  }

  Future<dynamic> post(
      {required String url,
      @required dynamic body,
      @required String? token}) async {
    Map<String, String> headers = {};
    if (token != null) {
      headers.addAll({'Authorization': 'Bearer $token'});
    }
    http.Response response =
        await http.post(Uri.parse(url), body: body, headers: headers);
    if (response.statusCode == 201) {
      Map<String, dynamic> data = jsonDecode(response.body);
      return response.body;
    } else {
      throw Exception(
          'there is a problem in statun code ${response.statusCode} with body ${jsonDecode(response.body)}');
    }
  }

  Future<dynamic> put(
      {required String url,
      @required dynamic body,
      @required String? token}) async {
    Map<String, String> headers = {};
    if (token != null) {
      headers.addAll({'Authorization': 'Bearer $token'});
    }
    headers.addAll({'Content-Type': 'application/x-www-form-urlencoded'});

    http.Response response =
        await http.put(Uri.parse(url), body: body, headers: headers);
    print('url:$url,,,body:$body');
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      return response.body;
    } else {
      if (response.headers['content-type']?.contains('application/json') ==
          true) {
        final decoded = jsonDecode(response.body);
        print(
            'problem in status code ${response.statusCode} with body $decoded');
      } else {
        print(
            'problem in status code ${response.statusCode} with non-JSON body: ${response.body}');
      }
    }
  }
}

import 'dart:convert';

import 'package:flutter_application_1/model/productmodel.dart';
import 'package:http/http.dart' as http;


class Apiservice {
  Future<List<Productmodel>> fetchData() async {
    final response =
        await http.get(Uri.parse('https://fakestoreapi.com/products/'));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((json) => Productmodel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }
}
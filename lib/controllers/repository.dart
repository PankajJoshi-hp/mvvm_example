import 'dart:convert';

import 'package:marvel_api_flutter/apis/api_services.dart';
import 'package:marvel_api_flutter/models/superhero_model.dart';

class SuperHeroRepository {
  final ApiServices apiService = ApiServices();

  Future<List<SuperHero>> getSuperheros() async {
    final response = await apiService.fetchSuperheros();
    print('**************************************************');
    print('Response Status Code: ${response.statusCode}');
    print('Response Body: ${response.body}');

    if (response.statusCode == 200) {
      return List<SuperHero>.from(
          json.decode(response.body).map((x) => SuperHero.fromJson(x)));
    } else {
      throw Exception('Failed to load superheros');
    }
  }
}

import 'package:get/get.dart';
import 'package:marvel_api_flutter/controllers/repository.dart';
import 'package:marvel_api_flutter/models/superhero_model.dart';

class SuperheroViewModel extends GetxController {
  final SuperHeroRepository _repository = SuperHeroRepository();
  
  final RxList<SuperHero> _superheros = <SuperHero>[].obs;
  RxBool fetchingData = false.obs;

  List<SuperHero> get superheros => _superheros; 

  @override
  void onInit() {
    super.onInit();
    fetchSuperheros();  
  }

  Future<void> fetchSuperheros() async {
    fetchingData.value = true;

    try {
      final fetchedSuperheros = await _repository.getSuperheros();
      _superheros.assignAll(fetchedSuperheros);
    } catch (e) {
      print("Error fetching superheroes: $e");
    }

    fetchingData.value = false;
  }
}

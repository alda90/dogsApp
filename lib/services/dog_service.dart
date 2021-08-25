import 'package:dogs_app/services/dog_response.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class DogService extends ChangeNotifier {
  String _baseUrl = 'dog.ceo';
  Map<String, List<String>> dogsMap = {};
  List<String> dogs = [];
  String image = '';
  List<String> subbreeds = [];

  Future<Dog> getApiDogs() async {
    //String url = 'https://dog.ceo/api/breeds/list/all';

    final url = Uri.https(_baseUrl, 'api/breeds/list/all');

    var response = await http.get(url);

    //final searchResponse = searchResponseFromJson(response.body);
    final dogResponse = Dog.fromJson(response.body);

    return dogResponse;
  }

  Future<DogImage> getApiImageDogs(String breed) async {
    //String url = 'https://dog.ceo/api/breeds/list/all';

    final url = Uri.https(_baseUrl, 'api/breed/${breed}/images/random');

    var response = await http.get(url);

    //final searchResponse = searchResponseFromJson(response.body);
    final dogResponse = DogImage.fromJson(response.body);

    return dogResponse;
  }

  Future<DogSubBreeds> getApiSubBreed(String breed) async {
    //String url = 'https://dog.ceo/api/breeds/list/all';

    final url = Uri.https(_baseUrl, 'api/breed/${breed}/list');

    var response = await http.get(url);

    //final searchResponse = searchResponseFromJson(response.body);
    final dogResponse = DogSubBreeds.fromJson(response.body);

    return dogResponse;
  }

  getDogs() async {
    final dogService = await getApiDogs();
    this.dogsMap = dogService.message;

    notifyListeners();
  }

  getDogImage(String breed) async {
    final dog = await getApiImageDogs(breed);
    this.image = dog.message;

    notifyListeners();
  }

  getSubBreeds(String breed) async {
    final subs = await getApiSubBreed(breed);
    this.subbreeds = subs.message;
    print(this.subbreeds);

    notifyListeners();
  }
}

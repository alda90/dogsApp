import 'dart:convert';

class Dog {
  Dog({
    required this.message,
    required this.status,
  });

  Map<String, List<String>> message;
  String status;

  factory Dog.fromJson(String str) => Dog.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Dog.fromMap(Map<String, dynamic> json) => Dog(
        message: Map.from(json["message"]).map((k, v) =>
            MapEntry<String, List<String>>(
                k, List<String>.from(v.map((x) => x)))),
        status: json["status"],
      );

  Map<String, dynamic> toMap() => {
        "message": Map.from(message).map((k, v) =>
            MapEntry<String, dynamic>(k, List<dynamic>.from(v.map((x) => x)))),
        "status": status,
      };
}

class DogImage {
  DogImage({
    required this.message,
    required this.status,
  });

  String message;
  String status;

  factory DogImage.fromJson(String str) => DogImage.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DogImage.fromMap(Map<String, dynamic> json) => DogImage(
        message: json["message"],
        status: json["status"],
      );

  Map<String, dynamic> toMap() => {
        "message": message,
        "status": status,
      };
}

class DogSubBreeds {
  DogSubBreeds({
    required this.message,
    required this.status,
  });

  List<String> message;
  String status;

  factory DogSubBreeds.fromJson(String str) =>
      DogSubBreeds.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DogSubBreeds.fromMap(Map<String, dynamic> json) => DogSubBreeds(
        message: List<String>.from(json["message"].map((x) => x)),
        status: json["status"],
      );

  Map<String, dynamic> toMap() => {
        "message": List<dynamic>.from(message.map((x) => x)),
        "status": status,
      };
}

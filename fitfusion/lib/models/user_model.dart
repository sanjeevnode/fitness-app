// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class User {
  final String id;
  final String name;
  final String email;
  final int age;
  final int height;
  final double weight;
  final String gender;
  final String bmi;
  final String bmiRange;
  final Map<String, dynamic> workouts;
  User({
    required this.id,
    required this.name,
    required this.email,
    required this.age,
    required this.height,
    required this.weight,
    required this.gender,
    required this.bmi,
    required this.bmiRange,
    required this.workouts,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'email': email,
      'age': age,
      'height': height,
      'weight': weight,
      'gender': gender,
      'bmi': bmi,
      'bmiRange': bmiRange,
      'workouts': workouts,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['_id'] ?? '',
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      age: map['age'] ?? 0,
      height: map['height'] ?? 0,
      weight: map['weight'] ?? 0.0,
      gender: map['gender'] ?? '',
      bmi: map['bmi'] ?? '',
      bmiRange: map['bmiRange'] ?? '',
      workouts: map['workouts'] ?? {},
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);
}

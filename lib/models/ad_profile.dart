import 'dart:convert';

import 'package:equatable/equatable.dart';

class UserProfile extends Equatable {
  final int? id;
  final String? userId;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? phoneNumber;
  final String? homeStreet;
  final String? homeCity;
  final String? homeProvince;
  final String? photoProfile;
  final int? role;
  final String? privilege;

  const UserProfile({
    this.firstName,
    this.lastName,
    this.email,
    this.phoneNumber,
    this.homeStreet,
    this.homeCity,
    this.homeProvince,
    this.photoProfile,
    this.role,
    this.privilege,
    this.id,
    this.userId,
  });

  UserProfile copyWith({
    int? id,
    String? userId,
    String? firstName,
    String? lastName,
    String? phoneNumber,
    String? homeStreet,
    String? email,
    String? homeCity,
    String? homeProvince,
    String? photoProfile,
    int? role,
    String? privilege,
  }) {
    return UserProfile(
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        email: email ?? this.email,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        homeStreet: homeStreet ?? this.homeStreet,
        homeCity: homeCity ?? this.homeCity,
        homeProvince: homeProvince ?? this.homeProvince,
        photoProfile: photoProfile ?? this.photoProfile,
        role: role ?? this.role,
        privilege: privilege ?? this.privilege,
        id: id ?? this.id,
        userId: userId ?? this.userId);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'user_id': userId,
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      'phone_number': phoneNumber,
      'home_street': homeStreet,
      'home_city': homeCity,
      'home_province': homeProvince,
      'photo_profile': photoProfile,
      'role_id': role,
      'privilege_id': privilege
    };
  }

  factory UserProfile.fromMap(Map<String, dynamic> map) {
    return UserProfile(
        firstName: map['first_name'],
        lastName: map['last_name'],
        email: map['email'],
        phoneNumber: map['phone_number'],
        homeStreet: map['home_street'],
        homeCity: map['home_city'],
        homeProvince: map['home_province'],
        photoProfile: map['photo_profile'],
        role: map['role_id'],
        privilege: map['privilege_id'],
        id: map['id'],
        userId: map['user_id']);
  }

  factory UserProfile.fromJson(String source) =>
      UserProfile.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  List<Object?> get props => [
        id,
        userId,
        firstName,
        lastName,
        email,
        phoneNumber,
        homeStreet,
        homeCity,
        homeProvince,
        photoProfile,
        role,
        privilege
      ];
}

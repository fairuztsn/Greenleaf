import 'package:equatable/equatable.dart';

class AppFeatures extends Equatable {
  final String? featureName;
  final String? groupFeature;
  final String? iconLink;
  final String? mobilePath;
  final int? role;

  const AppFeatures(
      {this.featureName,
      this.groupFeature,
      this.iconLink,
      this.mobilePath,
      this.role});

  factory AppFeatures.fromMap(Map<String, dynamic> map) {
    return AppFeatures(
        featureName: map['name'],
        groupFeature: map['group_feature'],
        iconLink: map['icon_feature'],
        mobilePath: map['mobile_path'],
        role: map['role_id']);
  }

  @override
  List<Object?> get props =>
      [featureName, groupFeature, iconLink, mobilePath, role];
}

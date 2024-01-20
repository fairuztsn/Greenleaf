import 'package:freezed_annotation/freezed_annotation.dart';

part 'data_barang_rongsok_entity.freezed.dart';
part 'data_barang_rongsok_entity.g.dart';

@freezed

///
class DataBarangRongsokEntity with _$DataBarangRongsokEntity {
  ///
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory DataBarangRongsokEntity({
    required String id,
    required String namaBarang,
    required String unit,
    required int pricePerUnit,
  }) = _DataBarangRongsokEntity;

  ///
  factory DataBarangRongsokEntity.fromJson(Map<String, dynamic> json) =>
      _$DataBarangRongsokEntityFromJson(json);
}

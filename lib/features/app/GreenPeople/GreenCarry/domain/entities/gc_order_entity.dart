import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:greenleaf/features/app/GreenPeople/GreenCarry/domain/entities/data_barang_rongsok_entity.dart';

part 'gc_order_entity.freezed.dart';
part 'gc_order_entity.g.dart';

@freezed

///
class GCOrderEntity with _$GCOrderEntity {
  ///
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory GCOrderEntity({
    required String id,
    required DataBarangRongsokEntity barangRongsok,
    required int berat,
    String? fotoBarang,
  }) = _GCOrderEntity;

  ///
  factory GCOrderEntity.fromJson(Map<String, dynamic> json) =>
      _$GCOrderEntityFromJson(json);
}

import 'package:equatable/equatable.dart';
import 'package:greenleaf/models/app_gc_data_barang_rongsok.dart';

class GreenCarryOrder extends Equatable {
  final String? orderId;
  final GreenCarryKetentuanBarangRongsok? barangRongsok;
  final int? berat;
  final String? fotoBarang;

  const GreenCarryOrder(
      {this.orderId, this.barangRongsok, this.berat, this.fotoBarang});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': orderId,
      'barang_rongsok_id': barangRongsok!.id,
      'berat': berat,
      'foto_barang': fotoBarang
    };
  }

  factory GreenCarryOrder.fromMap(Map<String, dynamic> map) {
    return GreenCarryOrder(
        orderId: map['id'],
        barangRongsok: map['barang_rongsok_id'],
        berat: map['berat'],
        fotoBarang: map['foto_barang']);
  }

  @override
  List<Object?> get props => [orderId, barangRongsok, berat, fotoBarang];
}

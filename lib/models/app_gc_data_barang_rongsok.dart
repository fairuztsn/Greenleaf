import 'package:equatable/equatable.dart';

class GreenCarryKetentuanBarangRongsok extends Equatable {
  final String? id;
  final String? namaBarang;
  final String? unit;
  final int? pricePerUnit;

  const GreenCarryKetentuanBarangRongsok(
      {this.id, this.namaBarang, this.unit, this.pricePerUnit});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'nama_barang': namaBarang,
      'price_per_unit': pricePerUnit,
      'unit': unit
    };
  }

  factory GreenCarryKetentuanBarangRongsok.fromMap(Map<String, dynamic> map) {
    return GreenCarryKetentuanBarangRongsok(
        id: map['id'],
        namaBarang: map['nama_barang'],
        pricePerUnit: map['price_per_unit'],
        unit: map['unit']);
  }
  @override
  List<Object?> get props => [id, namaBarang, unit, pricePerUnit];
}

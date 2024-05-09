// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Kuliner {
  final String nama;
  final String tempat;
  final String jenis;
  final int harga;
  final String gambar;
  Kuliner({
    required this.nama,
    required this.tempat,
    required this.jenis,
    required this.harga,
    required this.gambar,
  });

  Kuliner copyWith({
    String? nama,
    String? tempat,
    String? jenis,
    int? harga,
    String? gambar,
  }) {
    return Kuliner(
      nama: nama ?? this.nama,
      tempat: tempat ?? this.tempat,
      jenis: jenis ?? this.jenis,
      harga: harga ?? this.harga,
      gambar: gambar ?? this.gambar,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'nama': nama,
      'tempat': tempat,
      'jenis': jenis,
      'harga': harga,
      'gambar': gambar,
    };
  }

  factory Kuliner.fromMap(Map<String, dynamic> map) {
    return Kuliner(
      nama: map['nama'] as String,
      tempat: map['tempat'] as String,
      jenis: map['jenis'] as String,
      harga: map['harga'] as int,
      gambar: map['gambar'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Kuliner.fromJson(String source) =>
      Kuliner.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Kuliner(nama: $nama, tempat: $tempat, jenis: $jenis, harga: $harga, gambar: $gambar)';
  }

  @override
  bool operator ==(covariant Kuliner other) {
    if (identical(this, other)) return true;

    return other.nama == nama &&
        other.tempat == tempat &&
        other.jenis == jenis &&
        other.harga == harga &&
        other.gambar == gambar;
  }

  @override
  int get hashCode {
    return nama.hashCode ^
        tempat.hashCode ^
        jenis.hashCode ^
        harga.hashCode ^
        gambar.hashCode;
  }
}

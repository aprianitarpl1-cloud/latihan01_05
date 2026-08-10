import "package:flutter/material.dart";

class Barang {
  String nama;
  double harga;
  int stok;

  Barang(this.nama, this.harga, this.stok);

  double nilaiStok() {
    return harga * stok;
  }

  bool bisaDijual(int diminta) {
    return diminta <= stok;
  }

  void tampilkanInfo() {
    print("===================================");
    print("KARTU BARANG");
    print("Nama : $nama");
    print("Harga : Rp${harga.toStringAsFixed(0)}");
    print("Stok : $stok");
    print("Nilai Stok : Rp${nilaiStok().toStringAsFixed(0)}");
    print("===================================");
  }
}

void main() {
  Barang barang1 = Barang("Buku Tulis", 3000, 20);
  Barang barang2 = Barang("Pulpen", 2500, 15);
  Barang barang3 = Barang("Roti", 5000, 10);

  barang1.tampilkanInfo();
  barang2.tampilkanInfo();
  barang3.tampilkanInfo();

  print("Buku Tulis diminta 5 : ${barang1.bisaDijual(5) ? "Bisa dijual" : "Tidak bisa dijual"}");
  print("Pulpen diminta 10 : ${barang2.bisaDijual(10) ? "Bisa dijual" : "Tidak bisa dijual"}");
}
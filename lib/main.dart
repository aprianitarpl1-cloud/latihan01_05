import "package:flutter/material.dart";

class Barang {
  String nama;
  double harga;
  int stok;

  Barang(this.nama, this.harga, this.stok);

  void tampilkanInfo() {
    print("===================================");
    print("KARTU BARANG");
    print("Nama : $nama");
    print("Harga : Rp${harga.toStringAsFixed(0)}");
    print("Stok : $stok");
    print("===================================");
  }
}

void main() {
  Barang barang1 = Barang("Buku Tulis", 3000, 20);
  Barang barang2 = Barang("Pulpen", 2500, 15);
  Barang barang3 = Barang("Roti", 5000, 10);

  List<Barang> daftarBarang = [barang1, barang2, barang3];

  for (Barang barang in daftarBarang) {
    barang.tampilkanInfo();
  }

  /*
  Perbandingan dengan Sprint 3:
  Pada Sprint 3, data nama dan harga barang disimpan secara terpisah
  menggunakan dua List, yaitu List<String> namaBarang dan List harga.
  Pada sprint sekarang, data nama, harga, dan stok digabung menjadi
  satu objek Barang. Kemudian beberapa objek Barang disimpan dalam
  satu List<Barang>, sehingga data menjadi lebih terorganisir,
  saling berhubungan, dan lebih mudah untuk digunakan.
  */
}
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
  Pada Sprint 3, data nama dan harga barang diletakkan
  pada dua List yang berbeda, yaitu List<String> namaBarang
  dan List harga. Pada program sekarang, nama, harga, dan stok
  dijadikan satu dalam objek Barang dan kemudian disimpan
  ke dalam List<Barang>. Dengan cara ini, data barang menjadi
  lebih teratur, tetap saling berhubungan, dan lebih mudah
  dikelola jika jumlah barang semakin banyak.
  */
}
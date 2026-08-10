import "package:flutter/material.dart";

class Barang{
  String nama;
  double harga;
  int stok;

  Barang(this.nama, this.harga, this.stok);

  void tampilkanInfo(){
    print("===================================");
    print("KARTU BARANG ");
    print("Nama : $nama");
    print("Harga : Rp${harga.toStringAsFixed(0)}");
    print("Stok : $stok");
    print("===================================");
  }
}
void main(){
  Barang barang1 = Barang("Buku Tulis", 3000, 20);
  Barang barang2 = Barang("Pulpen", 2500, 15);
  Barang barang3 = Barang("Roti", 5000, 10);

  barang1.tampilkanInfo();
  barang2.tampilkanInfo();
  barang3.tampilkanInfo();
}

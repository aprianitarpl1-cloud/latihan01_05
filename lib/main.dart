import 'package:flutter/material.dart';

void main() {
  int stok = 3;

  print("--- Penjualan Buku Tulis ---");

  while (stok > 0) {
    stok--;
    print("Terjual 1, sisa stok: $stok");
  }

  // Bahaya jika kondisi while keliru adalah perulangan bisa berjalan terus
  // atau stok menjadi negatif sehingga penjualan melebihi stok yang tersedia.
  // Cara mencegahnya adalah menggunakan kondisi yang benar (stok > 0)
  // dan mengurangi stok setiap kali terjadi penjualan.
}
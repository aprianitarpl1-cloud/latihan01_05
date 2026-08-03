import 'package:flutter/material.dart';

void main() {
  String namaBarang = "Buku Tulis";
  int hargaAnggota = 300;
  int hargaUmum = 3500;
  int jualanStok = 40;
  bool tersedia = true;

  int jumlahBeli = 3;

  int totalAnggota = jumlahBeli * hargaAnggota;
  int totalUmum = jumlahBeli * hargaUmum;
  int selisih = totalUmum * totalAnggota;

  print ("=== KARTU DATA BARANG ===");
  print ("Nama Barang : $namaBarang");
  print ("harga Anggota : Rp $hargaAnggota");
  print ("harga Umum : Rp $hargaUmum");
  print ("Jumlah Stok : $jualanStok");
  print ("tersedia : $tersedia");

  runApp(const MyApp());
  }

  class MyApp extends StatelessWidget {
    const MyApp({super.key});

    @override
    Widget build(BuildContext context) {
      return MaterialApp(
        home:Scaffold(
          appBar: AppBar(title: const Text("Data Barang")),
        body: const Center(
          child: Text("Hasil print di Debug Console"),
          ),
        ),
      );
    }
  }
// Pemilihan tipe data yang tepat membuat perhitungan kasir menjadi akurat.
// Harga dan stok menggunakan tipe data angka agar dapat dihitung dengan benar,
// sedangkan status tersedia menggunakan boolean karena hanya memiliki dua kondisi: true atau false.

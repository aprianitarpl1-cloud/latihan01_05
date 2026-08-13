import "package:flutter/material.dart";

class Barang {
  String nama;
  double harga;

  int _stok;

  Barang(this.nama, this.harga, this._stok);

  int get stok {
    return _stok;
  }

  bool bisaDijual(int diminta) {
    return diminta <= _stok;
  }

  double nilaiStok() {
    return harga * stok;
  }

  bool jual(int n) {
    if (n <= _stok) {
      _stok -= n;
      return true;
    } else {
      return false;
    }
  }

  void tampilkan() {
    print("========================");
    print("KARTU BARANG");
    print("Nama  : $nama");
    print("Harga : Rp${harga.toStringAsFixed(0)}");
    print("Stok  : $stok");
    print("Nilai Stok : Rp${nilaiStok().toStringAsFixed(0)}");
    print("========================");
  }
}

class BarangPromo extends Barang {
  double persenDiskon;

  BarangPromo(
    String nama,
    double harga,
    int stok,
    this.persenDiskon,
  ) : super(nama, harga, stok);

  double hargaPromo() {
    return harga - (harga * persenDiskon / 100);
  }

  @override
  void tampilkan() {
    print("========================");
    print("KARTU BARANG PROMO");
    print("Label : PROMO");
    print("Nama  : $nama");
    print("Harga Coret : Rp${harga.toStringAsFixed(0)}");
    print("Stok  : $stok");
    print("Diskon : $persenDiskon%");
    print("Harga Promo : Rp${hargaPromo().toStringAsFixed(0)}");
    print("Nilai Stok : Rp${nilaiStok().toStringAsFixed(0)}");
    print("========================");
  }
}

class BarangGrosir extends Barang {
  int minimalBeli;
  double diskonGrosir;

  BarangGrosir(
    String nama,
    double harga,
    int stok,
    this.minimalBeli,
    this.diskonGrosir,
  ) : super(nama, harga, stok);

  double hargaGrosir(int jumlah) {
    if (jumlah >= minimalBeli) {
      return harga - (harga * diskonGrosir / 100);
    } else {
      return harga;
    }
  }

  @override
  void tampilkan() {
    print("========================");
    print("KARTU BARANG GROSIR");
    print("Nama : $nama");
    print("Harga : Rp${harga.toStringAsFixed(0)}");
    print("Stok : $stok");
    print("Minimal Beli : $minimalBeli");
    print("Diskon Grosir : $diskonGrosir%");
    print("========================");
  }
}

class Pembeli {
  String nama;
  bool statusAnggota;

  Pembeli(this.nama, this.statusAnggota);

  void tampilkan() {
    print("Nama Pembeli : $nama");
    print("Status Anggota : ${statusAnggota ? "Anggota" : "Umum"}");
  }
}

// FUNGSI PROSES BELI
void prosesBeli(String inputJumlah) {
  try {
    int jumlah = int.parse(inputJumlah);

    print("Jumlah pembelian: $jumlah");
    print("Penjualan berhasil diproses.");
  } catch (e) {
    print("Input tidak valid. Silahkan masukkan jumlah berupa angka.");
  } finally {
    print("Transaksi dicatat di log.");
  }
}

void main() {
  Barang barang1 = Barang("Buku Tulis", 3000, 20);

  print("=== STOK AWAL ===");
  barang1.tampilkan();

  print("\n=== PENJUALAN 5 BUKU ===");

  if (barang1.jual(5)) {
    print("Penjualan berhasil");
  } else {
    print("Penjualan gagal, stok tidak mencukupi");
  }

  print("Stok sekarang: ${barang1.stok}");

  print("\n=== PENJUALAN 20 BUKU ===");

  if (barang1.jual(20)) {
    print("Penjualan Berhasil.");
  } else {
    print("Penjualan gagal, stok tidak mencukupi");
  }

  print("Stok sekarang: ${barang1.stok}");

  print("\n=== BARANG PROMO ===");

  BarangPromo barangPromo =
      BarangPromo("Buku Gambar", 10000, 10, 20);

  barangPromo.tampilkan();

  print("\n=== PROSES BELI ===");

  prosesBeli("5");
  prosesBeli("dua");
}
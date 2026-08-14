import "package:flutter/material.dart";

class Barang {
  String nama;
  double harga;
  int _stok;

  Barang(this.nama, this.harga, this._stok);

  int get stok => _stok;

  bool bisaDijual(int jumlah) {
    return jumlah > 0 && jumlah <= _stok;
  }

  double nilaiStok() {
    return harga * _stok;
  }

  bool jual(int jumlah) {
    if (bisaDijual(jumlah)) {
      _stok -= jumlah;
      return true;
    }
    return false;
  }

  void tampilkan() {
    print("========================");
    print("KARTU BARANG");
    print("Nama       : $nama");
    print("Harga      : Rp${harga.toStringAsFixed(0)}");
    print("Stok       : $_stok");
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
    print("Label       : PROMO");
    print("Nama        : $nama");
    print("Harga       : Rp${harga.toStringAsFixed(0)}");
    print("Stok        : $stok");
    print("Diskon      : $persenDiskon%");
    print("Harga Promo : Rp${hargaPromo().toStringAsFixed(0)}");
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
    }
    return harga;
  }

  @override
  void tampilkan() {
    print("========================");
    print("KARTU BARANG GROSIR");
    print("Nama          : $nama");
    print("Harga         : Rp${harga.toStringAsFixed(0)}");
    print("Stok          : $stok");
    print("Minimal Beli  : $minimalBeli");
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
    print(
      "Status       : ${statusAnggota ? "Anggota" : "Umum"}",
    );
  }
}

Future<void> muatLaporan() async {
  print("Menyiapkan laporan...");

  await Future.delayed(
    Duration(seconds: 1),
  );

  print("Laporan siap!");
}

void prosesTransaksi(
  String inputJumlah,
  Barang barang,
  Pembeli pembeli,
) {
  try {
    int jumlah = int.parse(inputJumlah);

    if (jumlah <= 0) {
      print("Jumlah pembelian harus lebih dari 0.");
      return;
    }

    if (jumlah > barang.stok) {
      print("Transaksi gagal.");
      print("Stok tidak mencukupi.");
      print("Stok tersedia: ${barang.stok}");
      return;
    }

    // Menentukan harga satuan
    double hargaSatuan = barang.harga;

    if (barang is BarangPromo) {
      hargaSatuan = barang.hargaPromo();
    }

    // Menghitung total
    double total = hargaSatuan * jumlah;

    // Menentukan diskon berdasarkan total belanja
    double persenPotongan = 0;

    if (total > 200000) {
      persenPotongan = 10;
    } else if (total > 100000) {
      persenPotongan = 5;
    }

    double potongan =
        total * persenPotongan / 100;

    double totalBayar =
        total - potongan;

    // Mengurangi stok
    if (barang.jual(jumlah)) {
      print("\n=== TRANSAKSI BERHASIL ===");

      pembeli.tampilkan();

      print("Barang       : ${barang.nama}");
      print("Jumlah       : $jumlah");
      print(
        "Harga Satuan : Rp${hargaSatuan.toStringAsFixed(0)}",
      );
      print(
        "Total        : Rp${total.toStringAsFixed(0)}",
      );
      print(
        "Diskon       : ${persenPotongan.toStringAsFixed(0)}%",
      );
      print(
        "Potongan     : Rp${potongan.toStringAsFixed(0)}",
      );
      print(
        "Total Bayar  : Rp${totalBayar.toStringAsFixed(0)}",
      );
      print("Sisa Stok    : ${barang.stok}");
      print("========================");
    }
  } catch (e) {
    print('Input "$inputJumlah" bukan angka.');
    print("Silakan masukkan jumlah dalam angka.");
  } finally {
    print("Transaksi dicatat di log.");
  }
}

Future<void> main() async {
  // Laporan dijalankan terlebih dahulu
  await muatLaporan();

  print("\n================================");
  print("       KASIR BRANTAS MART");
  print("================================");

  // Data barang
  Barang barang1 =
      Barang("Buku Tulis", 3000, 20);

  BarangPromo barang2 =
      BarangPromo(
        "Buku Gambar",
        10000,
        10,
        20,
      );

  BarangGrosir barang3 =
      BarangGrosir(
        "Pulpen",
        5000,
        50,
        10,
        10,
      );

  // Tampilkan semua barang
  print("\n=== DATA BARANG ===");

  barang1.tampilkan();
  barang2.tampilkan();
  barang3.tampilkan();

  // Data pembeli
  print("\n=== DATA PEMBELI ===");

  Pembeli pembeli =
      Pembeli("Aprianita", true);

  pembeli.tampilkan();

  // Proses satu transaksi
  print("\n=== PROSES TRANSAKSI ===");

  prosesTransaksi(
    "5",
    barang2,
    pembeli,
  );

  // Tampilkan stok setelah transaksi
  print("\n=== STOK SETELAH TRANSAKSI ===");

  barang2.tampilkan();

  print("\n=== PROGRAM SELESAI ===");
}
import 'package:bilqis_getx/app/modules/pemesanan_makanan/controllers/pemesanan_makanan_controller.dart';
import 'package:bilqis_getx/app/modules/pemesanan_makanan/views/pemesanan_makanan_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PemesananOutputView extends StatelessWidget {
  const PemesananOutputView({super.key});

  @override
  Widget build(BuildContext context) {
    final PemesananMakananController pemesanan =
        Get.find<PemesananMakananController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Pemesanan'),
        centerTitle: true,
        backgroundColor: Colors.lightGreenAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Obx(
          () => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Nama Pemesan: ${pemesanan.nameController.text}"),
              const SizedBox(height: 10),
              Text("Tanggal Pesan: ${pemesanan.formattedDate}"),
              const SizedBox(height: 10),
              Text("Menu: ${pemesanan.selectedMenu.value}"),
              const SizedBox(height: 10),
              Text("Jumlah: ${pemesanan.quantity.value}"),
              const SizedBox(height: 10),
              Text("Total Harga: Rp ${pemesanan.totalHarga.value}"),
              const SizedBox(height: 10),
              Text("Diskon: Rp ${pemesanan.diskon.value}"),
              const SizedBox(height: 10),
              Text(
                "Harga Akhir: Rp ${pemesanan.hargaAkhir.value}",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.green,
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  pemesanan.clearForm();
                  Get.off(() => const PemesananView());
                },
                child: const Text("Kembali"),
              )
            ],
          ),
        ),
      ),
    );
  }
}

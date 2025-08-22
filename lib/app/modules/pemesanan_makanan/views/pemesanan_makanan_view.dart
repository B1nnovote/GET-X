import 'package:bilqis_getx/app/modules/pemesanan_makanan/controllers/pemesanan_makanan_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'pemesanan_output_view.dart';

class PemesananView extends StatelessWidget {
  const PemesananView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PemesananMakananController());

    return Scaffold(
      appBar: AppBar(
        title: const Text("Pemesanan Makanan"),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Input Nama
              TextField(
                controller: controller.nameController,
                decoration: const InputDecoration(
                  labelText: "Nama Pemesan",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),

              // Tanggal Pesan
              Obx(() => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Tanggal Pesan: ${controller.formattedDate}",
                        style: const TextStyle(fontSize: 16),
                      ),
                      ElevatedButton(
                        onPressed: () => controller.pickDate(),
                        child: const Text("Pilih Tanggal"),
                      ),
                    ],
                  )),
              const SizedBox(height: 16),

              // Dropdown Pilih Menu
              Obx(() => DropdownButtonFormField<String>(
                    value: controller.selectedMenu.value.isEmpty
                        ? null
                        : controller.selectedMenu.value,
                    items: controller.menu.keys
                        .map((e) => DropdownMenuItem(
                              value: e,
                              child: Text("$e - Rp ${controller.menu[e]}"),
                            ))
                        .toList(),
                    onChanged: (val) {
                      controller.selectedMenu.value = val ?? '';
                      controller.hitungTotal();
                    },
                    decoration: const InputDecoration(
                      labelText: "Pilih Makanan",
                      border: OutlineInputBorder(),
                    ),
                  )),
              const SizedBox(height: 16),

              // Input Jumlah
              Obx(() => Row(
                    children: [
                      const Text("Jumlah: "),
                      IconButton(
                        icon: const Icon(Icons.remove),
                        onPressed: () {
                          if (controller.quantity.value > 1) {
                            controller.quantity.value--;
                            controller.hitungTotal();
                          }
                        },
                      ),
                      Text("${controller.quantity.value}",
                          style: const TextStyle(fontSize: 18)),
                      IconButton(
                        icon: const Icon(Icons.add),
                        onPressed: () {
                          controller.quantity.value++;
                          controller.hitungTotal();
                        },
                      ),
                    ],
                  )),
              const SizedBox(height: 20),

              // Hasil Perhitungan
              Obx(() => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Total Harga: Rp ${controller.totalHarga.value}"),
                      Text("Diskon: Rp ${controller.diskon.value}"),
                      Text(
                        "Harga Akhir: Rp ${controller.hargaAkhir.value}",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ],
                  )),
              const SizedBox(height: 30),

              // Tombol Submit & Reset
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.lightBlueAccent),
                    onPressed: () {
                      if (controller.nameController.text.isEmpty ||
                          controller.selectedMenu.value.isEmpty) {
                        Get.snackbar(
                          "Error",
                          "Nama dan menu harus diisi!",
                          backgroundColor: Colors.redAccent,
                          colorText: Colors.white,
                        );
                      } else {
                        controller.hitungTotal();
                        Get.to(() => const PemesananOutputView());
                      }
                    },
                    child: const Text("Pesan Sekarang"),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.redAccent),
                    onPressed: () => controller.clearForm(),
                    child: const Text("Reset"),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

















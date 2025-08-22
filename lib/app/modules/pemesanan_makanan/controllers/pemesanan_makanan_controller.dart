import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class PemesananMakananController extends GetxController {
  final nameController = TextEditingController();

  // tanggal pesan
  final selectedDate = DateTime.now().obs;
  String get formattedDate =>
      DateFormat('dd/MM/yyyy').format(selectedDate.value);

  // daftar menu
  final Map<String, int> menu = {
    'Indomie': 10000,
    'Air Mineral': 5000,
    'Bakso': 20000,
    'Jus Alpukat': 15000,
    'Nasi Padang': 20000,
  };

  final selectedMenu = ''.obs;
  final quantity = 1.obs;

  final totalHarga = 0.0.obs;
  final diskon = 0.0.obs;
  final hargaAkhir = 0.0.obs;

  Future<void> pickDate() async {
    final DateTime? picked = await showDatePicker(
      context: Get.context!,
      initialDate: selectedDate.value,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate.value) {
      selectedDate.value = picked;
    }
  }

  void hitungTotal() {
    if (selectedMenu.value.isEmpty) {
      totalHarga.value = 0;
      diskon.value = 0;
      hargaAkhir.value = 0;
      return;
    }

    final hargaSatuan = menu[selectedMenu.value] ?? 0;
    totalHarga.value = hargaSatuan * quantity.value.toDouble();

    // aturan diskon
    if (totalHarga.value > 250000) {
      diskon.value = 0.10 * totalHarga.value;
    } else if (totalHarga.value > 150000) {
      diskon.value = 0.05 * totalHarga.value;
    } else {
      diskon.value = 0;
    }

    hargaAkhir.value = totalHarga.value - diskon.value;
  }

  void clearForm() {
    nameController.clear();
    selectedMenu.value = '';
    quantity.value = 1;
    totalHarga.value = 0;
    diskon.value = 0;
    hargaAkhir.value = 0;
    selectedDate.value = DateTime.now();
  }

  @override
  void onClose() {
    nameController.dispose();
    super.onClose();
  }
}

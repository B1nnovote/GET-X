import 'package:bilqis_getx/app/modules/formulir/controllers/formulir_controller.dart';
import 'package:bilqis_getx/app/modules/formulir/views/formulir_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FormulirOutputView extends StatelessWidget {
  const FormulirOutputView({super.key});

  @override
  Widget build(BuildContext context) {
    final FormulirController formulir = Get.find<FormulirController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Formulir Output'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Obx(
          () => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Nama: ${formulir.nameController.text}"),
              SizedBox(height: 10),
              Text("Kursus: ${formulir.selectedCourses.value}"),
              SizedBox(height: 10),
              Text("Gender: ${formulir.gender.value}"),
              SizedBox(height: 10),
              Text("Tanggal Kursus: ${formulir.formattedDate}"),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  formulir.clearForm();
                  Get.off(() => FormulirView());
                },
                child: Text("Kembali"),
              )
            ],
          ),
        ),
      ),
    );
  }
}

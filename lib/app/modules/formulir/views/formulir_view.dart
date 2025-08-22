import 'package:bilqis_getx/app/modules/formulir/views/formulir_output_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/formulir_controller.dart';

class FormulirView extends GetView<FormulirController> {
  const FormulirView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FormulirView'),
        centerTitle: true,
      ),
      body: Container(
        margin: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: controller.nameController,
              decoration: const InputDecoration(
                labelText: 'Nama',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            DropdownButtonFormField(
              decoration: const InputDecoration(
                labelText: 'Pilih Kursus',
                border: OutlineInputBorder(),
              ),
              items: controller.courses.map((course) {
                return DropdownMenuItem(
                  value: course,
                  child: Text(course),
                );
              }).toList(),
              onChanged: (value) {
                controller.selectedCourses.value = value!;
              },
            ),
            const SizedBox(height: 20),
            Obx(
              () => Column(
                children: [
                  RadioListTile(
                    title: const Text('Laki-laki'),
                    value: 'Laki-laki',
                    groupValue: controller.gender.value,
                    onChanged: (value) {
                      controller.gender.value = value!;
                    },
                  ),
                  RadioListTile(
                    title: const Text('Perempuan'),
                    value: 'Perempuan',
                    groupValue: controller.gender.value,
                    onChanged: (value) {
                      controller.gender.value = value!;
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Obx(
              () => TextField(
                readOnly: true,
                decoration: const InputDecoration(
                  labelText: 'Tanggal Kursus',
                  border: OutlineInputBorder(),
                ),
                controller: TextEditingController(
                  text: controller.formattedDate,
                ),
                onTap: () => controller.pickDate(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Get.to(FormulirOutputView()),
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}

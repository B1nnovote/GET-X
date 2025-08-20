import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/counter_controller.dart';

class CounterView extends GetView<CounterController> {
  CounterView({super.key});

  // controller
  final CounterController c = Get.put(CounterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CounterView'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Teks berubah sesuai fontSize
            Obx(() => Text(
                  "Hello World",
                  style: TextStyle(fontSize: c.fontSize.value),
                )),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: c.decrease, // pake decrease()
                  child: const Text('Kurang'),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: c.increase, // pake increase()
                  child: const Text('Tambah'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Obx(() => Text("Ukuran: ${c.fontSize.value.toInt()}")),
          ],
        ),
      ),
    );
  }
}

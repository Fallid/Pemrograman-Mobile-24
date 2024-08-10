import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Speech to Text Example"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Obx(() => Text(
              controller.text.value, // Menampilkan teks yang dihasilkan dari pengenalan suara
              style: TextStyle(fontSize: 24),
            )),
            SizedBox(height: 20),
            Obx(() => controller.isListening.value
                ? ElevatedButton(
                    onPressed: controller.stopListening,
                    child: Text("Stop Listening"),
                  )
                : ElevatedButton(
                    onPressed: controller.startListening,
                    child: Text("Start Listening"),
                  )),
          ],
        ),
      ),
    );
  }
}

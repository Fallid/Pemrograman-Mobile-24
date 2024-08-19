import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../home/views/home_view.dart';
import '../bindings/connection_binding.dart';
import '../controllers/connection_controller.dart';
import 'no_connection_view.dart';

class InitConnection extends GetView<ConnectionController> {
  const InitConnection({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Network',
      initialBinding: ConnectionBinding(),
      home: Obx(() {
        // Gunakan Obx untuk mendengarkan perubahan status koneksi
        return controller.isConnected.value ? HomeView() : NoConnectionView();
      }),
    );
  }
}
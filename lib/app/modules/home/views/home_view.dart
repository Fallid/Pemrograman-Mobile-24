import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:modul_6_asynchronous_handling/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              'HomeView is working',
              style: TextStyle(fontSize: 20),
            ),
            ElevatedButton(onPressed: () => Get.toNamed(Routes.PAGE2) , child: Text("Ke page 2"))
          ],
        ),
      ),
    );
  }
}

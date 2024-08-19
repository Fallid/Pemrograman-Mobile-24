import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modul_6_asynchronous_handling/app/routes/app_pages.dart';

class Page2 extends StatelessWidget {
  const Page2({ Key ? key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff1D1E22),
        title: const Text('FLUTTER GUYS'),
          centerTitle: true,
      ),
      body: Center(
        child: MaterialButton(
          height: 60,
          minWidth: 200,
          child: const Text(
            'GO TO PAGE 2',
            style: TextStyle(
              color: Colors.white
            ),
          ),
          color: const Color(0xff1D1E22),
          onPressed: () => Get.toNamed(Routes.HOME)
        ),
      ),
    );
  }
}
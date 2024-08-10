import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Picker'), elevation: 4,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              
              // User Interface untuk menampilkan, memilih, dan mendapatkan foto menggunakan kamera atau galeri
              SizedBox(
                height: Get.height / 2.32,
                width: Get.width * 0.7,
                child: Obx(() {
                  return controller.isImageLoading.value
                      ? const CircularProgressIndicator()
                      : controller.selectedImagePath.value == ''
                          ? const Text('No image selected')
                          : ClipRRect(borderRadius: BorderRadius.circular(20),
                              child: Image.file(
                                  File(controller.selectedImagePath.value),fit:BoxFit.cover ),
                            );
                }),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => controller.pickImage(ImageSource.camera),
                child: const Text('Pick Image from Camera'),
              ),
              ElevatedButton(
                onPressed: () => controller.pickImage(ImageSource.gallery),
                child: const Text('Pick Image from Gallery'),
              ),
              const SizedBox(height: 20),
              const Divider(
                color: Colors.grey,
              ),

              // User interface untuk mendapatkan, memilih, dan menampilkan video dari kamera atau galeri
              SizedBox(
                height: Get.height / 2.32,
                width: Get.width * 0.7,
                child: Obx(() {
                  if (controller.selectedVideoPath.value.isNotEmpty) {
                    return Card(
                      child: Column(
                        children: [
                          AspectRatio(
                            aspectRatio: 1,
                            child:
                                VideoPlayer(controller.videoPlayerController!),
                          ),
                          VideoProgressIndicator(
                            controller.videoPlayerController!,
                            allowScrubbing: true,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                icon: Icon(
                                  controller.isVideoPlaying.isTrue
                                      ? Icons.play_arrow
                                      : Icons.pause,
                                ),
                                onPressed: controller.togglePlayPause,
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  } else {
                    return const Text('No video selected');
                  }
                }),
              ),
              ElevatedButton(
                onPressed: () => controller.pickVideo(ImageSource.camera),
                child: const Text('Pick Video from Camera'),
              ),
              ElevatedButton(
                onPressed: () => controller.pickVideo(ImageSource.gallery),
                child: const Text('Pick Video from Gallery'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

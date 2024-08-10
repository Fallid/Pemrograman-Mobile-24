import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // URL dari audio yang akan diputar
    const audioUrl = 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3';
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Audio Player with GetX'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Slider untuk mengontrol posisi audio
            Obx(() {
              return Slider(
                min: 0.0,
                max: controller.duration.value.inSeconds.toDouble(),
                value: controller.position.value.inSeconds.toDouble(),
                onChanged: (value) {
                  controller.seekAudio(Duration(seconds: value.toInt()));
                },
              );
            }),

            // Menampilkan waktu yang sudah diputar dan durasi total
            Obx(() {
              return Text(
                '${_formatDuration(controller.position.value)} / ${_formatDuration(controller.duration.value)}',
              );
            }),

            const SizedBox(height: 20),

            // Tombol untuk mengontrol pemutaran audio (Play, Pause/Resume, Stop)
            Obx(() {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: controller.isPlaying.value
                        ? controller.pauseAudio
                        : controller.resumeAudio,
                    child: Text(controller.isPlaying.value ? 'Pause' : 'Resume'),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () => controller.playAudio(audioUrl),
                    child: const Text('Play'),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: controller.stopAudio,
                    child: const Text('Stop'),
                  ),
                ],
              );
            }),
          ],
        ),
      ),
    );
  }
  // Fungsi untuk memformat durasi menjadi menit:detik
  String _formatDuration(Duration duration) {
    return "${duration.inMinutes}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}";
  }
}

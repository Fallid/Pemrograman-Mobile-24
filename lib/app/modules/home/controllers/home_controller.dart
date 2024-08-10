import 'package:audioplayers/audioplayers.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  // Fungsi onInit dipanggil ketika controller diinisialisasi
  @override
  void onInit() {
    super.onInit();

    // Memonitor perubahan durasi audio
    _audioPlayer.onDurationChanged.listen((d) {
      duration.value = d;
    });

    // Memonitor perubahan posisi (progress) audio
    _audioPlayer.onPositionChanged.listen((p) {
      position.value = p;
    });
  }

  // Fungsi onClose dipanggil ketika controller dibuang
  @override
  void onClose() {
    _audioPlayer.dispose(); // Membersihkan AudioPlayer
    super.onClose();
  }

  // Membuat instance AudioPlayer untuk mengelola audio
  final AudioPlayer _audioPlayer = AudioPlayer();

  // Variabel reaktif untuk status pemutaran, durasi total, dan posisi saat ini
  var isPlaying = false.obs;
  var duration = Duration.zero.obs;
  var position = Duration.zero.obs;

  // Fungsi untuk memutar audio dari URL yang diberikan
  Future<void> playAudio(String url) async {
    await _audioPlayer.play(UrlSource(url));
    isPlaying.value = true; // Set isPlaying menjadi true ketika audio diputar
  }

  // Fungsi untuk menjeda audio
  Future<void> pauseAudio() async {
    await _audioPlayer.pause();
    isPlaying.value = false; // Set isPlaying menjadi false ketika audio dijeda
  }

  // Fungsi untuk melanjutkan pemutaran audio setelah dijeda
  Future<void> resumeAudio() async {
    await _audioPlayer.resume();
    isPlaying.value = true; // Set isPlaying menjadi true ketika audio dilanjutkan
  }

  // Fungsi untuk menghentikan audio dan reset posisi ke awal
  Future<void> stopAudio() async {
    await _audioPlayer.stop();
    isPlaying.value = false; // Set isPlaying menjadi false ketika audio dihentikan
    position.value = Duration.zero; // Reset posisi ke awal
  }

  // Fungsi untuk mengatur posisi audio (seek)
  void seekAudio(Duration newPosition) {
    _audioPlayer.seek(newPosition);
  }
}

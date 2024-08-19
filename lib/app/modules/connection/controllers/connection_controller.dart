import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';

class ConnectionController extends GetxController {
  // Observable untuk menyimpan status koneksi
  var isConnected = false.obs;

  // Inisialisasi controller
  @override
  void onInit() {
    super.onInit();
    _initConnectivity(); // Cek status koneksi saat pertama kali aplikasi dibuka
    _listenToConnectivity(); // Dengarkan perubahan koneksi secara real-time
  }

  // Fungsi untuk inisialisasi status koneksi saat pertama kali aplikasi dibuka
  void _initConnectivity() async {
    List<ConnectivityResult> connectivityResult =
        await (Connectivity().checkConnectivity());
    _updateConnectionStatus(connectivityResult.first);
  }

  // Fungsi untuk mendengarkan perubahan koneksi secara real-time
  void _listenToConnectivity() {
    Connectivity().onConnectivityChanged.listen((connectivityResult) {
      _updateConnectionStatus(connectivityResult.first);
    });
  }

  // Fungsi untuk mengupdate status koneksi
  void _updateConnectionStatus(ConnectivityResult connectivityResult) {
    // Jika ada koneksi internet, baik melalui WiFi atau Mobile Data
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      isConnected.value = true;
    } else {
      isConnected.value = false;
    }
  }
}
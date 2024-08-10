import 'dart:io';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

class HomeController extends GetxController {
  final ImagePicker _picker = ImagePicker(); //object image picker
  final box = GetStorage(); //get storage variable

  var selectedImagePath = ''.obs; //variable untuk menyimpan path image
  var isImageLoading = false.obs; //variable untuk loading state

  var selectedVideoPath = ''.obs; //variable untuk menyimpan path video
  var isVideoPlaying = false.obs; //variable untuk pause and play state
  VideoPlayerController? videoPlayerController; 

  @override
  void onInit() {
    super.onInit();
    _loadStoredData();
  }

  @override
  void onReady() {
    super.onReady();
    _loadStoredData();
  }

  @override
  void onClose() {
    videoPlayerController?.dispose();
    super.onClose();
  }

  //Function Future untuk menggunakakn kamera atau galeri
  Future<void> pickImage(ImageSource source) async {
    try {
      isImageLoading.value = true;
      final XFile? pickedFile = await _picker.pickImage(source: source);
      if (pickedFile != null) {
        selectedImagePath.value = pickedFile.path;
        box.write(
            'imagePath', pickedFile.path); //menyimpan image path ke get_storage
      } else {
        print('No image selected.');
      }
    } catch (e) {
      print('Error picking image: $e');
    } finally {
      isImageLoading.value = false;
    }
  }

  Future<void> pickVideo(ImageSource source) async {
    try {
      isImageLoading.value = true;
      final XFile? pickedFile = await _picker.pickVideo(source: source);
      if (pickedFile != null) {
        selectedVideoPath.value = pickedFile.path;
        box.write('videoPath', pickedFile.path);

        // Initialize VideoPlayerController
        videoPlayerController =
            VideoPlayerController.file(File(pickedFile.path))
              ..initialize().then((_) {
                // Ensure the first frame is shown
                videoPlayerController!.play();
                isVideoPlaying.value = true; // Update status
                update(); // Notify UI
              });
      } else {
        print('No video selected.');
      }
    } catch (e) {
      print('Error picking video: $e');
    } finally {
      isImageLoading.value = false;
    }
  }

  void _loadStoredData() {
    selectedImagePath.value = box.read('imagePath') ?? '';
    selectedVideoPath.value = box.read('videoPath') ?? '';

    if (selectedVideoPath.value.isNotEmpty) {
      videoPlayerController =
          VideoPlayerController.file(File(selectedVideoPath.value))
            ..initialize().then((_) {
              videoPlayerController!.play();
              // isVideoPlaying.value = true; // Update status
              // update(); // Notify UI
            });
    }
  }

  void play() {
    videoPlayerController?.play();
    isVideoPlaying.value = true; // Update status
    update(); // Notify UI
  }

  void pause() {
    videoPlayerController?.pause();
    isVideoPlaying.value = false; // Update status
    update(); // Notify UI
  }

  void togglePlayPause() {
    if (videoPlayerController != null) {
      if (videoPlayerController!.value.isPlaying) {
        videoPlayerController!.pause();
        isVideoPlaying.value = false; // Update status
      } else {
        videoPlayerController!.play();
        isVideoPlaying.value = true; // Update status
      }
      update(); // Notify UI
    }
  }
}

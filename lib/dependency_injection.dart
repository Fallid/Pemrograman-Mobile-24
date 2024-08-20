import 'package:get/get.dart';

import 'app/modules/connection/controllers/connection_controller.dart';

class DependencyInjection {
  
  static void init() {
    Get.put<ConnectionController>(ConnectionController(),permanent:true);
  }
}
import 'package:get/get.dart';
import 'package:modul_2_public_api/app/modules/dio_screen/bindings/dio_binding.dart';
import 'package:modul_2_public_api/app/modules/dio_screen/views/dio_view.dart';
import 'package:modul_2_public_api/app/modules/http_screen/bindings/http_binding.dart';
import 'package:modul_2_public_api/app/modules/http_screen/views/http_view.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
        name: _Paths.HTTP,
        page: () => const HttpView(),
        binding: HttpBinding()),
    GetPage(
        name: _Paths.DIO, page: () => const DioView(), binding: DioBinding())
  ];
}

import 'package:get/get.dart';
import 'package:modul_6_asynchronous_handling/app/modules/page2/views/page_2_view.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(name: _Paths.PAGE2, page: ()=> const Page2())
  ];
}

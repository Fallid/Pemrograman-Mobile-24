import 'package:get/get.dart';

import '../modules/connection/bindings/connection_binding.dart';
import '../modules/connection/views/init_connection_view.dart';
import '../modules/connection/views/no_connection_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.INITCONN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(name: _Paths.NOCONN, page: () => const NoConnectionView()),
    GetPage(
        name: _Paths.INITCONN,
        page: () => const InitConnection(),
        binding: ConnectionBinding())
  ];
}

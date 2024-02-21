import 'package:get/get.dart';
import 'package:getx_usage/screens/firstpage/first_page_view.dart';
import 'package:getx_usage/screens/firstpage/firstpage_controller.dart';
import 'package:getx_usage/screens/second/secondPage_binding.dart';
import 'package:getx_usage/screens/second/second_view.dart';

class AppRoutes {
  static String initial = '/';
  static String secondPage = '/secondPage';
  static List<GetPage<dynamic>>? getPages = [
    GetPage(
        name: initial, page: () => FirstPAge(), binding: FirstPageBinding()),
    GetPage(
        name: AppRoutes.secondPage,
        page: () => SecondPage(),
        binding: SecondPageBinding())
  ];
}

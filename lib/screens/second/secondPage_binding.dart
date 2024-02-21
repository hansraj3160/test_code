

import 'package:getx_usage/utils/export_file.dart';

class SecondPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<SecondController>(SecondController());
  }
}

class SecondController extends GetxController {
  RxString value = "".obs;

  @override
  void onInit() {
   
    super.onInit();
  }



  void assignValue() {
    value.value = "Hi Hans ";
  }
}

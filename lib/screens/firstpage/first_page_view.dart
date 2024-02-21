import 'package:getx_usage/routes/app_routes.dart';

import '../../utils/export_file.dart';

class FirstPAge extends GetView<FirstPageController> {
  const FirstPAge({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: () {
                controller.num.value = 4;
                controller.multiple();
              },
              child: Obx(() => Text(
                    "result ${controller.result}",
                    style: TextStyle(color: Colors.amber),
                  ))),
          ElevatedButton(
              onPressed: () {
                Get.toNamed(AppRoutes.secondPage);
              },
              child: Text(
                "result controller.result",
                style: TextStyle(color: Colors.amber),
              ))
        ],
      ),
    );
  }
}

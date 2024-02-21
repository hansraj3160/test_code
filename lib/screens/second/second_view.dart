import 'package:getx_usage/screens/second/secondPage_binding.dart';
import 'package:getx_usage/utils/export_file.dart';

class SecondPage extends GetView<SecondController> {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
      body: Center(
            child: Text("My second page Set Text ${controller.value.value}"),
          ),
    ));
  }
}

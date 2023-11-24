import 'package:get/get.dart';
import 'package:vair_app/controllers/main_screen_controller.dart';
import 'package:vair_app/providers/product_provider.dart';
import 'package:vair_app/screens/main_screen.dart';

class MainScreenBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MainScreenController());
    Get.lazyPut(() => ProductProvider());
  }
}
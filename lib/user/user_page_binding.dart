import 'package:get/get.dart';
import 'package:github/user/user_page_controller.dart';

class UserPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UserPageController());
  }
}

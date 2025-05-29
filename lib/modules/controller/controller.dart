
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class GetStartedController extends GetxController {
  var currentIndex = 0.obs;
  final titles = [
    'Shop Online\nProducts',
    'Fast Delivery of Delicious Food',
    'Find the Professional Services',
  ].obs;

  void updateIndex(int index) => currentIndex.value = index;
}

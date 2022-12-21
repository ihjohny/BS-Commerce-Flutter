import 'package:get/get.dart';

class BottomNavController extends GetxController {
  static final _selectedIndexController = 0.obs;

  static updateSelectedIndex(int index) => _selectedIndexController(index);

  int get selectedIndex => _selectedIndexController.value;
}

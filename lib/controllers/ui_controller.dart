import 'package:get/get.dart';


class BottomNavController extends GetxController {
  RxInt currentIndex = 0.obs;

  void changeIndex(int index) {
    currentIndex.value = index;
  }
}




class ContectController extends GetxController {
  var selectedFilter = 0.obs;
  var searchQuery = ''.obs;

  void changeFilter(int index) {
    selectedFilter.value = index;
  }

  void updateSearch(String value) {
    searchQuery.value = value.toLowerCase();
  }
}


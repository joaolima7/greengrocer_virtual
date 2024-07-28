import 'package:get/get.dart';
import 'package:greengrocer_virtual/src/core/utils/utils_dialogs.dart';
import 'package:greengrocer_virtual/src/layers/domain/entities/category.dart';
import 'package:greengrocer_virtual/src/layers/domain/entities/item.dart';
import 'package:greengrocer_virtual/src/layers/domain/usecases/item_usecases/get_all_category_usecase/get_all_category_usecase.dart';
import 'package:greengrocer_virtual/src/layers/domain/usecases/item_usecases/get_all_items_usecase/get_all_items_usecase.dart';

class HomeTabController extends GetxController {
  final GetAllCategoryUseCase _getAllCategoryUseCase;
  final GetAllItemsUseCase _getAllItemsUseCase;

  HomeTabController(this._getAllCategoryUseCase, this._getAllItemsUseCase);

  RxBool isLoading = false.obs;
  RxList<Category> allCategories = <Category>[].obs;
  Rx<Category?> currentCategory = Rx<Category?>(null);
  RxList<Item> allItems = <Item>[].obs;

  Future<void> loadAllCategories() async {
    isLoading.value = true;

    try {
      var result = await _getAllCategoryUseCase();
      if (result != null && result.isNotEmpty) {
        allCategories.value = result;
        currentCategory.value = allCategories.first;
      } else {
        allCategories.value = [];
      }
    } catch (e) {
      UtilsDialogs.showToast(message: e.toString(), sizeWidth: 300);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> loadAllItems() async {
    isLoading.value = true;

    try {
      var result = await _getAllItemsUseCase();
      if (result != null && result.isNotEmpty) {
        allItems.value = result;
      } else {
        allItems.value = [];
      }
    } catch (e) {
      UtilsDialogs.showToast(message: e.toString(), sizeWidth: 300);
    } finally {
      isLoading.value = false;
    }
  }

  void selectCategory(Category category) {
    currentCategory.value = category;
  }
}

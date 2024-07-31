import 'package:get/get.dart';
import 'package:greengrocer_virtual/src/core/utils/utils_dialogs.dart';
import 'package:greengrocer_virtual/src/layers/domain/entities/category.dart';
import 'package:greengrocer_virtual/src/layers/domain/entities/item.dart';
import 'package:greengrocer_virtual/src/layers/domain/usecases/item_usecases/get_all_category_usecase/get_all_category_usecase.dart';
import 'package:greengrocer_virtual/src/layers/domain/usecases/item_usecases/get_all_items_usecase/get_all_items_usecase.dart';
import 'package:greengrocer_virtual/src/layers/domain/usecases/item_usecases/get_items_by_category_usecase/get_items_by_category_usecase.dart';
import 'package:greengrocer_virtual/src/layers/domain/usecases/item_usecases/get_items_by_search_usecase/get_items_by_search_usecase.dart';

class HomeTabController extends GetxController {
  final GetAllCategoryUseCase _getAllCategoryUseCase;
  final GetAllItemsUseCase _getAllItemsUseCase;
  final GetItemsByCategoryUseCase _getItemsByCategoryUseCase;
  final GetItemsBySearchUseCase _getItemsBySearchUseCase;

  HomeTabController(
    this._getAllCategoryUseCase,
    this._getAllItemsUseCase,
    this._getItemsByCategoryUseCase,
    this._getItemsBySearchUseCase,
  );

  RxBool isLoading = false.obs;
  RxString search = ''.obs;
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

  Future<void> getItemsByCategory() async {
    isLoading.value = true;

    try {
      var result = await _getItemsByCategoryUseCase(
          currentCategory.value!.objectId.toString());
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

  Future<void> getItemsByName(String search) async {
    isLoading.value = true;

    try {
      var result = await _getItemsBySearchUseCase(search);
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

  void selectSearch(String search) {
    this.search.value = search;
  }
}

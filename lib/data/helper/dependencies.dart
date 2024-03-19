import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../api_client.dart';
//
// Future<void> init() async {
//   final sharedPreferences = await SharedPreferences.getInstance();
//   Get.lazyPut(() => sharedPreferences);
//  Get.lazyPut(() => ApiClient());
//
//   );
//   // Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.baseUrl));
//   //repos
//   Get.lazyPut(() => TestPageRepo(apiClient: Get.find()));
// //   Get.lazyPut(() => RecommendedProductRepo(apiClient: Get.find()));
// //   Get.lazyPut(() => CartRepo(sharedPreferences: Get.find()));
// //   //controllers
// //   Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
// //   Get.lazyPut(
// //           () => RecommendedProductController(recommendedProductRepo: Get.find()));
// //   Get.lazyPut(() => CartController(cartRepo: Get.find()));
// // }async async


// import 'package:get/get.dart';
// import 'package:get/get_navigation/src/routes/get_route.dart';
// import 'package:get/get_navigation/src/routes/transitions_type.dart';
// import 'package:jan_2024_studio/pages/home_pages/main_home_page.dart';
// import 'package:jan_2024_studio/pages/home_pages/test_page.dart';
// import 'package:jan_2024_studio/pages/recommended_product_details.dart';
//
// import '../pages/popular_products_details.dart';
//
// class RouteHelper {
//   static const String initial = "/";
//   static const String popularFood = "/popular-food";
//   static const String recommendedFood = "/recommended-food";
//
//   static String getInitial() => '$initial';
//   static String getPopularFood(int pageId) => '$popularFood? pageId = $pageId';
//   static String getRecommendedFood() => '$recommendedFood';
//
//   static List<GetPage> routes = [
//     GetPage(name: initial, page: ()=> const MainHomePage()),
//   //   GetPage(name: popularFood, page: (){
//   // var pageId = Get.parameters['pageId'];
//   // //return const PopularProductsDetails();},
//
//
//   // var pageId = Get.parameters['pageId'];
//   // return PopularProductsDetails(pageId:int.parse(pageId!));},
//   // transition: Transition.fadeIn,
//   // transitionDuration: const Duration(milliseconds: 500),
//   // ),
//   GetPage(name: recommendedFood, page: (){
//   return const RecommendedProductDetails();},
//   transition: Transition.fadeIn,)
//   ];
// }
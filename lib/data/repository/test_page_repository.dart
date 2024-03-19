// import 'package:get/get.dart';
// import 'package:jan_2024_studio/data/api_client.dart';
// import 'package:jan_2024_studio/models/test_page_model.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';
//
// class TestPageRepo extends GetxService {
//
//   final ApiClient apiClient;
//
//   TestPageRepo({ required this.apiClient});
//
//   Future<List<TestPageModel>> getUserInformation() async {
//     final response = Supabase.instance.client
//         .from('countries')
//         .select();
//     final res = response.single().execute().then((value) => value.data);
//
//
//     print("The response is" +res.toString());
//     // .from(_userSupabaseTable.tableName)
//     // .select()
//     // .eq(_userSupabaseTable.idColumn, userId)
//     // .single();
//
//     final List<TestPageModel>testPageModel = (res as List<dynamic>).map((e) => TestPageModel.fromJson(e)).toList();
//     return testPageModel;
//   }
//
// // Future<TestPageModel> getPopularProductList() async {
// //   return await apiClient.getUserInformation();
// // }
// }
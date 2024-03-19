import 'dart:collection';

import 'package:supabase_flutter/supabase_flutter.dart';

import '../models/test_page_model.dart';
 class ApiClient{
  final _future = Supabase.instance.client
      .from('countries')
      .select();

  final List _productSupaList = [];
  get productSupaList => _productSupaList;

  Future<List<TestPageModel>>getSupabaseDataList() async {
    late PostgrestResponse response;
    //_productSupaList = [];
    response = (await Supabase.instance.client
        .from('countries')
        .select().single()) as PostgrestResponse;

    final List<TestPageModel> _productSupaList =  (response.data as List<dynamic>)
        .map((json) => TestPageModel.fromJson(json)).toList();

    return _productSupaList;
  }




  // PostgrestFilterBuilder<PostgrestList> getSupabaseData () {
  //   return Supabase.instance.client
  //       .from('countries')
  //       .select();
  // }
}
















// import 'package:get/get_connect/connect.dart';
// import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';
// import 'package:jan_2024_studio/models/test_page_model.dart';
// //import 'package:supabase_client/supabase_client.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';
//
//
//
// class ApiClient  {
//   //final Supabase _supabase;
//   // final UserSupabaseTable _userSupabaseTable;
//   ApiClient();
//
//   //@override
//   Future<TestPageModel> getUserInformation() async {
//     final future = Supabase.instance.client
//         .from('countries')
//         .select<List<Map<dynamic, dynamic>>>();
//
//
//     print("The response is" + future.toString());
//     // .from(_userSupabaseTable.tableName)
//     // .select()
//     // .eq(_userSupabaseTable.idColumn, userId)
//     // .single();
//
//     final testPageModel = TestPageModel.fromJson(
//         future as Map<String, dynamic>);
//     return testPageModel;
//   }
//
// //@override
// //   Future<TestPageModel> updateUserInformation(TestPageModel testPageModel) async {
// //     await _supabase.client
// //         .from('countries')
// //         .update(testPageModel.toJson());
// //     return testPageModel;
// //   }
// // }
//
//
// /*
//
// import 'package:injectable/injectable.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';
//
// //////    ApiClient of another tutorial
// @module
// abstract class SupabaseModule {
//   @lazySingleton
//   Supabase supabase() => Supabase.instance;
// }
//
//
// */
//
//
// /*
//
// class ApiClient extends GetConnect implements GetxService {
//
//   final String supabaseUrl;
//   final String supabaseAnonKey;
//
//   ApiClient({required this.supabaseUrl, required this.supabaseAnonKey});
//     String baseURL = 'https://pxtnkrysopeyonsgbybh.supabase.co';
//     String anonKey = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InB4dG5rcnlzb3BleW9uc2dieWJoIiwicm9sZSI6ImFub24iLCJpYXQiOjE2ODgyMjE3MDMsImV4cCI6MjAwMzc5NzcwM30.85T3y9VKsgezuDKLK6FFoVkKENCeqFGkLjug6dybE_w';
//
//
//   // final _apiClient = Supabase.instance.client
//   //     .from('countries')
//   //  // .select('name')
//   //     .select<List<Map<dynamic, dynamic>>>();
//
//
//
//
//
//   // late String token;
//   // final String appBaseUrl;
//   // late Map<String, String> _mainHeaders;
//   // ApiClient({required this.appBaseUrl}) {
//   //   baseUrl = appBaseUrl;
//   //   timeout = const Duration(seconds: 30);
//   //   token = AppConstants.token;
//   //   _mainHeaders = {
//   //     'Content-type': 'application/json; charset=UTF-8',
//   //     'Authorization': 'Bearer $token',
//   //   };
//   //}
//   Future<Response> getData(String uri) async {
//     try {
//
//       Response response = await Supabase.instance.client
//           .from('countries')
//          .select('name');
//       //    .select<List<Map<dynamic, dynamic>>>();
//       //Response response = await get(uri);
//       return response;
//     } catch (e) {
//       return Response(statusCode: 1, statusText: e.toString());
//     }
//   }
//   */
//
// }
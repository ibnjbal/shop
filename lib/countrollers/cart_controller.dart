import 'package:flutter/material.dart';
import 'package:shop/data/api_client.dart';
import 'package:shop/models/test_page_model.dart';
class CartController extends ChangeNotifier{

  final ApiClient apiClient;

  late  List<TestPageModel> cartList=[];


  CartController(this.apiClient);

  Future<void> getCart()async{
    cartList = await apiClient.getSupabaseDataList();
    print('===============================================');
    print(cartList);
    print('===============================================');
    notifyListeners();
  }

}
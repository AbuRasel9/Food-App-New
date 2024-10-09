import 'package:flutter/widgets.dart';
import 'package:foodly_ui/lib/core/data/product/product_repo.dart';
import 'package:foodly_ui/lib/core/dataModel/product/popular_product_response.dart';

class ProductProvider extends ChangeNotifier{
  /// variable
  //<<-------------->> loading <<-------------->>//
  bool _isLoading=false;

  //<<-------------->> product  variable<<-------------->>//
  List<Product>? _productList;

  /// get variable
  //<<-------------->> get product list<<-------------->>//
  List<Product>?get productList=>_productList;

  //<<-------------->> loading <<-------------->>//
  bool get isLoading=>_isLoading;


  ///set function or api call
  //<<-------------->> fetch product list <<-------------->>//
  Future<PopularProductResponse>getProductList() async {

    final result=await ProductRepoImpl().popularProduct();
    _productList=result.products;
    return result;

  }
  void setLoading({required bool value}){
    _isLoading=value;
    notifyListeners();
  }



}
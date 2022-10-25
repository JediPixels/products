import 'dart:async';
import 'package:products/models/product/product_model.dart';

class ProductListService {
  bool internetConnectionAvailability = true;
  bool isProductLoading = false;
  int skip = 0;
  List<ProductModel> productList = <ProductModel>[];

  final StreamController<List<ProductModel>> _productListController = StreamController<List<ProductModel>>.broadcast();
  Sink<List<ProductModel>> get _addProductsList => _productListController.sink;
  Stream<List<ProductModel>> get getProductsList => _productListController.stream;

  ProductListService() {
    startListeners();
  }

  void dispose() {
    _productListController.close();
  }

  void startListeners() {
    _productListController.stream.listen((product) {
      isProductLoading = false;
    });
  }

  void addProducts(List<ProductModel> addToProductList) {
    // Add new Products to the existing Products List
    if (addToProductList.isNotEmpty) {
      isProductLoading = true;
      productList.addAll(addToProductList);
    }
    _addProductsList.add(productList);
  }

  void addProductError(String error) {
    isProductLoading = false;
    _productListController.addError(error);
  }

  void refreshCurrentListProducts() {
    _addProductsList.add(productList);
  }

  void clearProducts() {
    skip = 0;
    productList.clear();
    _addProductsList.add([]);
  }
}
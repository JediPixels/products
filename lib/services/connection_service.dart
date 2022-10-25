import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'product/product_list_service.dart';

class ConnectionService {
  late StreamSubscription<ConnectivityResult> connectivity;
  late ProductListService productListService;

  ConnectionService(ProductListService service) {
    productListService = service;
  }

  Future<bool> isInternetConnectionAvailable() async {
    bool isConnectionAvailable = true;
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      isConnectionAvailable = false;
      productListService.internetConnectionAvailability = false;
      productListService.isProductLoading = false;
      productListService.addProductError('Internet connection is currently not available');
    }
    return isConnectionAvailable;
  }

  watchConnectivity(ProductListService productListService) {
    connectivity = Connectivity().onConnectivityChanged.listen((ConnectivityResult status) {
      switch (status) {
        case ConnectivityResult.none:
          productListService.internetConnectionAvailability = false;
          productListService.isProductLoading = false;
          productListService.addProductError('Internet connection is currently not available');
          break;
        default:
          productListService.internetConnectionAvailability = true;
          productListService.refreshCurrentListProducts();
      }
    });
  }

  void cancel() {
    connectivity.cancel();
  }
}
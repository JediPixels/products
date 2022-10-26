import 'dart:isolate';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:products/models/product/products_list_model.dart';
import 'package:products/services/auth/api_values_service.dart';
import 'package:products/services/product/product_list_service.dart';

class ProductService {
  late ProductListService productListService;

  ProductService(ProductListService service) {
    productListService = service;
  }

  getProducts(String authToken) async {
    if (authToken.isNotEmpty) {
      Uri url = Uri.https(ApiServiceValues.productsBaseUrl, ApiServiceValues.productsBaseUrlPath, {
        'limit': '10',
        'skip': productListService.skip.toString(),
        // 'select': 'title, price',
      });

      await http.get(
        url,
        headers: {
          'Connection': 'keep-alive',
          'Authorization': 'Bearer $authToken',
          'Content-Type': 'application/json'
        },
      ).then((response) {
        if (response.statusCode == 200) {
          // Three ways to parse info. Default, via compute, and via Isolate.spawn - Message
          productListService.isProductLoading = true;

          // 1. Default
          final productsListModel = ProductsListModel.fromRawJson(response.body);
          productListService.addProducts(productsListModel.products);
          productListService.skip += 10;
          productListService.isProductLoading = false;

          // 2. Via compute - Spawn an Isolate
          // ProductsServiceBackgroundParser().parseViaCompute(response.body).then((productsList) {
          //   productListService.addProducts(productsList.products);
          //   productListService.skip += 10;
          //   productListService.isProductLoading = false;
          // });

          // 3. Visa Isolate.spawn - Manually spawn Isolate plus message
          //    NOTE: Currently not supported on Web
          // ProductsServiceBackgroundParser().parseViaIsolate(response.body).then((productsList) {
          //   productListService.addProducts(productsList.products);
          //   productListService.skip += 10;
          //   productListService.isProductLoading = false;
          // });

        } else if (response.statusCode == 404) {
          productListService.isProductLoading = false;
          productListService.addProductError('Failed to load products:\n404 Not Found');
        } else {
          productListService.isProductLoading = false;
          productListService.addProductError('Failed to load products:\nUnknown Error');
        }
      }).onError((error, stackTrace) {
        // debugPrint('stackTrace: $stackTrace');
        productListService.isProductLoading = false;
        productListService.addProductError('Failed to load products:\n$error');
      });
    } else {
      productListService.isProductLoading = false;
      productListService.addProductError('Failed to load products');
    }
  }
}

@immutable
class ProductsServiceBackgroundMessage {
  final SendPort sendPort;
  final String encodedJson;

  const ProductsServiceBackgroundMessage({
    required this.sendPort,
    required this.encodedJson,
  });
}

class ProductsServiceBackgroundParser {
  // Background Parser via compute
  Future<ProductsListModel> parseViaCompute(String encodedJson) async {
    return await compute(_fromRawJsonViaCompute, encodedJson);
  }

  ProductsListModel _fromRawJsonViaCompute(String body) {
    return ProductsListModel.fromRawJson(body);
  }

  // Background Parser via Isolate.spawn
  Future<ProductsListModel> parseViaIsolate(String encodedJson) async {
    final ReceivePort receivePort = ReceivePort();
    ProductsServiceBackgroundMessage productsServiceBackgroundMessage =
        ProductsServiceBackgroundMessage(
          sendPort: receivePort.sendPort,
          encodedJson: encodedJson,
        );
    await Isolate.spawn(_fromRawJsonViaIsolate, productsServiceBackgroundMessage);
    // Note: Arguments could also be passed as (list<dynamic> parameters)
    // await Isolate.spawn(_fromRawJsonViaIsolateDynamic, [receivePort.sendPort, encodedJson]);
    return await receivePort.first;
  }

  void _fromRawJsonViaIsolate(ProductsServiceBackgroundMessage productsServiceBackgroundMessage) async {
    SendPort sendPort = productsServiceBackgroundMessage.sendPort;
    String encodedJson = productsServiceBackgroundMessage.encodedJson;
    final result = ProductsListModel.fromRawJson(encodedJson);
    Isolate.exit(sendPort, result);
  }

  // Note: Parameters could also receive Arguments as (List<dynamic> parameters)
  /*
  Future<void> _fromRawJsonViaIsolateDynamic(List<dynamic> parameters) {
    SendPort sendPort = parameters[0];
    String encodedJson = parameters[1];
    final result = ProductsListModel.fromRawJson(encodedJson);
    Isolate.exit(sendPort, result);
  }
  */
}

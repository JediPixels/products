import 'package:flutter/material.dart';
import 'package:products/services/connection_service.dart';
import 'package:products/services/product/product_list_service.dart';
import 'package:products/widgets/status_message.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late ConnectionService connectionService;
  // late ProductService productService;
  final ProductListService productListService = ProductListService();
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    connectionService = ConnectionService(productListService);
    connectionService.watchConnectivity(productListService);
    // Check if scroll has reached the bottom, then retrieve the next 10 records/products
    scrollController.addListener(() {
      if (scrollController.offset == scrollController.position.maxScrollExtent && !productListService.isProductLoading) {
        // TODO: Get Products... the next 10 products.
      }
    });
  }

  @override
  void dispose() {
    // BEFORE...
    super.dispose();
  }

  Future<bool> checkInternetConnection() async {
    productListService.internetConnectionAvailability = await connectionService.isInternetConnectionAvailable();
    if (!productListService.internetConnectionAvailability) {
      productListService.internetConnectionAvailability = false;
      productListService.isProductLoading = false;
      productListService.addProductError('Internet connection is currently no available');
    }
    return productListService.internetConnectionAvailability;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
      ),
      body: SafeArea(
        child: StreamBuilder(
          initialData: const [],
          stream: productListService.getProductsList,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (!productListService.internetConnectionAvailability) {
              return const StatusMessage(
                message: 'Internet connection is currently not available',
                bannerMessage: 'none',
                bannerColor: Colors.yellow,
                textColor: Colors.black,
              );
            }

            // TODO: Check snapshot connection state


            return const Text('Hello');
          },

        ),
      ),
    );
  }
}

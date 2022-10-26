import 'package:flutter/material.dart';
import 'package:products/helpers/app_helpers.dart';
import 'package:products/models/product/product_model.dart';
import 'package:products/widgets/product/products_listview_item_card.dart';

class ProductsListView extends StatelessWidget {
  const ProductsListView({
    Key? key,
    required this.productsList,
    required this.scrollController,
    required this.selectedListType,
  }) : super(key: key);

  final List<ProductModel> productsList;
  final ScrollController scrollController;
  final SelectedListType selectedListType;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: scrollController,
      physics: const AlwaysScrollableScrollPhysics(),
      slivers: [
        const SliverToBoxAdapter(
          child: Icon(Icons.flutter_dash, size: 48,),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
            switch (selectedListType) {
              case SelectedListType.card:
                return ProductsListViewItemCard(productModel: productsList, index: index);
              // case SelectedListType.list1:
              //   return ProductsListViewItem1(productModel: productsList, index: index);
              // case SelectedListType.list2:
              //   return ProductsListViewItem2(productModel: productsList, index: index);
            }
          },
          childCount: productsList.length,
          ),
        ),
      ],
    );

    // TODO: Create with a ListView.builder and ListView.separated to test performance
  }
}
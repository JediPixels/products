import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:products/models/product/product_model.dart';
import 'package:products/widgets/star_rating.dart';

class ProductsListViewItem1 extends StatelessWidget {
  const ProductsListViewItem1({
    Key? key,
    required this.productModel,
    required this.index,
  }) : super(key: key);

  final List<ProductModel> productModel;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 16),
        AspectRatio(
          aspectRatio: 4,
          child: SizedBox(
            height: 120,
            child: productModel[index].images.length == 1 ?
            Image.network(
              productModel[index].thumbnail,
              fit: BoxFit.fitWidth,
              width: 90,
            )
            :
            ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: productModel[index].images.length,
              itemBuilder: (BuildContext context, int indexImages) {
                return Container(
                  padding: const EdgeInsets.only(right: 3),
                  color: Theme.of(context).primaryColor.withOpacity(0.4),
                  child: FadeInImage.assetNetwork(
                    placeholder: 'assets/images/placeholder-image.png',
                    fit: BoxFit.fitHeight,
                    image: productModel[index].images[indexImages],
                  ),
                );
              },
            ),
          ),
        ),
        ListTile(
          title: Text(productModel[index].title),
          subtitle: Text(productModel[index].description),
          isThreeLine: true,
          trailing: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(NumberFormat.simpleCurrency().format(productModel[index].price)),
              Text(NumberFormat.percentPattern().format(productModel[index].discountPercentage/100)),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
          child: Column(
            children: [
              Row(
                children: [
                  Text('Category: ${productModel[index].category}'),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  StarRating(rating: productModel[index].rating),
                  Text('Rating: ${productModel[index].rating}'),
                ],
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
        const Divider()
      ],
    );
  }
}

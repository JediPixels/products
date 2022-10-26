import 'package:flutter/material.dart';

class StarRating extends StatelessWidget {
  const StarRating({Key? key, required this.rating}) : super(key: key);

  final double rating;
  final int ratingTotal = 5;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(ratingTotal, (index) {
        IconData starIcon;

        if (rating > index && rating < index+1) {
          starIcon = Icons.star_half_outlined;
        } else if (rating <= index) {
          starIcon = Icons.star_border;
        } else {
          starIcon = Icons.star;
        }

        return Icon(
          starIcon,
          color: Theme.of(context).primaryColor,
        );
      }),
    );
  }
}

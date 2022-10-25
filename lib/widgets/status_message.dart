import 'package:flutter/material.dart';

class StatusMessage extends StatelessWidget {
  const StatusMessage({
    Key? key,
    required this.message,
    required this.bannerMessage,
    required this.bannerColor,
    required this.textColor,
  }) : super(key: key);

  final String message;
  final String bannerMessage;
  final Color bannerColor;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Banner(
          message: bannerMessage,
          location: BannerLocation.topStart,
          color: bannerColor,
          textStyle: TextStyle(color: textColor),
        ),
        Center(
          child: Container(
            margin: const EdgeInsets.only(top: 48),
            padding: const EdgeInsets.all(24),
            child: Text(
              message,
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
        )
      ],
    );
  }
}

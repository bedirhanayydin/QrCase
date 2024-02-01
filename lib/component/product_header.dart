import 'package:flutter/material.dart';

import '../core/theme/text_theme_light.dart';

class ProductHeader extends StatelessWidget {
  const ProductHeader({
    super.key,
    required this.productName,
    required this.serialNo,
  });

  final String productName;
  final String serialNo;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0, top: 12, right: 4, bottom: 9.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              productName,
              style: TextThemeLight.instance!.primary,
              textAlign: TextAlign.left,
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
            ),
            const SizedBox(
              height: 2,
            ),
            Text(
              serialNo,
              style: TextThemeLight.instance!.secondary,
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}

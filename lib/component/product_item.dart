import 'package:flutter/material.dart';
import 'package:qr_example/component/product_image.dart';
import 'package:qr_example/component/product_header.dart';

import '../core/constants/color_constants.dart';

class ProductItemComponent extends StatelessWidget {
  final String imageUrl;
  final String productName;
  final String serialNo;
  final Function() onTap;

  const ProductItemComponent(
      {super.key, required this.imageUrl, required this.productName, required this.onTap, required this.serialNo});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(28.0),
      onTap: onTap,
      child: Ink(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.width / 3.2,
        child: Card(
          shadowColor: ColorConstants.instance.shadowCardColor,
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
          ),
          child: Row(
            children: [
              ProductImage(imageUrl: imageUrl),
              ProductHeader(productName: productName, serialNo: serialNo),
            ],
          ),
        ),
      ),
    );
  }
}

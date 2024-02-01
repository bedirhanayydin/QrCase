import 'package:flutter/material.dart';

class ProductImage extends StatelessWidget {
  const ProductImage({
    super.key,
    required this.imageUrl,
  });

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0, bottom: 9.0, left: 12.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        //cached network ımage kullanılabilirdi
        child: Image.network(
          imageUrl,
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) {
              return child;
            } else {
              return const CircularProgressIndicator();
            }
          },
          errorBuilder: (context, url, error) => const Icon(Icons.error),
          fit: BoxFit.contain,
          width: MediaQuery.of(context).size.width / 4,
          height: MediaQuery.of(context).size.height,
        ),
      ),
    );
  }
}

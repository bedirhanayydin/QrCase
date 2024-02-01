import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_example/component/product_item.dart';
import 'package:qr_example/core/theme/text_theme_light.dart';
import 'package:qr_example/data/model/product.dart';
import 'package:qr_example/pages/verified_product.dart/bloc/verified_product_bloc.dart';

class VerifiedProductsPage extends StatefulWidget {
  const VerifiedProductsPage({Key? key}) : super(key: key);

  @override
  State<VerifiedProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<VerifiedProductsPage> {
  late VerifiedProductBloc _verifiedProductBloc;

  @override
  void initState() {
    super.initState();
    _verifiedProductBloc = BlocProvider.of<VerifiedProductBloc>(context);
    _verifiedProductBloc.add(GetVerifiedProduct());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<VerifiedProductBloc, VerifiedProductState>(
      listener: (context, state) {
        if (state is ShowSuccessMessage) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Product added successfully!'),
              duration: Duration(seconds: 2),
            ),
          );
        }
      },
      builder: (context, state) {
        if (state is VerifiedProductLoading) {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.red,
            ),
          );
        }

        if (state is VerifiedProductLoadedWithCache) {
          if (state.cachedProducts.isEmpty) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    'Barkodu okunmuş ürün bulunamadı.',
                    style: TextThemeLight.instance!.primary,
                  ),
                ),
              ],
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.fromLTRB(12, 12, 12, 120),
            physics: const AlwaysScrollableScrollPhysics(),
            itemCount: state.cachedProducts.length,
            itemBuilder: (context, index) {
              Product e = state.cachedProducts[index];
              return ProductItemComponent(
                imageUrl: e.image ?? '',
                productName: e.name ?? '',
                serialNo: e.serialNo ?? '',
                onTap: () => {},
              );
            },
          );
        }

        if (state is VerifiedProductError) {
          final error = state;
          return Center(
            child: Text(error.message),
          );
        }

        return const Center(
          child: Text("Unknown State"),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_example/component/product_item.dart';
import 'package:qr_example/core/constants/color_constants.dart';
import 'package:qr_example/pages/product/bloc/product_bloc.dart';
import 'package:shimmer/shimmer.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({Key? key}) : super(key: key);

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  late ProductBloc _productBloc;

  @override
  void initState() {
    super.initState();
    _productBloc = BlocProvider.of<ProductBloc>(context);
    _productBloc.add(GetProduct());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        if (state is ProductInitial) {
          return Column(
            children: const [
              Text('Products Tab - Initial'),
            ],
          );
        } else if (state is ProductLoading) {
          return Center(
            child: _buildShimmerList(),
          );
        } else if (state is ProductLoaded) {
          return ListView(
            padding: const EdgeInsets.all(12),
            physics: const AlwaysScrollableScrollPhysics(),
            children: state.product.map(
              (e) {
                return ProductItemComponent(
                  imageUrl: e.image ?? '',
                  productName: e.name ?? '',
                  serialNo: e.serialNo ?? '',
                  onTap: () => {},
                );
              },
            ).toList(),
          );
        } else if (state is ProductError) {
          final error = state;
          return Center(
            child: Text(error.message),
          );
        } else {
          return const Center(
            child: Text("Unknown State"),
          );
        }
      },
    );
  }

  Widget _buildShimmerList() {
    return Shimmer.fromColors(
      baseColor: ColorConstants.instance.headerColor,
      highlightColor: ColorConstants.instance.headerColor.withOpacity(0.3),
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return ListTile(
            title: Container(
              height: 20,
              width: double.infinity,
              color: ColorConstants.instance.white,
            ),
            subtitle: Container(
              height: 15,
              width: double.infinity,
              color: ColorConstants.instance.white,
            ),
            leading: Container(
              width: 50,
              height: 50,
              color: ColorConstants.instance.white,
            ),
          );
        },
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_example/core/constants/color_constants.dart';
import 'package:qr_example/data/repository/product_repository.dart';
import 'package:qr_example/pages/product/bloc/product_bloc.dart';
import 'package:qr_example/pages/product/product_page.dart';
import 'package:qr_example/pages/qr_scanner/bloc/qr_scanner_bloc.dart';
import 'package:qr_example/pages/qr_scanner/qr_scanner_page.dart';
import 'package:qr_example/pages/verified_product.dart/bloc/verified_product_bloc.dart';
import 'package:qr_example/pages/verified_product.dart/verified_product_page.dart';
import 'package:rolling_bottom_bar/rolling_bottom_bar.dart';
import 'package:rolling_bottom_bar/rolling_bottom_bar_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // final int _currentIndex = 0;
  final _pageControlller = PageController();

  @override
  void dispose() {
    _pageControlller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CupertinoNavigationBar(
        automaticallyImplyLeading: false,
        middle: const Text(
          "Products App",
        ),
        backgroundColor: ColorConstants.instance.floatingActionButtonColor,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BlocProvider(
              create: (context) => QrScannerBloc(ProductRepository()),
              child: const QrScannerPage(),
            ),
          ),
        ),
        backgroundColor: ColorConstants.instance.floatingActionButtonColor,
        child: const Icon(
          Icons.qr_code_scanner_sharp,
          size: 30,
        ),
      ),
      extendBody: true,
      bottomNavigationBar: RollingBottomBar(
        color: ColorConstants.instance.floatingActionButtonColor,
        controller: _pageControlller,
        itemColor: ColorConstants.instance.white,
        flat: true,
        useActiveColorByDefault: false,
        items: [
          RollingBottomBarItem(
            Icons.shopping_cart,
            label: 'Products',
            activeColor: ColorConstants.instance.green,
          ),
          RollingBottomBarItem(
            Icons.verified_sharp,
            label: 'Verified Products',
            activeColor: ColorConstants.instance.green,
          ),
        ],
        enableIconRotation: true,
        onTap: (index) {
          _pageControlller.animateToPage(
            index,
            duration: const Duration(milliseconds: 400),
            curve: Curves.easeOut,
          );
        },
      ),
      body: PageView(
        controller: _pageControlller,
        children: [
          BlocProvider(
            create: (context) => ProductBloc(ProductRepository()),
            child: const ProductsPage(),
          ),
          BlocProvider(
            create: (context) => VerifiedProductBloc(ProductRepository()),
            child: const VerifiedProductsPage(),
          )
        ],
      ),
    );
  }

  // void _onTabTapped(int index) {
  //   setState(() {
  //     _currentIndex = index;
  //   });
  // }

  // Widget body() {
  //   switch (_currentIndex) {
  //     case 0:
  //       return BlocProvider(
  //         create: (context) => ProductBloc(ProductRepository()),
  //         child: const ProductsPage(),
  //       );
  //     case 1:
  //       return BlocProvider(
  //         create: (context) => VerifiedProductBloc(ProductRepository()),
  //         child: const VerifiedProductsPage(),
  //       );
  //     default:
  //       return BlocProvider(
  //         create: (context) => ProductBloc(ProductRepository()),
  //         child: const ProductsPage(),
  //       );
  //   }
  // }
}

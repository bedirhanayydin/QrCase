import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qr_example/pages/home.dart';

import 'data/repository/product_repository.dart';
import 'pages/product/bloc/product_bloc.dart';
import 'pages/verified_product.dart/bloc/verified_product_bloc.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(414, 896),
      minTextAdapt: true,
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => ProductBloc(ProductRepository())),
            BlocProvider(create: (context) => VerifiedProductBloc(ProductRepository())),
          ],
          child: const HomePage(),
        ),
      ),
    );
  }
}

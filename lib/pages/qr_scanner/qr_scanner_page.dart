import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:qr_example/core/theme/text_theme_light.dart';
import 'package:qr_example/pages/qr_scanner/bloc/qr_scanner_bloc.dart';

import '../../core/constants/color_constants.dart';

class QrScannerPage extends StatefulWidget {
  final void Function(String code)? onChanged;

  const QrScannerPage({Key? key, this.onChanged}) : super(key: key);

  @override
  State<QrScannerPage> createState() => _QrScannerPageState();
}

class _QrScannerPageState extends State<QrScannerPage> {
  late QRViewController controller;
  final GlobalKey _qrKey = GlobalKey(debugLabel: 'QR');

  late QrScannerBloc _qrScannerBloc;

  @override
  void initState() {
    super.initState();
    _qrScannerBloc = BlocProvider.of<QrScannerBloc>(context);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller.pauseCamera();
    }
    controller.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<QrScannerBloc, QrScannerState>(
      listener: (context, state) {
        if (state is ShowSuccessMessage) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Product added successfully!'),
              duration: Duration(seconds: 2),
            ),
          );
        }
        if (state is QrScannerError) {
          final error = state;
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(error.message),
              duration: const Duration(seconds: 2),
            ),
          );
        }
      },
      builder: (context, state) {
        if (state is QrScannerError) {
          final error = state;
          return Center(
            child: Text(error.message),
          );
        }
        return Scaffold(
          appBar: CupertinoNavigationBar(
            middle: const Text("Qr Scanner Page"),
            leading: GestureDetector(
              onTap: () {
                // Dispose of the controller and stop scanning when navigating back
                controller.dispose();
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back_ios_sharp,
                color: ColorConstants.instance.floatingActionButtonColor,
              ),
            ),
            backgroundColor: ColorConstants.instance.headerColor,
          ),
          body: Column(
            children: [
              Expanded(
                flex: 9,
                child: QRView(
                  key: _qrKey,
                  onQRViewCreated: _onQRViewCreated,
                  overlay: QrScannerOverlayShape(
                    borderColor: ColorConstants.instance.white,
                    borderRadius: 20,
                    borderLength: 20,
                    borderWidth: 20,
                    cutOutSize: 400,
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    ElevatedButton(
                      onPressed: () async {
                        await controller.pauseCamera();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorConstants.instance.floatingActionButtonColor, // Arka plan rengi
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0), // Radius
                        ),
                      ),
                      child: Text('Pause', style: TextThemeLight.instance!.primary),
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        await controller.resumeCamera();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorConstants.instance.floatingActionButtonColor, // Arka plan rengi
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0), // Radius
                        ),
                      ),
                      child: Text('Resume', style: TextThemeLight.instance!.primary),
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((barcode) async {
      if (barcode.format == BarcodeFormat.qrcode && barcode.code != null) {
        // context.read<QrScannerBloc>().add(AddVerifiedProduct(
        //       barcode.code.toString(),
        //     ));
        _qrScannerBloc.add(AddVerifiedProduct(barcode.code.toString()));
        await controller.pauseCamera();
        controller.dispose();
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => MultiBlocProvider(
        //       providers: [
        //         BlocProvider(create: (context) => ProductBloc(ProductRepository())),
        //         BlocProvider(create: (context) => VerifiedProductBloc(ProductRepository())),
        //       ],
        //       child: const HomePage(),
        //     ),
        //   ),
        // );
      }
    });
  }
}

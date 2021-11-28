import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:provider/provider.dart';
import 'package:seccion9_qrscanner/screens/scan_list_provier.dart';
import 'package:seccion9_qrscanner/utils/utils.dart';

class ScanButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation: 0,
      onPressed: () async {
        String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
            '#58C2E8', 'Cancelar', true, ScanMode.QR);

        //final String barcodeScanRes = "https://fernando-herrera.com";
        //final String barcodeScanRes = "geo:50.587784,-73.540965";

        if (barcodeScanRes == '-1') {
          return;
        }

        final scanListProvider =
            Provider.of<ScanListProvider>(context, listen: false);
        final nuevoScan = await scanListProvider.nuevoScan(barcodeScanRes);
        launchURL(context, nuevoScan);
        //scanListProvider.nuevoScan('geo:15.33,15.66');
      },
      child: Icon(Icons.filter_center_focus),
    );
  }
}

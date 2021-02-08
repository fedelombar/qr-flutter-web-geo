import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/models/scan_model.dart';
import 'package:qr_flutter/providers/scan_list_provider.dart';
import 'package:qr_flutter/utils/utils.dart';

class ScanButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        elevation: 0,
        child: Icon(Icons.filter_center_focus),
        onPressed: () async {
          String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
              '#3D8BEF', 'Cancel', false, ScanMode.QR);

          //final barcodeScanRes = 'https://fernando-herrera.com';
          //final barcodeScanRes = 'geo:-34.57772097535945,-58.49473874478925';
          // si el usuario cancela, entonces no hay que hacer nada
          if (barcodeScanRes == '-1') {
            return;
          }

          final scanListProvider =
              Provider.of<ScanListProvider>(context, listen: false);

          final nuevoScan = await scanListProvider.nuevoScan(barcodeScanRes);

          launchURL(context, nuevoScan);
        });
  }
}

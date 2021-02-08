import 'package:flutter/material.dart';
import 'package:qr_flutter/providers/scan_list_provider.dart';

//myimports
import 'package:qr_flutter/src/pages/widgets/custom_navigatonbar.dart';
import 'package:qr_flutter/src/pages/widgets/scan_buttom.dart';
import 'package:qr_flutter/providers/ui_provider.dart';

import 'package:provider/provider.dart';
import 'package:qr_flutter/src/pages/directions_page.dart';
import 'package:qr_flutter/src/pages/maps_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Historial'),
        actions: [
          IconButton(
              icon: Icon(Icons.delete_forever),
              onPressed: () {
                Provider.of<ScanListProvider>(context, listen: false)
                    .borrarTodos();
              })
        ],
      ),
      body: _HomePageBody(),
      bottomNavigationBar: CustomNavigationBar(),
      floatingActionButton: ScanButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class _HomePageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // get the selected menu opt
    final uiProvider = Provider.of<UiProvider>(context);
    // change status pages
    final currentIndex = uiProvider.selectedMenuOpt;

    // TODO: Temporal read database
    // final tempScan = new ScanModel(valor: 'http://google.com');
    //DBProvider.db.deleteAllScans().then(print);

// USE the ScanListProvider
    final scanListProvider =
        Provider.of<ScanListProvider>(context, listen: false);
    switch (currentIndex) {
      case 0:
        scanListProvider.cargarScanPorTipo('geo');
        return MapasPage();

      case 1:
        scanListProvider.cargarScanPorTipo('http');
        return DirectionsPage();

      default:
        return MapasPage();
    }
  }
}

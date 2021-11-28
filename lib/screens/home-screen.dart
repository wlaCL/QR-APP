import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seccion9_qrscanner/models/scan_model.dart';
import 'package:seccion9_qrscanner/providers/db_provider.dart';
import 'package:seccion9_qrscanner/providers/ui_provider.dart';
import 'package:seccion9_qrscanner/screens/direcciones_page.dart';
import 'package:seccion9_qrscanner/screens/mapas_screen.dart';
import 'package:seccion9_qrscanner/screens/scan_list_provier.dart';
import 'package:seccion9_qrscanner/widgets/custom_navigatorbar.dart';
import 'package:seccion9_qrscanner/widgets/scan_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Historial",
        ),
        actions: [
          IconButton(
              onPressed: () {
                Provider.of<ScanListProvider>(context, listen: false)
                    .borrarTodos();
              },
              icon: Icon(Icons.delete_forever_sharp, color: Colors.blueGrey))
        ],
        elevation: 0,
      ),
      body: _HomePageBody(),
      bottomNavigationBar: CustomNavigatorBar(),
      floatingActionButton: ScanButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class _HomePageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final uiprovider = Provider.of<UiProvider>(context);
    final currentIndex = uiprovider.selectMenuOpt;

    //TODO temporal leer la base de datos
    final tempScan = new ScanModel(valor: 'http://google.com');
    //DBProvider.db.nuevoScan(tempScan);
    //DBProvider.db.getToodosLosScans().then(print);

    final scanListProvider =
        Provider.of<ScanListProvider>(context, listen: false);
//mostar la pagina respectiva
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

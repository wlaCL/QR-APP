import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seccion9_qrscanner/providers/ui_provider.dart';
import 'package:seccion9_qrscanner/screens/home-screen.dart';
import 'package:seccion9_qrscanner/screens/mapa_screen.dart';
import 'package:seccion9_qrscanner/screens/scan_list_provier.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => new UiProvider()),
        ChangeNotifierProvider(create: (_) => new ScanListProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'QR-SCANNER',
        initialRoute: 'home',
        routes: {'home': (_) => HomeScreen(), 'mapa': (_) => MapaScreen()},
        theme: ThemeData(
            primaryColor: Colors.blueGrey,
            primarySwatch: Colors.lightBlue,
            //primaryIconTheme: IconThemeData(color: Colors.white),
            //colorScheme: ColorScheme.light(),
            fontFamily: 'Georgia',
            floatingActionButtonTheme: FloatingActionButtonThemeData(
              backgroundColor: Colors.lightBlue,
            )),
      ),
    );
  }
}

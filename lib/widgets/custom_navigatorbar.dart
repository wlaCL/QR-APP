import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seccion9_qrscanner/providers/ui_provider.dart';

class CustomNavigatorBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final uiprovider = Provider.of<UiProvider>(context);
    final currentIndex = uiprovider.selectMenuOpt;
    return BottomNavigationBar(
        onTap: (int i) => {uiprovider.selectMenuOpt = i},
        currentIndex: currentIndex,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        unselectedItemColor: Colors.black,
        //selectedItemColor: Color(0xff2ADBC0),
        iconSize: 30.0,
        elevation: 0,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.map,
                //color: Colors.black,
              ),
              label: 'Mapa'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.compass_calibration,
                //color: Colors.black,
              ),
              label: 'Direcciones')
        ]);
  }
}

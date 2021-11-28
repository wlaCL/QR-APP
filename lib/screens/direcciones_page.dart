import 'package:flutter/material.dart';

import 'package:seccion9_qrscanner/widgets/scan_tiles.dart';

class DirectionsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScanTiles(tipo: 'http');
  }
}

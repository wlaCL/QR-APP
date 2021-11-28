import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seccion9_qrscanner/screens/scan_list_provier.dart';
import 'package:seccion9_qrscanner/utils/utils.dart';

class ScanTiles extends StatelessWidget {
  final String tipo;
  const ScanTiles({
    Key? key,
    required this.tipo,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final scanListProvider =
        Provider.of<ScanListProvider>(context, listen: true);
    dynamic scans = scanListProvider.scans;

    return ListView.builder(
        itemCount: scans.length,
        itemBuilder: (_, i) => Dismissible(
            key: UniqueKey(),
            background: Container(color: Colors.red),
            onDismissed: (DismissDirection direction) {
              Provider.of<ScanListProvider>(context, listen: false)
                  .borrarScanPorId(scans[i].id);
            },
            child: ListTile(
              leading: Icon(
                  this.tipo == 'http'
                      ? Icons.home_max_outlined
                      : Icons.map_outlined,
                  color: Theme.of(context).primaryColor),
              title: Text(scans[i].id.toString()),
              subtitle: Text("ID 1"),
              trailing:
                  Icon(Icons.keyboard_arrow_right_outlined, color: Colors.grey),
              onTap: () => launchURL(context, scans[i]),
            )));
  }
}

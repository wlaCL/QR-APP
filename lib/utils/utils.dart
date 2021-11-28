import 'package:flutter/cupertino.dart';
import 'package:seccion9_qrscanner/models/scan_model.dart';
import 'package:url_launcher/url_launcher.dart';

launchURL(BuildContext context, ScanModel scan) async {
  final url = scan.valor;

  if (scan.tipo == 'http') {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Cloud not launch $url';
    }
  } else {
    Navigator.pushNamed(context, 'mapa', arguments: scan);
  }
}

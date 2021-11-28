import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:seccion9_qrscanner/models/scan_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBProvider {
  static dynamic _database;
  static final DBProvider db = DBProvider._();
  DBProvider._();

  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await initDB();
    return _database;
  }

  Future<Database> initDB() async {
    //path de donde almacenaremos la base de datos

    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    print(documentsDirectory);
    final path = join(documentsDirectory.path, 'ScansDB.db');
    print(path);

    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute('''
      CREATE TABLE Scans(
        id INTEGER PRIMARY KEY, 
        tipo TEXT, 
        valor TEXT
      )
          ''');
    });
  }

  /*Future<int> nuevoScanRaw(ScanModel nuevoScan) async {
    final id = nuevoScan.id;
    final tipo = nuevoScan.tipo;
    final valor = nuevoScan.valor;

    //verifcar la base de datos
    final db = await database;

    final res = await db.rawInsert('''
      INSERT INTO Scans(id, tipo, valor)
      VALUES($id, '$tipo', '$valor')
    ''');

    return res;
  }*/

  Future<int> nuevoScan(ScanModel nuevoScan) async {
    final db = await database;
    final res = await db.insert('Scans', nuevoScan.toJson());

    //Es el ID del último registro insertado;
    print(res);
    return res;
  }

  Future getScanById(int id) async {
    final db = await database;
    //final res = await db.query('Scans', where: 'id = ? and otraCosa= ?', whereArgs: [id, laOtracosa]);
    final res = await db.query('Scans', where: 'id= ?', whereArgs: [id]);

    return res.isNotEmpty ? ScanModel.fromJson(res.first) : null;
  }

  Future<List<ScanModel>> getToodosLosScans() async {
    final db = await database;
    final res = await db.query('Scans');
    return res.isNotEmpty ? res.map((s) => ScanModel.fromJson(s)).toList() : [];
  }

  Future<List<ScanModel>> getScansPorTipo(String tipo) async {
    final db = await database;
    final res = await db.rawQuery('''
    SELECT * FROM Scans WHERE tipo = '$tipo'
    ''');

    return res.isNotEmpty ? res.map((s) => ScanModel.fromJson(s)).toList() : [];
  }

  Future<int> updateScan(ScanModel nuevoScan) async {
    final db = await database;
    final res = await db.update('Scans', nuevoScan.toJson(),
        where: 'id = ?', whereArgs: [nuevoScan.id]);
    return res;
  }

  Future<int> deteleScan(int id) async {
    final db = await database;
    final res = await db.delete('Scans', where: 'id = ? ', whereArgs: [id]);
    return res;
  }

  Future<int> deteleAllScan() async {
    final db = await database;
    final res = await db.rawDelete('''
    DELETE FROM Scans
    ''');
    return res;
  }
}

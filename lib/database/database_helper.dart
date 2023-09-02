import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:app_tx_cuentas/models/transactiones.dart';

class DatabaseHelper {
  static Database? _database; // Ahora declaramos _database como nullable

  DatabaseHelper() {
    initDatabase();
  }

  Future<void> initDatabase() async {
    final path = join(await getDatabasesPath(), 'transactions.db');
    _database = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        // Crea la tabla para las transacciones
        await db.execute('''
          CREATE TABLE transactions (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            importe TEXT,
            plataforma TEXT,
            fecha TEXT
          )
        ''');
      },
    );
  }

  Future<int> insertTransaction(Transactiones transaction) async {
    final db = _database;
    if (db != null) {
      return await db.insert('transactions', transaction.toMap());
    } else {
      throw Exception('La base de datos no ha sido inicializada.');
    }
  }

  Future<List<Transactiones>> getTransactions() async {
    final db = _database;
    if (db != null) {
      final List<Map<String, dynamic>> maps = await db.query('transactions');
      return List.generate(maps.length, (i) {
        return Transactiones.fromMap(maps[i]);
      });
    } else {
      throw Exception('La base de datos no ha sido inicializada.');
    }
  }

  // Implementa los métodos para actualizar y eliminar transacciones si es necesario

  Future<int> updateTransaction(Transactiones transaction) async {
    final db = _database;
    if (db != null) {
      return await db.update(
        'transactions',
        transaction.toMap(),
        where: 'id = ?', // Puedes usar una condición WHERE para actualizar un registro específico
        whereArgs: [transaction.id], // Reemplaza "transaction.id" con el ID de la transacción que deseas actualizar
      );
    } else {
      throw Exception('La base de datos no ha sido inicializada.');
    }
  }

  Future<int> deleteTransaction(int id) async {
    final db = _database;
    if (db != null) {
      return await db.delete(
        'transactions',
        where: 'id = ?', // Puedes usar una condición WHERE para eliminar un registro específico
        whereArgs: [id], // Reemplaza "id" con el ID de la transacción que deseas eliminar
      );
    } else {
      throw Exception('La base de datos no ha sido inicializada.');
    }
  }
}

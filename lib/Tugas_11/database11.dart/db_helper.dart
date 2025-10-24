import 'package:path/path.dart';
import 'package:ppkd_elizsabel/Tugas_11/model/User_Model.dart';
import 'package:ppkd_elizsabel/Tugas_11/model/customer_model.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  static const tableUser = 'users';
  static const tableCustomer = 'Customer';
  static Future<Database> db() async {
    final dbPath = await getDatabasesPath();
    return openDatabase(
      join(dbPath, 'GlowTap.db'),
      onCreate: (db, version) async {
        await db.execute(
          "CREATE TABLE $tableUser(id INTEGER PRIMARY KEY AUTOINCREMENT, username TEXT, email TEXT, password TEXT)",
        );
      },
      onUpgrade: (db, oldVersion, newVersion) async {
        if (oldVersion < newVersion) {
          await db.execute(
            "CREATE TABLE $tableCustomer(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, email TEXT, phone INT, city TEXT, password INT)",
          );
        }
      },

      version: 6,
    );
  }

  static Future<void> registerUser(UserModel user) async {
    final dbs = await db();
    //Insert adalah fungsi untuk menambahkan data (CREATE)
    await dbs.insert(
      tableUser,
      user.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    print(user.toMap());
  }

  static Future<UserModel?> loginUser({
    required String email,
    required String password,
  }) async {
    final dbs = await db();
    //query adalah fungsi untuk menampilkan data (READ)
    final List<Map<String, dynamic>> results = await dbs.query(
      tableUser,
      where: 'email = ? AND password = ?',
      whereArgs: [email, password],
    );
    if (results.isNotEmpty) {
      return UserModel.fromMap(results.first);
    }
    return null;
  }

  //MENAMBAHKAN CUSTOMER
  static Future<void> createCustomer(CustomerModel customer) async {
    final dbs = await db();
    //Insert adalah fungsi untuk menambahkan data (CREATE)
    await dbs.insert(
      tableCustomer,
      customer.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    print(customer.toMap());
  }

  //GET SISWA
  static Future<List<CustomerModel>> getAllCustomer() async {
    final dbs = await db();
    final List<Map<String, dynamic>> results = await dbs.query(tableCustomer);
    print(results.map((e) => CustomerModel.fromMap(e)).toList());
    return results.map((e) => CustomerModel.fromMap(e)).toList();
  }
}

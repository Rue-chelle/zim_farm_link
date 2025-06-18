import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/listing_model.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  static Database? _database;

  factory DatabaseHelper() => _instance;

  DatabaseHelper._internal();

  Future<Database> get database async {
    _database ??= await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'zimfarmlink.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE listings (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT,
        description TEXT,
        imagePath TEXT,
        price REAL,
        location TEXT,
        category TEXT,
        contact TEXT
      )
    ''');
  }

  // Insert a new listing
  Future<int> insertListing(Listing listing) async {
    final db = await database;
    return await db.insert('listings', listing.toMap());
  }

  // Get all listings
  Future<List<Listing>> getListings() async {
    final db = await database;
    final maps = await db.query('listings', orderBy: 'id DESC');

    return List.generate(maps.length, (i) => Listing.fromMap(maps[i]));
  }

  // Delete a listing by ID
  Future<int> deleteListing(int id) async {
    final db = await database;
    return await db.delete('listings', where: 'id = ?', whereArgs: [id]);
  }

  // Update a listing (optional)
  Future<int> updateListing(Listing listing) async {
    final db = await database;
    return await db.update(
      'listings',
      listing.toMap(),
      where: 'id = ?',
      whereArgs: [listing.id],
    );
  }
}

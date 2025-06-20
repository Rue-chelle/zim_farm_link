import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'listing_model.dart';
part 'local_db.g.dart';

@DriftDatabase(tables: [Listings])
class LocalDatabase extends _$LocalDatabase {
  LocalDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Future<int> insertListing(ListingsCompanion entry) =>
      into(listings).insert(entry);

  Future<List<Listing>> getAllListings() => select(listings).get();

  Future<void> deleteListing(int id) =>
      (delete(listings)..where((tbl) => tbl.id.equals(id))).go();
  Future<bool> updateListing(Listing listing) {
    return update(listings).replace(listing);
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dir = await getApplicationDocumentsDirectory();
    final dbPath = p.join(dir.path, 'zimfarmlink.db');
    return NativeDatabase(File(dbPath));
  });
}
// This code sets up a local database using Drift for managing listings in a marketplace application.
// It includes a Listings table with fields for title, description, image path, price, location

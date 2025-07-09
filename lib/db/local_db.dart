import 'package:sqflite/sqflite.dart' as sqflite;
import 'package:drift/drift.dart';
import 'package:drift/drift.dart' as drift;
import 'package:drift/native.dart'; // still required for desktop if needed
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'dart:io';

part 'local_db.g.dart';

// === Listings Table ===s
class Listings extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text()();
  TextColumn get description => text()();
  TextColumn get category => text()();
  RealColumn get price => real()();
  TextColumn get location => text()();
  BoolColumn get delivery => boolean().withDefault(const Constant(false))();
  TextColumn get imagePath => text()();
  TextColumn get contact => text()();
}

// === User Profile Table ===
class UserProfiles extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get fullName => text()();
  TextColumn get farmingType => text()();
  TextColumn get email => text().nullable()();
  TextColumn get phoneNumber => text().nullable()();
  TextColumn get location => text().nullable()();
  TextColumn get profileImage => text().nullable()();
}

// === Donations Table ===
class Donations extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text()();
  TextColumn get description => text()();
  TextColumn get category => text()();
  TextColumn get location => text()();
  TextColumn get contact => text()();
  TextColumn get donorName => text().nullable()();
  TextColumn get imagePath => text().nullable()();
  DateTimeColumn get dateAdded => dateTime().withDefault(currentDateAndTime)();
}

// === Database Class ===
@DriftDatabase(tables: [Listings, UserProfiles, Donations])
class LocalDatabase extends _$LocalDatabase {
  LocalDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  // === Listings ===
  Future<int> insertListing(ListingsCompanion entry) =>
      into(listings).insert(entry);

  Future<List<Listing>> getAllListings() => select(listings).get();

  Future<void> deleteListing(int id) =>
      (delete(listings)..where((tbl) => tbl.id.equals(id))).go();

  Future<bool> updateListing(Listing listing) =>
      update(listings).replace(listing);

  // === User Profiles ===
  Future<int> insertUserProfile(UserProfilesCompanion profile) =>
      into(userProfiles).insert(profile);

  Future<List<UserProfile>> getUserProfiles() => select(userProfiles).get();

  Future<void> deleteProfile(int id) =>
      (delete(userProfiles)..where((tbl) => tbl.id.equals(id))).go();

  Future<void> updateUserProfile(UserProfile profile) async {
    await (update(userProfiles)..where((tbl) => tbl.id.equals(profile.id)))
        .write(
      UserProfilesCompanion(
        fullName: Value(profile.fullName),
        phoneNumber: Value(profile.phoneNumber),
        email: Value(profile.email),
        location: Value(profile.location),
        farmingType: Value(profile.farmingType),
        profileImage: Value(profile.profileImage),
      ),
    );
  }

  // === Donations ===
  Future<int> insertDonation(DonationsCompanion entry) =>
      into(donations).insert(entry);

  Future<List<Donation>> getAllDonations() => select(donations).get();

  Future<void> deleteDonation(int id) =>
      (delete(donations)..where((tbl) => tbl.id.equals(id))).go();
}

// === Drift SQLite Web/Mobile Setup ===
LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dir = await getApplicationDocumentsDirectory();
    final path = p.join(dir.path, 'zimfarmlink.db');
    return NativeDatabase(File(path));
  });
}

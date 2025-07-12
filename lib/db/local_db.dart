import 'dart:io' show File; // okay to use with kIsWeb checks
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
// ignore: deprecated_member_use
import 'package:drift/web.dart'; // ✅ correct for web
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'local_db.g.dart';

// === Listings Table ===
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
  TextColumn get deliveryStatus =>
      text().withDefault(const Constant('Pending'))();
}

// === User Profiles Table ===
class UserProfiles extends Table {
  TextColumn get role =>
      text().withDefault(const Constant('user'))(); // user | ngo | admin
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

  Future<void> updateDeliveryStatus(int listingId, String newStatus) async {
    await (update(listings)..where((tbl) => tbl.id.equals(listingId)))
        .write(ListingsCompanion(deliveryStatus: Value(newStatus)));
  }

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

  Future<UserProfile?> getCurrentUser() async {
    final users = await select(userProfiles).get();
    return users.isNotEmpty ? users.first : null;
  }

  // === Donations ===
  Future<int> insertDonation(DonationsCompanion entry) =>
      into(donations).insert(entry);

  Future<List<Donation>> getAllDonations() => select(donations).get();

  Future<void> deleteDonation(int id) =>
      (delete(donations)..where((tbl) => tbl.id.equals(id))).go();
}

// === Lazy Database Setup for Web & Mobile ===
QueryExecutor _openConnection() {
  if (kIsWeb) {
    return WebDatabase('zimfarmlink_web_db');
  } else {
    return LazyDatabase(() async {
      final dir = await getApplicationDocumentsDirectory();
      final dbPath = p.join(dir.path, 'zimfarmlink.db');
      return NativeDatabase(File(dbPath));
    });
  }
}

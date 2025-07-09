// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_db.dart';

// ignore_for_file: type=lint
class $ListingsTable extends Listings
    with drift.TableInfo<$ListingsTable, Listing> {
  @override
  final drift.GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ListingsTable(this.attachedDatabase, [this._alias]);
  static const drift.VerificationMeta _idMeta =
      const drift.VerificationMeta('id');
  @override
  late final drift.GeneratedColumn<int> id = drift.GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const drift.VerificationMeta _titleMeta =
      const drift.VerificationMeta('title');
  @override
  late final drift.GeneratedColumn<String> title =
      drift.GeneratedColumn<String>('title', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const drift.VerificationMeta _descriptionMeta =
      const drift.VerificationMeta('description');
  @override
  late final drift.GeneratedColumn<String> description =
      drift.GeneratedColumn<String>('description', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const drift.VerificationMeta _categoryMeta =
      const drift.VerificationMeta('category');
  @override
  late final drift.GeneratedColumn<String> category =
      drift.GeneratedColumn<String>('category', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const drift.VerificationMeta _priceMeta =
      const drift.VerificationMeta('price');
  @override
  late final drift.GeneratedColumn<double> price =
      drift.GeneratedColumn<double>('price', aliasedName, false,
          type: DriftSqlType.double, requiredDuringInsert: true);
  static const drift.VerificationMeta _locationMeta =
      const drift.VerificationMeta('location');
  @override
  late final drift.GeneratedColumn<String> location =
      drift.GeneratedColumn<String>('location', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const drift.VerificationMeta _deliveryMeta =
      const drift.VerificationMeta('delivery');
  @override
  late final drift.GeneratedColumn<bool> delivery = drift.GeneratedColumn<bool>(
      'delivery', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("delivery" IN (0, 1))'),
      defaultValue: const drift.Constant(false));
  static const drift.VerificationMeta _imagePathMeta =
      const drift.VerificationMeta('imagePath');
  @override
  late final drift.GeneratedColumn<String> imagePath =
      drift.GeneratedColumn<String>('image_path', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const drift.VerificationMeta _contactMeta =
      const drift.VerificationMeta('contact');
  @override
  late final drift.GeneratedColumn<String> contact =
      drift.GeneratedColumn<String>('contact', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<drift.GeneratedColumn> get $columns => [
        id,
        title,
        description,
        category,
        price,
        location,
        delivery,
        imagePath,
        contact
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'listings';
  @override
  drift.VerificationContext validateIntegrity(
      drift.Insertable<Listing> instance,
      {bool isInserting = false}) {
    final context = drift.VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('category')) {
      context.handle(_categoryMeta,
          category.isAcceptableOrUnknown(data['category']!, _categoryMeta));
    } else if (isInserting) {
      context.missing(_categoryMeta);
    }
    if (data.containsKey('price')) {
      context.handle(
          _priceMeta, price.isAcceptableOrUnknown(data['price']!, _priceMeta));
    } else if (isInserting) {
      context.missing(_priceMeta);
    }
    if (data.containsKey('location')) {
      context.handle(_locationMeta,
          location.isAcceptableOrUnknown(data['location']!, _locationMeta));
    } else if (isInserting) {
      context.missing(_locationMeta);
    }
    if (data.containsKey('delivery')) {
      context.handle(_deliveryMeta,
          delivery.isAcceptableOrUnknown(data['delivery']!, _deliveryMeta));
    }
    if (data.containsKey('image_path')) {
      context.handle(_imagePathMeta,
          imagePath.isAcceptableOrUnknown(data['image_path']!, _imagePathMeta));
    } else if (isInserting) {
      context.missing(_imagePathMeta);
    }
    if (data.containsKey('contact')) {
      context.handle(_contactMeta,
          contact.isAcceptableOrUnknown(data['contact']!, _contactMeta));
    } else if (isInserting) {
      context.missing(_contactMeta);
    }
    return context;
  }

  @override
  Set<drift.GeneratedColumn> get $primaryKey => {id};
  @override
  Listing map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Listing(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
      category: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}category'])!,
      price: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}price'])!,
      location: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}location'])!,
      delivery: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}delivery'])!,
      imagePath: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}image_path'])!,
      contact: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}contact'])!,
    );
  }

  @override
  $ListingsTable createAlias(String alias) {
    return $ListingsTable(attachedDatabase, alias);
  }
}

class Listing extends drift.DataClass implements drift.Insertable<Listing> {
  final int id;
  final String title;
  final String description;
  final String category;
  final double price;
  final String location;
  final bool delivery;
  final String imagePath;
  final String contact;
  const Listing(
      {required this.id,
      required this.title,
      required this.description,
      required this.category,
      required this.price,
      required this.location,
      required this.delivery,
      required this.imagePath,
      required this.contact});
  @override
  Map<String, drift.Expression> toColumns(bool nullToAbsent) {
    final map = <String, drift.Expression>{};
    map['id'] = drift.Variable<int>(id);
    map['title'] = drift.Variable<String>(title);
    map['description'] = drift.Variable<String>(description);
    map['category'] = drift.Variable<String>(category);
    map['price'] = drift.Variable<double>(price);
    map['location'] = drift.Variable<String>(location);
    map['delivery'] = drift.Variable<bool>(delivery);
    map['image_path'] = drift.Variable<String>(imagePath);
    map['contact'] = drift.Variable<String>(contact);
    return map;
  }

  ListingsCompanion toCompanion(bool nullToAbsent) {
    return ListingsCompanion(
      id: drift.Value(id),
      title: drift.Value(title),
      description: drift.Value(description),
      category: drift.Value(category),
      price: drift.Value(price),
      location: drift.Value(location),
      delivery: drift.Value(delivery),
      imagePath: drift.Value(imagePath),
      contact: drift.Value(contact),
    );
  }

  factory Listing.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= drift.driftRuntimeOptions.defaultSerializer;
    return Listing(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      description: serializer.fromJson<String>(json['description']),
      category: serializer.fromJson<String>(json['category']),
      price: serializer.fromJson<double>(json['price']),
      location: serializer.fromJson<String>(json['location']),
      delivery: serializer.fromJson<bool>(json['delivery']),
      imagePath: serializer.fromJson<String>(json['imagePath']),
      contact: serializer.fromJson<String>(json['contact']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= drift.driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'description': serializer.toJson<String>(description),
      'category': serializer.toJson<String>(category),
      'price': serializer.toJson<double>(price),
      'location': serializer.toJson<String>(location),
      'delivery': serializer.toJson<bool>(delivery),
      'imagePath': serializer.toJson<String>(imagePath),
      'contact': serializer.toJson<String>(contact),
    };
  }

  Listing copyWith(
          {int? id,
          String? title,
          String? description,
          String? category,
          double? price,
          String? location,
          bool? delivery,
          String? imagePath,
          String? contact}) =>
      Listing(
        id: id ?? this.id,
        title: title ?? this.title,
        description: description ?? this.description,
        category: category ?? this.category,
        price: price ?? this.price,
        location: location ?? this.location,
        delivery: delivery ?? this.delivery,
        imagePath: imagePath ?? this.imagePath,
        contact: contact ?? this.contact,
      );
  Listing copyWithCompanion(ListingsCompanion data) {
    return Listing(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      description:
          data.description.present ? data.description.value : this.description,
      category: data.category.present ? data.category.value : this.category,
      price: data.price.present ? data.price.value : this.price,
      location: data.location.present ? data.location.value : this.location,
      delivery: data.delivery.present ? data.delivery.value : this.delivery,
      imagePath: data.imagePath.present ? data.imagePath.value : this.imagePath,
      contact: data.contact.present ? data.contact.value : this.contact,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Listing(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('category: $category, ')
          ..write('price: $price, ')
          ..write('location: $location, ')
          ..write('delivery: $delivery, ')
          ..write('imagePath: $imagePath, ')
          ..write('contact: $contact')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title, description, category, price,
      location, delivery, imagePath, contact);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Listing &&
          other.id == this.id &&
          other.title == this.title &&
          other.description == this.description &&
          other.category == this.category &&
          other.price == this.price &&
          other.location == this.location &&
          other.delivery == this.delivery &&
          other.imagePath == this.imagePath &&
          other.contact == this.contact);
}

class ListingsCompanion extends drift.UpdateCompanion<Listing> {
  final drift.Value<int> id;
  final drift.Value<String> title;
  final drift.Value<String> description;
  final drift.Value<String> category;
  final drift.Value<double> price;
  final drift.Value<String> location;
  final drift.Value<bool> delivery;
  final drift.Value<String> imagePath;
  final drift.Value<String> contact;
  const ListingsCompanion({
    this.id = const drift.Value.absent(),
    this.title = const drift.Value.absent(),
    this.description = const drift.Value.absent(),
    this.category = const drift.Value.absent(),
    this.price = const drift.Value.absent(),
    this.location = const drift.Value.absent(),
    this.delivery = const drift.Value.absent(),
    this.imagePath = const drift.Value.absent(),
    this.contact = const drift.Value.absent(),
  });
  ListingsCompanion.insert({
    this.id = const drift.Value.absent(),
    required String title,
    required String description,
    required String category,
    required double price,
    required String location,
    this.delivery = const drift.Value.absent(),
    required String imagePath,
    required String contact,
  })  : title = drift.Value(title),
        description = drift.Value(description),
        category = drift.Value(category),
        price = drift.Value(price),
        location = drift.Value(location),
        imagePath = drift.Value(imagePath),
        contact = drift.Value(contact);
  static drift.Insertable<Listing> custom({
    drift.Expression<int>? id,
    drift.Expression<String>? title,
    drift.Expression<String>? description,
    drift.Expression<String>? category,
    drift.Expression<double>? price,
    drift.Expression<String>? location,
    drift.Expression<bool>? delivery,
    drift.Expression<String>? imagePath,
    drift.Expression<String>? contact,
  }) {
    return drift.RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (category != null) 'category': category,
      if (price != null) 'price': price,
      if (location != null) 'location': location,
      if (delivery != null) 'delivery': delivery,
      if (imagePath != null) 'image_path': imagePath,
      if (contact != null) 'contact': contact,
    });
  }

  ListingsCompanion copyWith(
      {drift.Value<int>? id,
      drift.Value<String>? title,
      drift.Value<String>? description,
      drift.Value<String>? category,
      drift.Value<double>? price,
      drift.Value<String>? location,
      drift.Value<bool>? delivery,
      drift.Value<String>? imagePath,
      drift.Value<String>? contact}) {
    return ListingsCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      category: category ?? this.category,
      price: price ?? this.price,
      location: location ?? this.location,
      delivery: delivery ?? this.delivery,
      imagePath: imagePath ?? this.imagePath,
      contact: contact ?? this.contact,
    );
  }

  @override
  Map<String, drift.Expression> toColumns(bool nullToAbsent) {
    final map = <String, drift.Expression>{};
    if (id.present) {
      map['id'] = drift.Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = drift.Variable<String>(title.value);
    }
    if (description.present) {
      map['description'] = drift.Variable<String>(description.value);
    }
    if (category.present) {
      map['category'] = drift.Variable<String>(category.value);
    }
    if (price.present) {
      map['price'] = drift.Variable<double>(price.value);
    }
    if (location.present) {
      map['location'] = drift.Variable<String>(location.value);
    }
    if (delivery.present) {
      map['delivery'] = drift.Variable<bool>(delivery.value);
    }
    if (imagePath.present) {
      map['image_path'] = drift.Variable<String>(imagePath.value);
    }
    if (contact.present) {
      map['contact'] = drift.Variable<String>(contact.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ListingsCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('category: $category, ')
          ..write('price: $price, ')
          ..write('location: $location, ')
          ..write('delivery: $delivery, ')
          ..write('imagePath: $imagePath, ')
          ..write('contact: $contact')
          ..write(')'))
        .toString();
  }
}

class $UserProfilesTable extends UserProfiles
    with drift.TableInfo<$UserProfilesTable, UserProfile> {
  @override
  final drift.GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UserProfilesTable(this.attachedDatabase, [this._alias]);
  static const drift.VerificationMeta _idMeta =
      const drift.VerificationMeta('id');
  @override
  late final drift.GeneratedColumn<int> id = drift.GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const drift.VerificationMeta _fullNameMeta =
      const drift.VerificationMeta('fullName');
  @override
  late final drift.GeneratedColumn<String> fullName =
      drift.GeneratedColumn<String>('full_name', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const drift.VerificationMeta _farmingTypeMeta =
      const drift.VerificationMeta('farmingType');
  @override
  late final drift.GeneratedColumn<String> farmingType =
      drift.GeneratedColumn<String>('farming_type', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const drift.VerificationMeta _emailMeta =
      const drift.VerificationMeta('email');
  @override
  late final drift.GeneratedColumn<String> email =
      drift.GeneratedColumn<String>('email', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const drift.VerificationMeta _phoneNumberMeta =
      const drift.VerificationMeta('phoneNumber');
  @override
  late final drift.GeneratedColumn<String> phoneNumber =
      drift.GeneratedColumn<String>('phone_number', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const drift.VerificationMeta _locationMeta =
      const drift.VerificationMeta('location');
  @override
  late final drift.GeneratedColumn<String> location =
      drift.GeneratedColumn<String>('location', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const drift.VerificationMeta _profileImageMeta =
      const drift.VerificationMeta('profileImage');
  @override
  late final drift.GeneratedColumn<String> profileImage =
      drift.GeneratedColumn<String>('profile_image', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<drift.GeneratedColumn> get $columns =>
      [id, fullName, farmingType, email, phoneNumber, location, profileImage];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'user_profiles';
  @override
  drift.VerificationContext validateIntegrity(
      drift.Insertable<UserProfile> instance,
      {bool isInserting = false}) {
    final context = drift.VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('full_name')) {
      context.handle(_fullNameMeta,
          fullName.isAcceptableOrUnknown(data['full_name']!, _fullNameMeta));
    } else if (isInserting) {
      context.missing(_fullNameMeta);
    }
    if (data.containsKey('farming_type')) {
      context.handle(
          _farmingTypeMeta,
          farmingType.isAcceptableOrUnknown(
              data['farming_type']!, _farmingTypeMeta));
    } else if (isInserting) {
      context.missing(_farmingTypeMeta);
    }
    if (data.containsKey('email')) {
      context.handle(
          _emailMeta, email.isAcceptableOrUnknown(data['email']!, _emailMeta));
    }
    if (data.containsKey('phone_number')) {
      context.handle(
          _phoneNumberMeta,
          phoneNumber.isAcceptableOrUnknown(
              data['phone_number']!, _phoneNumberMeta));
    }
    if (data.containsKey('location')) {
      context.handle(_locationMeta,
          location.isAcceptableOrUnknown(data['location']!, _locationMeta));
    }
    if (data.containsKey('profile_image')) {
      context.handle(
          _profileImageMeta,
          profileImage.isAcceptableOrUnknown(
              data['profile_image']!, _profileImageMeta));
    }
    return context;
  }

  @override
  Set<drift.GeneratedColumn> get $primaryKey => {id};
  @override
  UserProfile map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserProfile(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      fullName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}full_name'])!,
      farmingType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}farming_type'])!,
      email: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}email']),
      phoneNumber: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}phone_number']),
      location: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}location']),
      profileImage: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}profile_image']),
    );
  }

  @override
  $UserProfilesTable createAlias(String alias) {
    return $UserProfilesTable(attachedDatabase, alias);
  }
}

class UserProfile extends drift.DataClass
    implements drift.Insertable<UserProfile> {
  final int id;
  final String fullName;
  final String farmingType;
  final String? email;
  final String? phoneNumber;
  final String? location;
  final String? profileImage;
  const UserProfile(
      {required this.id,
      required this.fullName,
      required this.farmingType,
      this.email,
      this.phoneNumber,
      this.location,
      this.profileImage});
  @override
  Map<String, drift.Expression> toColumns(bool nullToAbsent) {
    final map = <String, drift.Expression>{};
    map['id'] = drift.Variable<int>(id);
    map['full_name'] = drift.Variable<String>(fullName);
    map['farming_type'] = drift.Variable<String>(farmingType);
    if (!nullToAbsent || email != null) {
      map['email'] = drift.Variable<String>(email);
    }
    if (!nullToAbsent || phoneNumber != null) {
      map['phone_number'] = drift.Variable<String>(phoneNumber);
    }
    if (!nullToAbsent || location != null) {
      map['location'] = drift.Variable<String>(location);
    }
    if (!nullToAbsent || profileImage != null) {
      map['profile_image'] = drift.Variable<String>(profileImage);
    }
    return map;
  }

  UserProfilesCompanion toCompanion(bool nullToAbsent) {
    return UserProfilesCompanion(
      id: drift.Value(id),
      fullName: drift.Value(fullName),
      farmingType: drift.Value(farmingType),
      email: email == null && nullToAbsent
          ? const drift.Value.absent()
          : drift.Value(email),
      phoneNumber: phoneNumber == null && nullToAbsent
          ? const drift.Value.absent()
          : drift.Value(phoneNumber),
      location: location == null && nullToAbsent
          ? const drift.Value.absent()
          : drift.Value(location),
      profileImage: profileImage == null && nullToAbsent
          ? const drift.Value.absent()
          : drift.Value(profileImage),
    );
  }

  factory UserProfile.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= drift.driftRuntimeOptions.defaultSerializer;
    return UserProfile(
      id: serializer.fromJson<int>(json['id']),
      fullName: serializer.fromJson<String>(json['fullName']),
      farmingType: serializer.fromJson<String>(json['farmingType']),
      email: serializer.fromJson<String?>(json['email']),
      phoneNumber: serializer.fromJson<String?>(json['phoneNumber']),
      location: serializer.fromJson<String?>(json['location']),
      profileImage: serializer.fromJson<String?>(json['profileImage']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= drift.driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'fullName': serializer.toJson<String>(fullName),
      'farmingType': serializer.toJson<String>(farmingType),
      'email': serializer.toJson<String?>(email),
      'phoneNumber': serializer.toJson<String?>(phoneNumber),
      'location': serializer.toJson<String?>(location),
      'profileImage': serializer.toJson<String?>(profileImage),
    };
  }

  UserProfile copyWith(
          {int? id,
          String? fullName,
          String? farmingType,
          drift.Value<String?> email = const drift.Value.absent(),
          drift.Value<String?> phoneNumber = const drift.Value.absent(),
          drift.Value<String?> location = const drift.Value.absent(),
          drift.Value<String?> profileImage = const drift.Value.absent()}) =>
      UserProfile(
        id: id ?? this.id,
        fullName: fullName ?? this.fullName,
        farmingType: farmingType ?? this.farmingType,
        email: email.present ? email.value : this.email,
        phoneNumber: phoneNumber.present ? phoneNumber.value : this.phoneNumber,
        location: location.present ? location.value : this.location,
        profileImage:
            profileImage.present ? profileImage.value : this.profileImage,
      );
  UserProfile copyWithCompanion(UserProfilesCompanion data) {
    return UserProfile(
      id: data.id.present ? data.id.value : this.id,
      fullName: data.fullName.present ? data.fullName.value : this.fullName,
      farmingType:
          data.farmingType.present ? data.farmingType.value : this.farmingType,
      email: data.email.present ? data.email.value : this.email,
      phoneNumber:
          data.phoneNumber.present ? data.phoneNumber.value : this.phoneNumber,
      location: data.location.present ? data.location.value : this.location,
      profileImage: data.profileImage.present
          ? data.profileImage.value
          : this.profileImage,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UserProfile(')
          ..write('id: $id, ')
          ..write('fullName: $fullName, ')
          ..write('farmingType: $farmingType, ')
          ..write('email: $email, ')
          ..write('phoneNumber: $phoneNumber, ')
          ..write('location: $location, ')
          ..write('profileImage: $profileImage')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, fullName, farmingType, email, phoneNumber, location, profileImage);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserProfile &&
          other.id == this.id &&
          other.fullName == this.fullName &&
          other.farmingType == this.farmingType &&
          other.email == this.email &&
          other.phoneNumber == this.phoneNumber &&
          other.location == this.location &&
          other.profileImage == this.profileImage);
}

class UserProfilesCompanion extends drift.UpdateCompanion<UserProfile> {
  final drift.Value<int> id;
  final drift.Value<String> fullName;
  final drift.Value<String> farmingType;
  final drift.Value<String?> email;
  final drift.Value<String?> phoneNumber;
  final drift.Value<String?> location;
  final drift.Value<String?> profileImage;
  const UserProfilesCompanion({
    this.id = const drift.Value.absent(),
    this.fullName = const drift.Value.absent(),
    this.farmingType = const drift.Value.absent(),
    this.email = const drift.Value.absent(),
    this.phoneNumber = const drift.Value.absent(),
    this.location = const drift.Value.absent(),
    this.profileImage = const drift.Value.absent(),
  });
  UserProfilesCompanion.insert({
    this.id = const drift.Value.absent(),
    required String fullName,
    required String farmingType,
    this.email = const drift.Value.absent(),
    this.phoneNumber = const drift.Value.absent(),
    this.location = const drift.Value.absent(),
    this.profileImage = const drift.Value.absent(),
  })  : fullName = drift.Value(fullName),
        farmingType = drift.Value(farmingType);
  static drift.Insertable<UserProfile> custom({
    drift.Expression<int>? id,
    drift.Expression<String>? fullName,
    drift.Expression<String>? farmingType,
    drift.Expression<String>? email,
    drift.Expression<String>? phoneNumber,
    drift.Expression<String>? location,
    drift.Expression<String>? profileImage,
  }) {
    return drift.RawValuesInsertable({
      if (id != null) 'id': id,
      if (fullName != null) 'full_name': fullName,
      if (farmingType != null) 'farming_type': farmingType,
      if (email != null) 'email': email,
      if (phoneNumber != null) 'phone_number': phoneNumber,
      if (location != null) 'location': location,
      if (profileImage != null) 'profile_image': profileImage,
    });
  }

  UserProfilesCompanion copyWith(
      {drift.Value<int>? id,
      drift.Value<String>? fullName,
      drift.Value<String>? farmingType,
      drift.Value<String?>? email,
      drift.Value<String?>? phoneNumber,
      drift.Value<String?>? location,
      drift.Value<String?>? profileImage}) {
    return UserProfilesCompanion(
      id: id ?? this.id,
      fullName: fullName ?? this.fullName,
      farmingType: farmingType ?? this.farmingType,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      location: location ?? this.location,
      profileImage: profileImage ?? this.profileImage,
    );
  }

  @override
  Map<String, drift.Expression> toColumns(bool nullToAbsent) {
    final map = <String, drift.Expression>{};
    if (id.present) {
      map['id'] = drift.Variable<int>(id.value);
    }
    if (fullName.present) {
      map['full_name'] = drift.Variable<String>(fullName.value);
    }
    if (farmingType.present) {
      map['farming_type'] = drift.Variable<String>(farmingType.value);
    }
    if (email.present) {
      map['email'] = drift.Variable<String>(email.value);
    }
    if (phoneNumber.present) {
      map['phone_number'] = drift.Variable<String>(phoneNumber.value);
    }
    if (location.present) {
      map['location'] = drift.Variable<String>(location.value);
    }
    if (profileImage.present) {
      map['profile_image'] = drift.Variable<String>(profileImage.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserProfilesCompanion(')
          ..write('id: $id, ')
          ..write('fullName: $fullName, ')
          ..write('farmingType: $farmingType, ')
          ..write('email: $email, ')
          ..write('phoneNumber: $phoneNumber, ')
          ..write('location: $location, ')
          ..write('profileImage: $profileImage')
          ..write(')'))
        .toString();
  }
}

class $DonationsTable extends Donations
    with drift.TableInfo<$DonationsTable, Donation> {
  @override
  final drift.GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DonationsTable(this.attachedDatabase, [this._alias]);
  static const drift.VerificationMeta _idMeta =
      const drift.VerificationMeta('id');
  @override
  late final drift.GeneratedColumn<int> id = drift.GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const drift.VerificationMeta _titleMeta =
      const drift.VerificationMeta('title');
  @override
  late final drift.GeneratedColumn<String> title =
      drift.GeneratedColumn<String>('title', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const drift.VerificationMeta _descriptionMeta =
      const drift.VerificationMeta('description');
  @override
  late final drift.GeneratedColumn<String> description =
      drift.GeneratedColumn<String>('description', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const drift.VerificationMeta _categoryMeta =
      const drift.VerificationMeta('category');
  @override
  late final drift.GeneratedColumn<String> category =
      drift.GeneratedColumn<String>('category', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const drift.VerificationMeta _locationMeta =
      const drift.VerificationMeta('location');
  @override
  late final drift.GeneratedColumn<String> location =
      drift.GeneratedColumn<String>('location', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const drift.VerificationMeta _contactMeta =
      const drift.VerificationMeta('contact');
  @override
  late final drift.GeneratedColumn<String> contact =
      drift.GeneratedColumn<String>('contact', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const drift.VerificationMeta _donorNameMeta =
      const drift.VerificationMeta('donorName');
  @override
  late final drift.GeneratedColumn<String> donorName =
      drift.GeneratedColumn<String>('donor_name', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const drift.VerificationMeta _imagePathMeta =
      const drift.VerificationMeta('imagePath');
  @override
  late final drift.GeneratedColumn<String> imagePath =
      drift.GeneratedColumn<String>('image_path', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const drift.VerificationMeta _dateAddedMeta =
      const drift.VerificationMeta('dateAdded');
  @override
  late final drift.GeneratedColumn<DateTime> dateAdded =
      drift.GeneratedColumn<DateTime>('date_added', aliasedName, false,
          type: DriftSqlType.dateTime,
          requiredDuringInsert: false,
          defaultValue: drift.currentDateAndTime);
  @override
  List<drift.GeneratedColumn> get $columns => [
        id,
        title,
        description,
        category,
        location,
        contact,
        donorName,
        imagePath,
        dateAdded
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'donations';
  @override
  drift.VerificationContext validateIntegrity(
      drift.Insertable<Donation> instance,
      {bool isInserting = false}) {
    final context = drift.VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('category')) {
      context.handle(_categoryMeta,
          category.isAcceptableOrUnknown(data['category']!, _categoryMeta));
    } else if (isInserting) {
      context.missing(_categoryMeta);
    }
    if (data.containsKey('location')) {
      context.handle(_locationMeta,
          location.isAcceptableOrUnknown(data['location']!, _locationMeta));
    } else if (isInserting) {
      context.missing(_locationMeta);
    }
    if (data.containsKey('contact')) {
      context.handle(_contactMeta,
          contact.isAcceptableOrUnknown(data['contact']!, _contactMeta));
    } else if (isInserting) {
      context.missing(_contactMeta);
    }
    if (data.containsKey('donor_name')) {
      context.handle(_donorNameMeta,
          donorName.isAcceptableOrUnknown(data['donor_name']!, _donorNameMeta));
    }
    if (data.containsKey('image_path')) {
      context.handle(_imagePathMeta,
          imagePath.isAcceptableOrUnknown(data['image_path']!, _imagePathMeta));
    }
    if (data.containsKey('date_added')) {
      context.handle(_dateAddedMeta,
          dateAdded.isAcceptableOrUnknown(data['date_added']!, _dateAddedMeta));
    }
    return context;
  }

  @override
  Set<drift.GeneratedColumn> get $primaryKey => {id};
  @override
  Donation map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Donation(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
      category: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}category'])!,
      location: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}location'])!,
      contact: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}contact'])!,
      donorName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}donor_name']),
      imagePath: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}image_path']),
      dateAdded: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date_added'])!,
    );
  }

  @override
  $DonationsTable createAlias(String alias) {
    return $DonationsTable(attachedDatabase, alias);
  }
}

class Donation extends drift.DataClass implements drift.Insertable<Donation> {
  final int id;
  final String title;
  final String description;
  final String category;
  final String location;
  final String contact;
  final String? donorName;
  final String? imagePath;
  final DateTime dateAdded;
  const Donation(
      {required this.id,
      required this.title,
      required this.description,
      required this.category,
      required this.location,
      required this.contact,
      this.donorName,
      this.imagePath,
      required this.dateAdded});
  @override
  Map<String, drift.Expression> toColumns(bool nullToAbsent) {
    final map = <String, drift.Expression>{};
    map['id'] = drift.Variable<int>(id);
    map['title'] = drift.Variable<String>(title);
    map['description'] = drift.Variable<String>(description);
    map['category'] = drift.Variable<String>(category);
    map['location'] = drift.Variable<String>(location);
    map['contact'] = drift.Variable<String>(contact);
    if (!nullToAbsent || donorName != null) {
      map['donor_name'] = drift.Variable<String>(donorName);
    }
    if (!nullToAbsent || imagePath != null) {
      map['image_path'] = drift.Variable<String>(imagePath);
    }
    map['date_added'] = drift.Variable<DateTime>(dateAdded);
    return map;
  }

  DonationsCompanion toCompanion(bool nullToAbsent) {
    return DonationsCompanion(
      id: drift.Value(id),
      title: drift.Value(title),
      description: drift.Value(description),
      category: drift.Value(category),
      location: drift.Value(location),
      contact: drift.Value(contact),
      donorName: donorName == null && nullToAbsent
          ? const drift.Value.absent()
          : drift.Value(donorName),
      imagePath: imagePath == null && nullToAbsent
          ? const drift.Value.absent()
          : drift.Value(imagePath),
      dateAdded: drift.Value(dateAdded),
    );
  }

  factory Donation.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= drift.driftRuntimeOptions.defaultSerializer;
    return Donation(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      description: serializer.fromJson<String>(json['description']),
      category: serializer.fromJson<String>(json['category']),
      location: serializer.fromJson<String>(json['location']),
      contact: serializer.fromJson<String>(json['contact']),
      donorName: serializer.fromJson<String?>(json['donorName']),
      imagePath: serializer.fromJson<String?>(json['imagePath']),
      dateAdded: serializer.fromJson<DateTime>(json['dateAdded']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= drift.driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'description': serializer.toJson<String>(description),
      'category': serializer.toJson<String>(category),
      'location': serializer.toJson<String>(location),
      'contact': serializer.toJson<String>(contact),
      'donorName': serializer.toJson<String?>(donorName),
      'imagePath': serializer.toJson<String?>(imagePath),
      'dateAdded': serializer.toJson<DateTime>(dateAdded),
    };
  }

  Donation copyWith(
          {int? id,
          String? title,
          String? description,
          String? category,
          String? location,
          String? contact,
          drift.Value<String?> donorName = const drift.Value.absent(),
          drift.Value<String?> imagePath = const drift.Value.absent(),
          DateTime? dateAdded}) =>
      Donation(
        id: id ?? this.id,
        title: title ?? this.title,
        description: description ?? this.description,
        category: category ?? this.category,
        location: location ?? this.location,
        contact: contact ?? this.contact,
        donorName: donorName.present ? donorName.value : this.donorName,
        imagePath: imagePath.present ? imagePath.value : this.imagePath,
        dateAdded: dateAdded ?? this.dateAdded,
      );
  Donation copyWithCompanion(DonationsCompanion data) {
    return Donation(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      description:
          data.description.present ? data.description.value : this.description,
      category: data.category.present ? data.category.value : this.category,
      location: data.location.present ? data.location.value : this.location,
      contact: data.contact.present ? data.contact.value : this.contact,
      donorName: data.donorName.present ? data.donorName.value : this.donorName,
      imagePath: data.imagePath.present ? data.imagePath.value : this.imagePath,
      dateAdded: data.dateAdded.present ? data.dateAdded.value : this.dateAdded,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Donation(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('category: $category, ')
          ..write('location: $location, ')
          ..write('contact: $contact, ')
          ..write('donorName: $donorName, ')
          ..write('imagePath: $imagePath, ')
          ..write('dateAdded: $dateAdded')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title, description, category, location,
      contact, donorName, imagePath, dateAdded);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Donation &&
          other.id == this.id &&
          other.title == this.title &&
          other.description == this.description &&
          other.category == this.category &&
          other.location == this.location &&
          other.contact == this.contact &&
          other.donorName == this.donorName &&
          other.imagePath == this.imagePath &&
          other.dateAdded == this.dateAdded);
}

class DonationsCompanion extends drift.UpdateCompanion<Donation> {
  final drift.Value<int> id;
  final drift.Value<String> title;
  final drift.Value<String> description;
  final drift.Value<String> category;
  final drift.Value<String> location;
  final drift.Value<String> contact;
  final drift.Value<String?> donorName;
  final drift.Value<String?> imagePath;
  final drift.Value<DateTime> dateAdded;
  const DonationsCompanion({
    this.id = const drift.Value.absent(),
    this.title = const drift.Value.absent(),
    this.description = const drift.Value.absent(),
    this.category = const drift.Value.absent(),
    this.location = const drift.Value.absent(),
    this.contact = const drift.Value.absent(),
    this.donorName = const drift.Value.absent(),
    this.imagePath = const drift.Value.absent(),
    this.dateAdded = const drift.Value.absent(),
  });
  DonationsCompanion.insert({
    this.id = const drift.Value.absent(),
    required String title,
    required String description,
    required String category,
    required String location,
    required String contact,
    this.donorName = const drift.Value.absent(),
    this.imagePath = const drift.Value.absent(),
    this.dateAdded = const drift.Value.absent(),
  })  : title = drift.Value(title),
        description = drift.Value(description),
        category = drift.Value(category),
        location = drift.Value(location),
        contact = drift.Value(contact);
  static drift.Insertable<Donation> custom({
    drift.Expression<int>? id,
    drift.Expression<String>? title,
    drift.Expression<String>? description,
    drift.Expression<String>? category,
    drift.Expression<String>? location,
    drift.Expression<String>? contact,
    drift.Expression<String>? donorName,
    drift.Expression<String>? imagePath,
    drift.Expression<DateTime>? dateAdded,
  }) {
    return drift.RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (category != null) 'category': category,
      if (location != null) 'location': location,
      if (contact != null) 'contact': contact,
      if (donorName != null) 'donor_name': donorName,
      if (imagePath != null) 'image_path': imagePath,
      if (dateAdded != null) 'date_added': dateAdded,
    });
  }

  DonationsCompanion copyWith(
      {drift.Value<int>? id,
      drift.Value<String>? title,
      drift.Value<String>? description,
      drift.Value<String>? category,
      drift.Value<String>? location,
      drift.Value<String>? contact,
      drift.Value<String?>? donorName,
      drift.Value<String?>? imagePath,
      drift.Value<DateTime>? dateAdded}) {
    return DonationsCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      category: category ?? this.category,
      location: location ?? this.location,
      contact: contact ?? this.contact,
      donorName: donorName ?? this.donorName,
      imagePath: imagePath ?? this.imagePath,
      dateAdded: dateAdded ?? this.dateAdded,
    );
  }

  @override
  Map<String, drift.Expression> toColumns(bool nullToAbsent) {
    final map = <String, drift.Expression>{};
    if (id.present) {
      map['id'] = drift.Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = drift.Variable<String>(title.value);
    }
    if (description.present) {
      map['description'] = drift.Variable<String>(description.value);
    }
    if (category.present) {
      map['category'] = drift.Variable<String>(category.value);
    }
    if (location.present) {
      map['location'] = drift.Variable<String>(location.value);
    }
    if (contact.present) {
      map['contact'] = drift.Variable<String>(contact.value);
    }
    if (donorName.present) {
      map['donor_name'] = drift.Variable<String>(donorName.value);
    }
    if (imagePath.present) {
      map['image_path'] = drift.Variable<String>(imagePath.value);
    }
    if (dateAdded.present) {
      map['date_added'] = drift.Variable<DateTime>(dateAdded.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DonationsCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('category: $category, ')
          ..write('location: $location, ')
          ..write('contact: $contact, ')
          ..write('donorName: $donorName, ')
          ..write('imagePath: $imagePath, ')
          ..write('dateAdded: $dateAdded')
          ..write(')'))
        .toString();
  }
}

abstract class _$LocalDatabase extends drift.GeneratedDatabase {
  _$LocalDatabase(QueryExecutor e) : super(e);
  $LocalDatabaseManager get managers => $LocalDatabaseManager(this);
  late final $ListingsTable listings = $ListingsTable(this);
  late final $UserProfilesTable userProfiles = $UserProfilesTable(this);
  late final $DonationsTable donations = $DonationsTable(this);
  @override
  Iterable<drift.TableInfo<drift.Table, Object?>> get allTables =>
      allSchemaEntities.whereType<drift.TableInfo<drift.Table, Object?>>();
  @override
  List<drift.DatabaseSchemaEntity> get allSchemaEntities =>
      [listings, userProfiles, donations];
}

typedef $$ListingsTableCreateCompanionBuilder = ListingsCompanion Function({
  drift.Value<int> id,
  required String title,
  required String description,
  required String category,
  required double price,
  required String location,
  drift.Value<bool> delivery,
  required String imagePath,
  required String contact,
});
typedef $$ListingsTableUpdateCompanionBuilder = ListingsCompanion Function({
  drift.Value<int> id,
  drift.Value<String> title,
  drift.Value<String> description,
  drift.Value<String> category,
  drift.Value<double> price,
  drift.Value<String> location,
  drift.Value<bool> delivery,
  drift.Value<String> imagePath,
  drift.Value<String> contact,
});

class $$ListingsTableFilterComposer
    extends drift.Composer<_$LocalDatabase, $ListingsTable> {
  $$ListingsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  drift.ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<String> get description => $composableBuilder(
      column: $table.description,
      builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<String> get category => $composableBuilder(
      column: $table.category,
      builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<double> get price => $composableBuilder(
      column: $table.price, builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<String> get location => $composableBuilder(
      column: $table.location,
      builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<bool> get delivery => $composableBuilder(
      column: $table.delivery,
      builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<String> get imagePath => $composableBuilder(
      column: $table.imagePath,
      builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<String> get contact => $composableBuilder(
      column: $table.contact, builder: (column) => drift.ColumnFilters(column));
}

class $$ListingsTableOrderingComposer
    extends drift.Composer<_$LocalDatabase, $ListingsTable> {
  $$ListingsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  drift.ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<String> get category => $composableBuilder(
      column: $table.category,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<double> get price => $composableBuilder(
      column: $table.price, builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<String> get location => $composableBuilder(
      column: $table.location,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<bool> get delivery => $composableBuilder(
      column: $table.delivery,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<String> get imagePath => $composableBuilder(
      column: $table.imagePath,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<String> get contact => $composableBuilder(
      column: $table.contact,
      builder: (column) => drift.ColumnOrderings(column));
}

class $$ListingsTableAnnotationComposer
    extends drift.Composer<_$LocalDatabase, $ListingsTable> {
  $$ListingsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  drift.GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  drift.GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  drift.GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  drift.GeneratedColumn<String> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);

  drift.GeneratedColumn<double> get price =>
      $composableBuilder(column: $table.price, builder: (column) => column);

  drift.GeneratedColumn<String> get location =>
      $composableBuilder(column: $table.location, builder: (column) => column);

  drift.GeneratedColumn<bool> get delivery =>
      $composableBuilder(column: $table.delivery, builder: (column) => column);

  drift.GeneratedColumn<String> get imagePath =>
      $composableBuilder(column: $table.imagePath, builder: (column) => column);

  drift.GeneratedColumn<String> get contact =>
      $composableBuilder(column: $table.contact, builder: (column) => column);
}

class $$ListingsTableTableManager extends drift.RootTableManager<
    _$LocalDatabase,
    $ListingsTable,
    Listing,
    $$ListingsTableFilterComposer,
    $$ListingsTableOrderingComposer,
    $$ListingsTableAnnotationComposer,
    $$ListingsTableCreateCompanionBuilder,
    $$ListingsTableUpdateCompanionBuilder,
    (Listing, drift.BaseReferences<_$LocalDatabase, $ListingsTable, Listing>),
    Listing,
    drift.PrefetchHooks Function()> {
  $$ListingsTableTableManager(_$LocalDatabase db, $ListingsTable table)
      : super(drift.TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ListingsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ListingsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ListingsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            drift.Value<int> id = const drift.Value.absent(),
            drift.Value<String> title = const drift.Value.absent(),
            drift.Value<String> description = const drift.Value.absent(),
            drift.Value<String> category = const drift.Value.absent(),
            drift.Value<double> price = const drift.Value.absent(),
            drift.Value<String> location = const drift.Value.absent(),
            drift.Value<bool> delivery = const drift.Value.absent(),
            drift.Value<String> imagePath = const drift.Value.absent(),
            drift.Value<String> contact = const drift.Value.absent(),
          }) =>
              ListingsCompanion(
            id: id,
            title: title,
            description: description,
            category: category,
            price: price,
            location: location,
            delivery: delivery,
            imagePath: imagePath,
            contact: contact,
          ),
          createCompanionCallback: ({
            drift.Value<int> id = const drift.Value.absent(),
            required String title,
            required String description,
            required String category,
            required double price,
            required String location,
            drift.Value<bool> delivery = const drift.Value.absent(),
            required String imagePath,
            required String contact,
          }) =>
              ListingsCompanion.insert(
            id: id,
            title: title,
            description: description,
            category: category,
            price: price,
            location: location,
            delivery: delivery,
            imagePath: imagePath,
            contact: contact,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), drift.BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$ListingsTableProcessedTableManager = drift.ProcessedTableManager<
    _$LocalDatabase,
    $ListingsTable,
    Listing,
    $$ListingsTableFilterComposer,
    $$ListingsTableOrderingComposer,
    $$ListingsTableAnnotationComposer,
    $$ListingsTableCreateCompanionBuilder,
    $$ListingsTableUpdateCompanionBuilder,
    (Listing, drift.BaseReferences<_$LocalDatabase, $ListingsTable, Listing>),
    Listing,
    drift.PrefetchHooks Function()>;
typedef $$UserProfilesTableCreateCompanionBuilder = UserProfilesCompanion
    Function({
  drift.Value<int> id,
  required String fullName,
  required String farmingType,
  drift.Value<String?> email,
  drift.Value<String?> phoneNumber,
  drift.Value<String?> location,
  drift.Value<String?> profileImage,
});
typedef $$UserProfilesTableUpdateCompanionBuilder = UserProfilesCompanion
    Function({
  drift.Value<int> id,
  drift.Value<String> fullName,
  drift.Value<String> farmingType,
  drift.Value<String?> email,
  drift.Value<String?> phoneNumber,
  drift.Value<String?> location,
  drift.Value<String?> profileImage,
});

class $$UserProfilesTableFilterComposer
    extends drift.Composer<_$LocalDatabase, $UserProfilesTable> {
  $$UserProfilesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  drift.ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<String> get fullName => $composableBuilder(
      column: $table.fullName,
      builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<String> get farmingType => $composableBuilder(
      column: $table.farmingType,
      builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<String> get email => $composableBuilder(
      column: $table.email, builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<String> get phoneNumber => $composableBuilder(
      column: $table.phoneNumber,
      builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<String> get location => $composableBuilder(
      column: $table.location,
      builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<String> get profileImage => $composableBuilder(
      column: $table.profileImage,
      builder: (column) => drift.ColumnFilters(column));
}

class $$UserProfilesTableOrderingComposer
    extends drift.Composer<_$LocalDatabase, $UserProfilesTable> {
  $$UserProfilesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  drift.ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<String> get fullName => $composableBuilder(
      column: $table.fullName,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<String> get farmingType => $composableBuilder(
      column: $table.farmingType,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<String> get email => $composableBuilder(
      column: $table.email, builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<String> get phoneNumber => $composableBuilder(
      column: $table.phoneNumber,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<String> get location => $composableBuilder(
      column: $table.location,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<String> get profileImage => $composableBuilder(
      column: $table.profileImage,
      builder: (column) => drift.ColumnOrderings(column));
}

class $$UserProfilesTableAnnotationComposer
    extends drift.Composer<_$LocalDatabase, $UserProfilesTable> {
  $$UserProfilesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  drift.GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  drift.GeneratedColumn<String> get fullName =>
      $composableBuilder(column: $table.fullName, builder: (column) => column);

  drift.GeneratedColumn<String> get farmingType => $composableBuilder(
      column: $table.farmingType, builder: (column) => column);

  drift.GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);

  drift.GeneratedColumn<String> get phoneNumber => $composableBuilder(
      column: $table.phoneNumber, builder: (column) => column);

  drift.GeneratedColumn<String> get location =>
      $composableBuilder(column: $table.location, builder: (column) => column);

  drift.GeneratedColumn<String> get profileImage => $composableBuilder(
      column: $table.profileImage, builder: (column) => column);
}

class $$UserProfilesTableTableManager extends drift.RootTableManager<
    _$LocalDatabase,
    $UserProfilesTable,
    UserProfile,
    $$UserProfilesTableFilterComposer,
    $$UserProfilesTableOrderingComposer,
    $$UserProfilesTableAnnotationComposer,
    $$UserProfilesTableCreateCompanionBuilder,
    $$UserProfilesTableUpdateCompanionBuilder,
    (
      UserProfile,
      drift.BaseReferences<_$LocalDatabase, $UserProfilesTable, UserProfile>
    ),
    UserProfile,
    drift.PrefetchHooks Function()> {
  $$UserProfilesTableTableManager(_$LocalDatabase db, $UserProfilesTable table)
      : super(drift.TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UserProfilesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UserProfilesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UserProfilesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            drift.Value<int> id = const drift.Value.absent(),
            drift.Value<String> fullName = const drift.Value.absent(),
            drift.Value<String> farmingType = const drift.Value.absent(),
            drift.Value<String?> email = const drift.Value.absent(),
            drift.Value<String?> phoneNumber = const drift.Value.absent(),
            drift.Value<String?> location = const drift.Value.absent(),
            drift.Value<String?> profileImage = const drift.Value.absent(),
          }) =>
              UserProfilesCompanion(
            id: id,
            fullName: fullName,
            farmingType: farmingType,
            email: email,
            phoneNumber: phoneNumber,
            location: location,
            profileImage: profileImage,
          ),
          createCompanionCallback: ({
            drift.Value<int> id = const drift.Value.absent(),
            required String fullName,
            required String farmingType,
            drift.Value<String?> email = const drift.Value.absent(),
            drift.Value<String?> phoneNumber = const drift.Value.absent(),
            drift.Value<String?> location = const drift.Value.absent(),
            drift.Value<String?> profileImage = const drift.Value.absent(),
          }) =>
              UserProfilesCompanion.insert(
            id: id,
            fullName: fullName,
            farmingType: farmingType,
            email: email,
            phoneNumber: phoneNumber,
            location: location,
            profileImage: profileImage,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), drift.BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$UserProfilesTableProcessedTableManager = drift.ProcessedTableManager<
    _$LocalDatabase,
    $UserProfilesTable,
    UserProfile,
    $$UserProfilesTableFilterComposer,
    $$UserProfilesTableOrderingComposer,
    $$UserProfilesTableAnnotationComposer,
    $$UserProfilesTableCreateCompanionBuilder,
    $$UserProfilesTableUpdateCompanionBuilder,
    (
      UserProfile,
      drift.BaseReferences<_$LocalDatabase, $UserProfilesTable, UserProfile>
    ),
    UserProfile,
    drift.PrefetchHooks Function()>;
typedef $$DonationsTableCreateCompanionBuilder = DonationsCompanion Function({
  drift.Value<int> id,
  required String title,
  required String description,
  required String category,
  required String location,
  required String contact,
  drift.Value<String?> donorName,
  drift.Value<String?> imagePath,
  drift.Value<DateTime> dateAdded,
});
typedef $$DonationsTableUpdateCompanionBuilder = DonationsCompanion Function({
  drift.Value<int> id,
  drift.Value<String> title,
  drift.Value<String> description,
  drift.Value<String> category,
  drift.Value<String> location,
  drift.Value<String> contact,
  drift.Value<String?> donorName,
  drift.Value<String?> imagePath,
  drift.Value<DateTime> dateAdded,
});

class $$DonationsTableFilterComposer
    extends drift.Composer<_$LocalDatabase, $DonationsTable> {
  $$DonationsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  drift.ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<String> get description => $composableBuilder(
      column: $table.description,
      builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<String> get category => $composableBuilder(
      column: $table.category,
      builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<String> get location => $composableBuilder(
      column: $table.location,
      builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<String> get contact => $composableBuilder(
      column: $table.contact, builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<String> get donorName => $composableBuilder(
      column: $table.donorName,
      builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<String> get imagePath => $composableBuilder(
      column: $table.imagePath,
      builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<DateTime> get dateAdded => $composableBuilder(
      column: $table.dateAdded,
      builder: (column) => drift.ColumnFilters(column));
}

class $$DonationsTableOrderingComposer
    extends drift.Composer<_$LocalDatabase, $DonationsTable> {
  $$DonationsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  drift.ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<String> get category => $composableBuilder(
      column: $table.category,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<String> get location => $composableBuilder(
      column: $table.location,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<String> get contact => $composableBuilder(
      column: $table.contact,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<String> get donorName => $composableBuilder(
      column: $table.donorName,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<String> get imagePath => $composableBuilder(
      column: $table.imagePath,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<DateTime> get dateAdded => $composableBuilder(
      column: $table.dateAdded,
      builder: (column) => drift.ColumnOrderings(column));
}

class $$DonationsTableAnnotationComposer
    extends drift.Composer<_$LocalDatabase, $DonationsTable> {
  $$DonationsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  drift.GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  drift.GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  drift.GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  drift.GeneratedColumn<String> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);

  drift.GeneratedColumn<String> get location =>
      $composableBuilder(column: $table.location, builder: (column) => column);

  drift.GeneratedColumn<String> get contact =>
      $composableBuilder(column: $table.contact, builder: (column) => column);

  drift.GeneratedColumn<String> get donorName =>
      $composableBuilder(column: $table.donorName, builder: (column) => column);

  drift.GeneratedColumn<String> get imagePath =>
      $composableBuilder(column: $table.imagePath, builder: (column) => column);

  drift.GeneratedColumn<DateTime> get dateAdded =>
      $composableBuilder(column: $table.dateAdded, builder: (column) => column);
}

class $$DonationsTableTableManager extends drift.RootTableManager<
    _$LocalDatabase,
    $DonationsTable,
    Donation,
    $$DonationsTableFilterComposer,
    $$DonationsTableOrderingComposer,
    $$DonationsTableAnnotationComposer,
    $$DonationsTableCreateCompanionBuilder,
    $$DonationsTableUpdateCompanionBuilder,
    (
      Donation,
      drift.BaseReferences<_$LocalDatabase, $DonationsTable, Donation>
    ),
    Donation,
    drift.PrefetchHooks Function()> {
  $$DonationsTableTableManager(_$LocalDatabase db, $DonationsTable table)
      : super(drift.TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DonationsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DonationsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DonationsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            drift.Value<int> id = const drift.Value.absent(),
            drift.Value<String> title = const drift.Value.absent(),
            drift.Value<String> description = const drift.Value.absent(),
            drift.Value<String> category = const drift.Value.absent(),
            drift.Value<String> location = const drift.Value.absent(),
            drift.Value<String> contact = const drift.Value.absent(),
            drift.Value<String?> donorName = const drift.Value.absent(),
            drift.Value<String?> imagePath = const drift.Value.absent(),
            drift.Value<DateTime> dateAdded = const drift.Value.absent(),
          }) =>
              DonationsCompanion(
            id: id,
            title: title,
            description: description,
            category: category,
            location: location,
            contact: contact,
            donorName: donorName,
            imagePath: imagePath,
            dateAdded: dateAdded,
          ),
          createCompanionCallback: ({
            drift.Value<int> id = const drift.Value.absent(),
            required String title,
            required String description,
            required String category,
            required String location,
            required String contact,
            drift.Value<String?> donorName = const drift.Value.absent(),
            drift.Value<String?> imagePath = const drift.Value.absent(),
            drift.Value<DateTime> dateAdded = const drift.Value.absent(),
          }) =>
              DonationsCompanion.insert(
            id: id,
            title: title,
            description: description,
            category: category,
            location: location,
            contact: contact,
            donorName: donorName,
            imagePath: imagePath,
            dateAdded: dateAdded,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), drift.BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$DonationsTableProcessedTableManager = drift.ProcessedTableManager<
    _$LocalDatabase,
    $DonationsTable,
    Donation,
    $$DonationsTableFilterComposer,
    $$DonationsTableOrderingComposer,
    $$DonationsTableAnnotationComposer,
    $$DonationsTableCreateCompanionBuilder,
    $$DonationsTableUpdateCompanionBuilder,
    (
      Donation,
      drift.BaseReferences<_$LocalDatabase, $DonationsTable, Donation>
    ),
    Donation,
    drift.PrefetchHooks Function()>;

class $LocalDatabaseManager {
  final _$LocalDatabase _db;
  $LocalDatabaseManager(this._db);
  $$ListingsTableTableManager get listings =>
      $$ListingsTableTableManager(_db, _db.listings);
  $$UserProfilesTableTableManager get userProfiles =>
      $$UserProfilesTableTableManager(_db, _db.userProfiles);
  $$DonationsTableTableManager get donations =>
      $$DonationsTableTableManager(_db, _db.donations);
}

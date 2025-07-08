// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_db.dart';

// ignore_for_file: type=lint
class $ListingsTable extends Listings with TableInfo<$ListingsTable, Listing> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ListingsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _imagePathMeta =
      const VerificationMeta('imagePath');
  @override
  late final GeneratedColumn<String> imagePath = GeneratedColumn<String>(
      'image_path', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _priceMeta = const VerificationMeta('price');
  @override
  late final GeneratedColumn<double> price = GeneratedColumn<double>(
      'price', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _locationMeta =
      const VerificationMeta('location');
  @override
  late final GeneratedColumn<String> location = GeneratedColumn<String>(
      'location', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _categoryMeta =
      const VerificationMeta('category');
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
      'category', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _contactMeta =
      const VerificationMeta('contact');
  @override
  late final GeneratedColumn<String> contact = GeneratedColumn<String>(
      'contact', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _deliveryMeta =
      const VerificationMeta('delivery');
  @override
  late final GeneratedColumn<bool> delivery = GeneratedColumn<bool>(
      'delivery', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("delivery" IN (0, 1))'),
      defaultValue: const Constant(false));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        title,
        description,
        imagePath,
        price,
        location,
        category,
        contact,
        delivery
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'listings';
  @override
  VerificationContext validateIntegrity(Insertable<Listing> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
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
    if (data.containsKey('image_path')) {
      context.handle(_imagePathMeta,
          imagePath.isAcceptableOrUnknown(data['image_path']!, _imagePathMeta));
    } else if (isInserting) {
      context.missing(_imagePathMeta);
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
    if (data.containsKey('category')) {
      context.handle(_categoryMeta,
          category.isAcceptableOrUnknown(data['category']!, _categoryMeta));
    } else if (isInserting) {
      context.missing(_categoryMeta);
    }
    if (data.containsKey('contact')) {
      context.handle(_contactMeta,
          contact.isAcceptableOrUnknown(data['contact']!, _contactMeta));
    } else if (isInserting) {
      context.missing(_contactMeta);
    }
    if (data.containsKey('delivery')) {
      context.handle(_deliveryMeta,
          delivery.isAcceptableOrUnknown(data['delivery']!, _deliveryMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
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
      imagePath: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}image_path'])!,
      price: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}price'])!,
      location: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}location'])!,
      category: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}category'])!,
      contact: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}contact'])!,
      delivery: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}delivery'])!,
    );
  }

  @override
  $ListingsTable createAlias(String alias) {
    return $ListingsTable(attachedDatabase, alias);
  }
}

class Listing extends DataClass implements Insertable<Listing> {
  final int id;
  final String title;
  final String description;
  final String imagePath;
  final double price;
  final String location;
  final String category;
  final String contact;
  final bool delivery;
  const Listing(
      {required this.id,
      required this.title,
      required this.description,
      required this.imagePath,
      required this.price,
      required this.location,
      required this.category,
      required this.contact,
      required this.delivery});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    map['description'] = Variable<String>(description);
    map['image_path'] = Variable<String>(imagePath);
    map['price'] = Variable<double>(price);
    map['location'] = Variable<String>(location);
    map['category'] = Variable<String>(category);
    map['contact'] = Variable<String>(contact);
    map['delivery'] = Variable<bool>(delivery);
    return map;
  }

  ListingsCompanion toCompanion(bool nullToAbsent) {
    return ListingsCompanion(
      id: Value(id),
      title: Value(title),
      description: Value(description),
      imagePath: Value(imagePath),
      price: Value(price),
      location: Value(location),
      category: Value(category),
      contact: Value(contact),
      delivery: Value(delivery),
    );
  }

  factory Listing.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Listing(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      description: serializer.fromJson<String>(json['description']),
      imagePath: serializer.fromJson<String>(json['imagePath']),
      price: serializer.fromJson<double>(json['price']),
      location: serializer.fromJson<String>(json['location']),
      category: serializer.fromJson<String>(json['category']),
      contact: serializer.fromJson<String>(json['contact']),
      delivery: serializer.fromJson<bool>(json['delivery']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'description': serializer.toJson<String>(description),
      'imagePath': serializer.toJson<String>(imagePath),
      'price': serializer.toJson<double>(price),
      'location': serializer.toJson<String>(location),
      'category': serializer.toJson<String>(category),
      'contact': serializer.toJson<String>(contact),
      'delivery': serializer.toJson<bool>(delivery),
    };
  }

  Listing copyWith(
          {int? id,
          String? title,
          String? description,
          String? imagePath,
          double? price,
          String? location,
          String? category,
          String? contact,
          bool? delivery}) =>
      Listing(
        id: id ?? this.id,
        title: title ?? this.title,
        description: description ?? this.description,
        imagePath: imagePath ?? this.imagePath,
        price: price ?? this.price,
        location: location ?? this.location,
        category: category ?? this.category,
        contact: contact ?? this.contact,
        delivery: delivery ?? this.delivery,
      );
  Listing copyWithCompanion(ListingsCompanion data) {
    return Listing(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      description:
          data.description.present ? data.description.value : this.description,
      imagePath: data.imagePath.present ? data.imagePath.value : this.imagePath,
      price: data.price.present ? data.price.value : this.price,
      location: data.location.present ? data.location.value : this.location,
      category: data.category.present ? data.category.value : this.category,
      contact: data.contact.present ? data.contact.value : this.contact,
      delivery: data.delivery.present ? data.delivery.value : this.delivery,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Listing(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('imagePath: $imagePath, ')
          ..write('price: $price, ')
          ..write('location: $location, ')
          ..write('category: $category, ')
          ..write('contact: $contact, ')
          ..write('delivery: $delivery')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title, description, imagePath, price,
      location, category, contact, delivery);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Listing &&
          other.id == this.id &&
          other.title == this.title &&
          other.description == this.description &&
          other.imagePath == this.imagePath &&
          other.price == this.price &&
          other.location == this.location &&
          other.category == this.category &&
          other.contact == this.contact &&
          other.delivery == this.delivery);
}

class ListingsCompanion extends UpdateCompanion<Listing> {
  final Value<int> id;
  final Value<String> title;
  final Value<String> description;
  final Value<String> imagePath;
  final Value<double> price;
  final Value<String> location;
  final Value<String> category;
  final Value<String> contact;
  final Value<bool> delivery;
  const ListingsCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.imagePath = const Value.absent(),
    this.price = const Value.absent(),
    this.location = const Value.absent(),
    this.category = const Value.absent(),
    this.contact = const Value.absent(),
    this.delivery = const Value.absent(),
  });
  ListingsCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    required String description,
    required String imagePath,
    required double price,
    required String location,
    required String category,
    required String contact,
    this.delivery = const Value.absent(),
  })  : title = Value(title),
        description = Value(description),
        imagePath = Value(imagePath),
        price = Value(price),
        location = Value(location),
        category = Value(category),
        contact = Value(contact);
  static Insertable<Listing> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? description,
    Expression<String>? imagePath,
    Expression<double>? price,
    Expression<String>? location,
    Expression<String>? category,
    Expression<String>? contact,
    Expression<bool>? delivery,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (imagePath != null) 'image_path': imagePath,
      if (price != null) 'price': price,
      if (location != null) 'location': location,
      if (category != null) 'category': category,
      if (contact != null) 'contact': contact,
      if (delivery != null) 'delivery': delivery,
    });
  }

  ListingsCompanion copyWith(
      {Value<int>? id,
      Value<String>? title,
      Value<String>? description,
      Value<String>? imagePath,
      Value<double>? price,
      Value<String>? location,
      Value<String>? category,
      Value<String>? contact,
      Value<bool>? delivery}) {
    return ListingsCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      imagePath: imagePath ?? this.imagePath,
      price: price ?? this.price,
      location: location ?? this.location,
      category: category ?? this.category,
      contact: contact ?? this.contact,
      delivery: delivery ?? this.delivery,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (imagePath.present) {
      map['image_path'] = Variable<String>(imagePath.value);
    }
    if (price.present) {
      map['price'] = Variable<double>(price.value);
    }
    if (location.present) {
      map['location'] = Variable<String>(location.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (contact.present) {
      map['contact'] = Variable<String>(contact.value);
    }
    if (delivery.present) {
      map['delivery'] = Variable<bool>(delivery.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ListingsCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('imagePath: $imagePath, ')
          ..write('price: $price, ')
          ..write('location: $location, ')
          ..write('category: $category, ')
          ..write('contact: $contact, ')
          ..write('delivery: $delivery')
          ..write(')'))
        .toString();
  }
}

class $UserProfilesTable extends UserProfiles
    with TableInfo<$UserProfilesTable, UserProfile> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UserProfilesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _fullNameMeta =
      const VerificationMeta('fullName');
  @override
  late final GeneratedColumn<String> fullName = GeneratedColumn<String>(
      'full_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
      'email', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _phoneMeta = const VerificationMeta('phone');
  @override
  late final GeneratedColumn<String> phone = GeneratedColumn<String>(
      'phone', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _locationMeta =
      const VerificationMeta('location');
  @override
  late final GeneratedColumn<String> location = GeneratedColumn<String>(
      'location', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _profileImagePathMeta =
      const VerificationMeta('profileImagePath');
  @override
  late final GeneratedColumn<String> profileImagePath = GeneratedColumn<String>(
      'profile_image_path', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, fullName, email, phone, location, profileImagePath];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'user_profiles';
  @override
  VerificationContext validateIntegrity(Insertable<UserProfile> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
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
    if (data.containsKey('email')) {
      context.handle(
          _emailMeta, email.isAcceptableOrUnknown(data['email']!, _emailMeta));
    } else if (isInserting) {
      context.missing(_emailMeta);
    }
    if (data.containsKey('phone')) {
      context.handle(
          _phoneMeta, phone.isAcceptableOrUnknown(data['phone']!, _phoneMeta));
    } else if (isInserting) {
      context.missing(_phoneMeta);
    }
    if (data.containsKey('location')) {
      context.handle(_locationMeta,
          location.isAcceptableOrUnknown(data['location']!, _locationMeta));
    } else if (isInserting) {
      context.missing(_locationMeta);
    }
    if (data.containsKey('profile_image_path')) {
      context.handle(
          _profileImagePathMeta,
          profileImagePath.isAcceptableOrUnknown(
              data['profile_image_path']!, _profileImagePathMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  UserProfile map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserProfile(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      fullName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}full_name'])!,
      email: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}email'])!,
      phone: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}phone'])!,
      location: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}location'])!,
      profileImagePath: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}profile_image_path']),
    );
  }

  @override
  $UserProfilesTable createAlias(String alias) {
    return $UserProfilesTable(attachedDatabase, alias);
  }
}

class UserProfile extends DataClass implements Insertable<UserProfile> {
  final int id;
  final String fullName;
  final String email;
  final String phone;
  final String location;
  final String? profileImagePath;
  const UserProfile(
      {required this.id,
      required this.fullName,
      required this.email,
      required this.phone,
      required this.location,
      this.profileImagePath});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['full_name'] = Variable<String>(fullName);
    map['email'] = Variable<String>(email);
    map['phone'] = Variable<String>(phone);
    map['location'] = Variable<String>(location);
    if (!nullToAbsent || profileImagePath != null) {
      map['profile_image_path'] = Variable<String>(profileImagePath);
    }
    return map;
  }

  UserProfilesCompanion toCompanion(bool nullToAbsent) {
    return UserProfilesCompanion(
      id: Value(id),
      fullName: Value(fullName),
      email: Value(email),
      phone: Value(phone),
      location: Value(location),
      profileImagePath: profileImagePath == null && nullToAbsent
          ? const Value.absent()
          : Value(profileImagePath),
    );
  }

  factory UserProfile.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserProfile(
      id: serializer.fromJson<int>(json['id']),
      fullName: serializer.fromJson<String>(json['fullName']),
      email: serializer.fromJson<String>(json['email']),
      phone: serializer.fromJson<String>(json['phone']),
      location: serializer.fromJson<String>(json['location']),
      profileImagePath: serializer.fromJson<String?>(json['profileImagePath']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'fullName': serializer.toJson<String>(fullName),
      'email': serializer.toJson<String>(email),
      'phone': serializer.toJson<String>(phone),
      'location': serializer.toJson<String>(location),
      'profileImagePath': serializer.toJson<String?>(profileImagePath),
    };
  }

  UserProfile copyWith(
          {int? id,
          String? fullName,
          String? email,
          String? phone,
          String? location,
          Value<String?> profileImagePath = const Value.absent()}) =>
      UserProfile(
        id: id ?? this.id,
        fullName: fullName ?? this.fullName,
        email: email ?? this.email,
        phone: phone ?? this.phone,
        location: location ?? this.location,
        profileImagePath: profileImagePath.present
            ? profileImagePath.value
            : this.profileImagePath,
      );
  UserProfile copyWithCompanion(UserProfilesCompanion data) {
    return UserProfile(
      id: data.id.present ? data.id.value : this.id,
      fullName: data.fullName.present ? data.fullName.value : this.fullName,
      email: data.email.present ? data.email.value : this.email,
      phone: data.phone.present ? data.phone.value : this.phone,
      location: data.location.present ? data.location.value : this.location,
      profileImagePath: data.profileImagePath.present
          ? data.profileImagePath.value
          : this.profileImagePath,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UserProfile(')
          ..write('id: $id, ')
          ..write('fullName: $fullName, ')
          ..write('email: $email, ')
          ..write('phone: $phone, ')
          ..write('location: $location, ')
          ..write('profileImagePath: $profileImagePath')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, fullName, email, phone, location, profileImagePath);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserProfile &&
          other.id == this.id &&
          other.fullName == this.fullName &&
          other.email == this.email &&
          other.phone == this.phone &&
          other.location == this.location &&
          other.profileImagePath == this.profileImagePath);
}

class UserProfilesCompanion extends UpdateCompanion<UserProfile> {
  final Value<int> id;
  final Value<String> fullName;
  final Value<String> email;
  final Value<String> phone;
  final Value<String> location;
  final Value<String?> profileImagePath;
  const UserProfilesCompanion({
    this.id = const Value.absent(),
    this.fullName = const Value.absent(),
    this.email = const Value.absent(),
    this.phone = const Value.absent(),
    this.location = const Value.absent(),
    this.profileImagePath = const Value.absent(),
  });
  UserProfilesCompanion.insert({
    this.id = const Value.absent(),
    required String fullName,
    required String email,
    required String phone,
    required String location,
    this.profileImagePath = const Value.absent(),
  })  : fullName = Value(fullName),
        email = Value(email),
        phone = Value(phone),
        location = Value(location);
  static Insertable<UserProfile> custom({
    Expression<int>? id,
    Expression<String>? fullName,
    Expression<String>? email,
    Expression<String>? phone,
    Expression<String>? location,
    Expression<String>? profileImagePath,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (fullName != null) 'full_name': fullName,
      if (email != null) 'email': email,
      if (phone != null) 'phone': phone,
      if (location != null) 'location': location,
      if (profileImagePath != null) 'profile_image_path': profileImagePath,
    });
  }

  UserProfilesCompanion copyWith(
      {Value<int>? id,
      Value<String>? fullName,
      Value<String>? email,
      Value<String>? phone,
      Value<String>? location,
      Value<String?>? profileImagePath}) {
    return UserProfilesCompanion(
      id: id ?? this.id,
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      location: location ?? this.location,
      profileImagePath: profileImagePath ?? this.profileImagePath,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (fullName.present) {
      map['full_name'] = Variable<String>(fullName.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (phone.present) {
      map['phone'] = Variable<String>(phone.value);
    }
    if (location.present) {
      map['location'] = Variable<String>(location.value);
    }
    if (profileImagePath.present) {
      map['profile_image_path'] = Variable<String>(profileImagePath.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserProfilesCompanion(')
          ..write('id: $id, ')
          ..write('fullName: $fullName, ')
          ..write('email: $email, ')
          ..write('phone: $phone, ')
          ..write('location: $location, ')
          ..write('profileImagePath: $profileImagePath')
          ..write(')'))
        .toString();
  }
}

abstract class _$LocalDatabase extends GeneratedDatabase {
  _$LocalDatabase(QueryExecutor e) : super(e);
  $LocalDatabaseManager get managers => $LocalDatabaseManager(this);
  late final $ListingsTable listings = $ListingsTable(this);
  late final $UserProfilesTable userProfiles = $UserProfilesTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [listings, userProfiles];
}

typedef $$ListingsTableCreateCompanionBuilder = ListingsCompanion Function({
  Value<int> id,
  required String title,
  required String description,
  required String imagePath,
  required double price,
  required String location,
  required String category,
  required String contact,
  Value<bool> delivery,
});
typedef $$ListingsTableUpdateCompanionBuilder = ListingsCompanion Function({
  Value<int> id,
  Value<String> title,
  Value<String> description,
  Value<String> imagePath,
  Value<double> price,
  Value<String> location,
  Value<String> category,
  Value<String> contact,
  Value<bool> delivery,
});

class $$ListingsTableFilterComposer
    extends Composer<_$LocalDatabase, $ListingsTable> {
  $$ListingsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get imagePath => $composableBuilder(
      column: $table.imagePath, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get price => $composableBuilder(
      column: $table.price, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get location => $composableBuilder(
      column: $table.location, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get category => $composableBuilder(
      column: $table.category, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get contact => $composableBuilder(
      column: $table.contact, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get delivery => $composableBuilder(
      column: $table.delivery, builder: (column) => ColumnFilters(column));
}

class $$ListingsTableOrderingComposer
    extends Composer<_$LocalDatabase, $ListingsTable> {
  $$ListingsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get imagePath => $composableBuilder(
      column: $table.imagePath, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get price => $composableBuilder(
      column: $table.price, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get location => $composableBuilder(
      column: $table.location, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get category => $composableBuilder(
      column: $table.category, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get contact => $composableBuilder(
      column: $table.contact, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get delivery => $composableBuilder(
      column: $table.delivery, builder: (column) => ColumnOrderings(column));
}

class $$ListingsTableAnnotationComposer
    extends Composer<_$LocalDatabase, $ListingsTable> {
  $$ListingsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  GeneratedColumn<String> get imagePath =>
      $composableBuilder(column: $table.imagePath, builder: (column) => column);

  GeneratedColumn<double> get price =>
      $composableBuilder(column: $table.price, builder: (column) => column);

  GeneratedColumn<String> get location =>
      $composableBuilder(column: $table.location, builder: (column) => column);

  GeneratedColumn<String> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);

  GeneratedColumn<String> get contact =>
      $composableBuilder(column: $table.contact, builder: (column) => column);

  GeneratedColumn<bool> get delivery =>
      $composableBuilder(column: $table.delivery, builder: (column) => column);
}

class $$ListingsTableTableManager extends RootTableManager<
    _$LocalDatabase,
    $ListingsTable,
    Listing,
    $$ListingsTableFilterComposer,
    $$ListingsTableOrderingComposer,
    $$ListingsTableAnnotationComposer,
    $$ListingsTableCreateCompanionBuilder,
    $$ListingsTableUpdateCompanionBuilder,
    (Listing, BaseReferences<_$LocalDatabase, $ListingsTable, Listing>),
    Listing,
    PrefetchHooks Function()> {
  $$ListingsTableTableManager(_$LocalDatabase db, $ListingsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ListingsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ListingsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ListingsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<String> description = const Value.absent(),
            Value<String> imagePath = const Value.absent(),
            Value<double> price = const Value.absent(),
            Value<String> location = const Value.absent(),
            Value<String> category = const Value.absent(),
            Value<String> contact = const Value.absent(),
            Value<bool> delivery = const Value.absent(),
          }) =>
              ListingsCompanion(
            id: id,
            title: title,
            description: description,
            imagePath: imagePath,
            price: price,
            location: location,
            category: category,
            contact: contact,
            delivery: delivery,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String title,
            required String description,
            required String imagePath,
            required double price,
            required String location,
            required String category,
            required String contact,
            Value<bool> delivery = const Value.absent(),
          }) =>
              ListingsCompanion.insert(
            id: id,
            title: title,
            description: description,
            imagePath: imagePath,
            price: price,
            location: location,
            category: category,
            contact: contact,
            delivery: delivery,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$ListingsTableProcessedTableManager = ProcessedTableManager<
    _$LocalDatabase,
    $ListingsTable,
    Listing,
    $$ListingsTableFilterComposer,
    $$ListingsTableOrderingComposer,
    $$ListingsTableAnnotationComposer,
    $$ListingsTableCreateCompanionBuilder,
    $$ListingsTableUpdateCompanionBuilder,
    (Listing, BaseReferences<_$LocalDatabase, $ListingsTable, Listing>),
    Listing,
    PrefetchHooks Function()>;
typedef $$UserProfilesTableCreateCompanionBuilder = UserProfilesCompanion
    Function({
  Value<int> id,
  required String fullName,
  required String email,
  required String phone,
  required String location,
  Value<String?> profileImagePath,
});
typedef $$UserProfilesTableUpdateCompanionBuilder = UserProfilesCompanion
    Function({
  Value<int> id,
  Value<String> fullName,
  Value<String> email,
  Value<String> phone,
  Value<String> location,
  Value<String?> profileImagePath,
});

class $$UserProfilesTableFilterComposer
    extends Composer<_$LocalDatabase, $UserProfilesTable> {
  $$UserProfilesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get fullName => $composableBuilder(
      column: $table.fullName, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get email => $composableBuilder(
      column: $table.email, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get phone => $composableBuilder(
      column: $table.phone, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get location => $composableBuilder(
      column: $table.location, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get profileImagePath => $composableBuilder(
      column: $table.profileImagePath,
      builder: (column) => ColumnFilters(column));
}

class $$UserProfilesTableOrderingComposer
    extends Composer<_$LocalDatabase, $UserProfilesTable> {
  $$UserProfilesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get fullName => $composableBuilder(
      column: $table.fullName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get email => $composableBuilder(
      column: $table.email, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get phone => $composableBuilder(
      column: $table.phone, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get location => $composableBuilder(
      column: $table.location, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get profileImagePath => $composableBuilder(
      column: $table.profileImagePath,
      builder: (column) => ColumnOrderings(column));
}

class $$UserProfilesTableAnnotationComposer
    extends Composer<_$LocalDatabase, $UserProfilesTable> {
  $$UserProfilesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get fullName =>
      $composableBuilder(column: $table.fullName, builder: (column) => column);

  GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);

  GeneratedColumn<String> get phone =>
      $composableBuilder(column: $table.phone, builder: (column) => column);

  GeneratedColumn<String> get location =>
      $composableBuilder(column: $table.location, builder: (column) => column);

  GeneratedColumn<String> get profileImagePath => $composableBuilder(
      column: $table.profileImagePath, builder: (column) => column);
}

class $$UserProfilesTableTableManager extends RootTableManager<
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
      BaseReferences<_$LocalDatabase, $UserProfilesTable, UserProfile>
    ),
    UserProfile,
    PrefetchHooks Function()> {
  $$UserProfilesTableTableManager(_$LocalDatabase db, $UserProfilesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UserProfilesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UserProfilesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UserProfilesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> fullName = const Value.absent(),
            Value<String> email = const Value.absent(),
            Value<String> phone = const Value.absent(),
            Value<String> location = const Value.absent(),
            Value<String?> profileImagePath = const Value.absent(),
          }) =>
              UserProfilesCompanion(
            id: id,
            fullName: fullName,
            email: email,
            phone: phone,
            location: location,
            profileImagePath: profileImagePath,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String fullName,
            required String email,
            required String phone,
            required String location,
            Value<String?> profileImagePath = const Value.absent(),
          }) =>
              UserProfilesCompanion.insert(
            id: id,
            fullName: fullName,
            email: email,
            phone: phone,
            location: location,
            profileImagePath: profileImagePath,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$UserProfilesTableProcessedTableManager = ProcessedTableManager<
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
      BaseReferences<_$LocalDatabase, $UserProfilesTable, UserProfile>
    ),
    UserProfile,
    PrefetchHooks Function()>;

class $LocalDatabaseManager {
  final _$LocalDatabase _db;
  $LocalDatabaseManager(this._db);
  $$ListingsTableTableManager get listings =>
      $$ListingsTableTableManager(_db, _db.listings);
  $$UserProfilesTableTableManager get userProfiles =>
      $$UserProfilesTableTableManager(_db, _db.userProfiles);
}

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
  static const VerificationMeta _categoryMeta =
      const VerificationMeta('category');
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
      'category', aliasedName, false,
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
  static const VerificationMeta _imagePathMeta =
      const VerificationMeta('imagePath');
  @override
  late final GeneratedColumn<String> imagePath = GeneratedColumn<String>(
      'image_path', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _contactMeta =
      const VerificationMeta('contact');
  @override
  late final GeneratedColumn<String> contact = GeneratedColumn<String>(
      'contact', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
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

class Listing extends DataClass implements Insertable<Listing> {
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
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    map['description'] = Variable<String>(description);
    map['category'] = Variable<String>(category);
    map['price'] = Variable<double>(price);
    map['location'] = Variable<String>(location);
    map['delivery'] = Variable<bool>(delivery);
    map['image_path'] = Variable<String>(imagePath);
    map['contact'] = Variable<String>(contact);
    return map;
  }

  ListingsCompanion toCompanion(bool nullToAbsent) {
    return ListingsCompanion(
      id: Value(id),
      title: Value(title),
      description: Value(description),
      category: Value(category),
      price: Value(price),
      location: Value(location),
      delivery: Value(delivery),
      imagePath: Value(imagePath),
      contact: Value(contact),
    );
  }

  factory Listing.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
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
    serializer ??= driftRuntimeOptions.defaultSerializer;
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

class ListingsCompanion extends UpdateCompanion<Listing> {
  final Value<int> id;
  final Value<String> title;
  final Value<String> description;
  final Value<String> category;
  final Value<double> price;
  final Value<String> location;
  final Value<bool> delivery;
  final Value<String> imagePath;
  final Value<String> contact;
  const ListingsCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.category = const Value.absent(),
    this.price = const Value.absent(),
    this.location = const Value.absent(),
    this.delivery = const Value.absent(),
    this.imagePath = const Value.absent(),
    this.contact = const Value.absent(),
  });
  ListingsCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    required String description,
    required String category,
    required double price,
    required String location,
    this.delivery = const Value.absent(),
    required String imagePath,
    required String contact,
  })  : title = Value(title),
        description = Value(description),
        category = Value(category),
        price = Value(price),
        location = Value(location),
        imagePath = Value(imagePath),
        contact = Value(contact);
  static Insertable<Listing> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? description,
    Expression<String>? category,
    Expression<double>? price,
    Expression<String>? location,
    Expression<bool>? delivery,
    Expression<String>? imagePath,
    Expression<String>? contact,
  }) {
    return RawValuesInsertable({
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
      {Value<int>? id,
      Value<String>? title,
      Value<String>? description,
      Value<String>? category,
      Value<double>? price,
      Value<String>? location,
      Value<bool>? delivery,
      Value<String>? imagePath,
      Value<String>? contact}) {
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
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (price.present) {
      map['price'] = Variable<double>(price.value);
    }
    if (location.present) {
      map['location'] = Variable<String>(location.value);
    }
    if (delivery.present) {
      map['delivery'] = Variable<bool>(delivery.value);
    }
    if (imagePath.present) {
      map['image_path'] = Variable<String>(imagePath.value);
    }
    if (contact.present) {
      map['contact'] = Variable<String>(contact.value);
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
    with TableInfo<$UserProfilesTable, UserProfile> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UserProfilesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _roleMeta = const VerificationMeta('role');
  @override
  late final GeneratedColumn<String> role = GeneratedColumn<String>(
      'role', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('user'));
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
  static const VerificationMeta _farmingTypeMeta =
      const VerificationMeta('farmingType');
  @override
  late final GeneratedColumn<String> farmingType = GeneratedColumn<String>(
      'farming_type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
      'email', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _phoneNumberMeta =
      const VerificationMeta('phoneNumber');
  @override
  late final GeneratedColumn<String> phoneNumber = GeneratedColumn<String>(
      'phone_number', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _locationMeta =
      const VerificationMeta('location');
  @override
  late final GeneratedColumn<String> location = GeneratedColumn<String>(
      'location', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _profileImageMeta =
      const VerificationMeta('profileImage');
  @override
  late final GeneratedColumn<String> profileImage = GeneratedColumn<String>(
      'profile_image', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        role,
        id,
        fullName,
        farmingType,
        email,
        phoneNumber,
        location,
        profileImage
      ];
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
    if (data.containsKey('role')) {
      context.handle(
          _roleMeta, role.isAcceptableOrUnknown(data['role']!, _roleMeta));
    }
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
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  UserProfile map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserProfile(
      role: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}role'])!,
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

class UserProfile extends DataClass implements Insertable<UserProfile> {
  final String role;
  final int id;
  final String fullName;
  final String farmingType;
  final String? email;
  final String? phoneNumber;
  final String? location;
  final String? profileImage;
  const UserProfile(
      {required this.role,
      required this.id,
      required this.fullName,
      required this.farmingType,
      this.email,
      this.phoneNumber,
      this.location,
      this.profileImage});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['role'] = Variable<String>(role);
    map['id'] = Variable<int>(id);
    map['full_name'] = Variable<String>(fullName);
    map['farming_type'] = Variable<String>(farmingType);
    if (!nullToAbsent || email != null) {
      map['email'] = Variable<String>(email);
    }
    if (!nullToAbsent || phoneNumber != null) {
      map['phone_number'] = Variable<String>(phoneNumber);
    }
    if (!nullToAbsent || location != null) {
      map['location'] = Variable<String>(location);
    }
    if (!nullToAbsent || profileImage != null) {
      map['profile_image'] = Variable<String>(profileImage);
    }
    return map;
  }

  UserProfilesCompanion toCompanion(bool nullToAbsent) {
    return UserProfilesCompanion(
      role: Value(role),
      id: Value(id),
      fullName: Value(fullName),
      farmingType: Value(farmingType),
      email:
          email == null && nullToAbsent ? const Value.absent() : Value(email),
      phoneNumber: phoneNumber == null && nullToAbsent
          ? const Value.absent()
          : Value(phoneNumber),
      location: location == null && nullToAbsent
          ? const Value.absent()
          : Value(location),
      profileImage: profileImage == null && nullToAbsent
          ? const Value.absent()
          : Value(profileImage),
    );
  }

  factory UserProfile.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserProfile(
      role: serializer.fromJson<String>(json['role']),
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
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'role': serializer.toJson<String>(role),
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
          {String? role,
          int? id,
          String? fullName,
          String? farmingType,
          Value<String?> email = const Value.absent(),
          Value<String?> phoneNumber = const Value.absent(),
          Value<String?> location = const Value.absent(),
          Value<String?> profileImage = const Value.absent()}) =>
      UserProfile(
        role: role ?? this.role,
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
      role: data.role.present ? data.role.value : this.role,
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
          ..write('role: $role, ')
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
  int get hashCode => Object.hash(role, id, fullName, farmingType, email,
      phoneNumber, location, profileImage);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserProfile &&
          other.role == this.role &&
          other.id == this.id &&
          other.fullName == this.fullName &&
          other.farmingType == this.farmingType &&
          other.email == this.email &&
          other.phoneNumber == this.phoneNumber &&
          other.location == this.location &&
          other.profileImage == this.profileImage);
}

class UserProfilesCompanion extends UpdateCompanion<UserProfile> {
  final Value<String> role;
  final Value<int> id;
  final Value<String> fullName;
  final Value<String> farmingType;
  final Value<String?> email;
  final Value<String?> phoneNumber;
  final Value<String?> location;
  final Value<String?> profileImage;
  const UserProfilesCompanion({
    this.role = const Value.absent(),
    this.id = const Value.absent(),
    this.fullName = const Value.absent(),
    this.farmingType = const Value.absent(),
    this.email = const Value.absent(),
    this.phoneNumber = const Value.absent(),
    this.location = const Value.absent(),
    this.profileImage = const Value.absent(),
  });
  UserProfilesCompanion.insert({
    this.role = const Value.absent(),
    this.id = const Value.absent(),
    required String fullName,
    required String farmingType,
    this.email = const Value.absent(),
    this.phoneNumber = const Value.absent(),
    this.location = const Value.absent(),
    this.profileImage = const Value.absent(),
  })  : fullName = Value(fullName),
        farmingType = Value(farmingType);
  static Insertable<UserProfile> custom({
    Expression<String>? role,
    Expression<int>? id,
    Expression<String>? fullName,
    Expression<String>? farmingType,
    Expression<String>? email,
    Expression<String>? phoneNumber,
    Expression<String>? location,
    Expression<String>? profileImage,
  }) {
    return RawValuesInsertable({
      if (role != null) 'role': role,
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
      {Value<String>? role,
      Value<int>? id,
      Value<String>? fullName,
      Value<String>? farmingType,
      Value<String?>? email,
      Value<String?>? phoneNumber,
      Value<String?>? location,
      Value<String?>? profileImage}) {
    return UserProfilesCompanion(
      role: role ?? this.role,
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
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (role.present) {
      map['role'] = Variable<String>(role.value);
    }
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (fullName.present) {
      map['full_name'] = Variable<String>(fullName.value);
    }
    if (farmingType.present) {
      map['farming_type'] = Variable<String>(farmingType.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (phoneNumber.present) {
      map['phone_number'] = Variable<String>(phoneNumber.value);
    }
    if (location.present) {
      map['location'] = Variable<String>(location.value);
    }
    if (profileImage.present) {
      map['profile_image'] = Variable<String>(profileImage.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserProfilesCompanion(')
          ..write('role: $role, ')
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
    with TableInfo<$DonationsTable, Donation> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DonationsTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _categoryMeta =
      const VerificationMeta('category');
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
      'category', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _locationMeta =
      const VerificationMeta('location');
  @override
  late final GeneratedColumn<String> location = GeneratedColumn<String>(
      'location', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _contactMeta =
      const VerificationMeta('contact');
  @override
  late final GeneratedColumn<String> contact = GeneratedColumn<String>(
      'contact', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _donorNameMeta =
      const VerificationMeta('donorName');
  @override
  late final GeneratedColumn<String> donorName = GeneratedColumn<String>(
      'donor_name', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _imagePathMeta =
      const VerificationMeta('imagePath');
  @override
  late final GeneratedColumn<String> imagePath = GeneratedColumn<String>(
      'image_path', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _dateAddedMeta =
      const VerificationMeta('dateAdded');
  @override
  late final GeneratedColumn<DateTime> dateAdded = GeneratedColumn<DateTime>(
      'date_added', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [
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
  VerificationContext validateIntegrity(Insertable<Donation> instance,
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
  Set<GeneratedColumn> get $primaryKey => {id};
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

class Donation extends DataClass implements Insertable<Donation> {
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
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    map['description'] = Variable<String>(description);
    map['category'] = Variable<String>(category);
    map['location'] = Variable<String>(location);
    map['contact'] = Variable<String>(contact);
    if (!nullToAbsent || donorName != null) {
      map['donor_name'] = Variable<String>(donorName);
    }
    if (!nullToAbsent || imagePath != null) {
      map['image_path'] = Variable<String>(imagePath);
    }
    map['date_added'] = Variable<DateTime>(dateAdded);
    return map;
  }

  DonationsCompanion toCompanion(bool nullToAbsent) {
    return DonationsCompanion(
      id: Value(id),
      title: Value(title),
      description: Value(description),
      category: Value(category),
      location: Value(location),
      contact: Value(contact),
      donorName: donorName == null && nullToAbsent
          ? const Value.absent()
          : Value(donorName),
      imagePath: imagePath == null && nullToAbsent
          ? const Value.absent()
          : Value(imagePath),
      dateAdded: Value(dateAdded),
    );
  }

  factory Donation.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
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
    serializer ??= driftRuntimeOptions.defaultSerializer;
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
          Value<String?> donorName = const Value.absent(),
          Value<String?> imagePath = const Value.absent(),
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

class DonationsCompanion extends UpdateCompanion<Donation> {
  final Value<int> id;
  final Value<String> title;
  final Value<String> description;
  final Value<String> category;
  final Value<String> location;
  final Value<String> contact;
  final Value<String?> donorName;
  final Value<String?> imagePath;
  final Value<DateTime> dateAdded;
  const DonationsCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.category = const Value.absent(),
    this.location = const Value.absent(),
    this.contact = const Value.absent(),
    this.donorName = const Value.absent(),
    this.imagePath = const Value.absent(),
    this.dateAdded = const Value.absent(),
  });
  DonationsCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    required String description,
    required String category,
    required String location,
    required String contact,
    this.donorName = const Value.absent(),
    this.imagePath = const Value.absent(),
    this.dateAdded = const Value.absent(),
  })  : title = Value(title),
        description = Value(description),
        category = Value(category),
        location = Value(location),
        contact = Value(contact);
  static Insertable<Donation> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? description,
    Expression<String>? category,
    Expression<String>? location,
    Expression<String>? contact,
    Expression<String>? donorName,
    Expression<String>? imagePath,
    Expression<DateTime>? dateAdded,
  }) {
    return RawValuesInsertable({
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
      {Value<int>? id,
      Value<String>? title,
      Value<String>? description,
      Value<String>? category,
      Value<String>? location,
      Value<String>? contact,
      Value<String?>? donorName,
      Value<String?>? imagePath,
      Value<DateTime>? dateAdded}) {
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
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (location.present) {
      map['location'] = Variable<String>(location.value);
    }
    if (contact.present) {
      map['contact'] = Variable<String>(contact.value);
    }
    if (donorName.present) {
      map['donor_name'] = Variable<String>(donorName.value);
    }
    if (imagePath.present) {
      map['image_path'] = Variable<String>(imagePath.value);
    }
    if (dateAdded.present) {
      map['date_added'] = Variable<DateTime>(dateAdded.value);
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

abstract class _$LocalDatabase extends GeneratedDatabase {
  _$LocalDatabase(QueryExecutor e) : super(e);
  $LocalDatabaseManager get managers => $LocalDatabaseManager(this);
  late final $ListingsTable listings = $ListingsTable(this);
  late final $UserProfilesTable userProfiles = $UserProfilesTable(this);
  late final $DonationsTable donations = $DonationsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [listings, userProfiles, donations];
}

typedef $$ListingsTableCreateCompanionBuilder = ListingsCompanion Function({
  Value<int> id,
  required String title,
  required String description,
  required String category,
  required double price,
  required String location,
  Value<bool> delivery,
  required String imagePath,
  required String contact,
});
typedef $$ListingsTableUpdateCompanionBuilder = ListingsCompanion Function({
  Value<int> id,
  Value<String> title,
  Value<String> description,
  Value<String> category,
  Value<double> price,
  Value<String> location,
  Value<bool> delivery,
  Value<String> imagePath,
  Value<String> contact,
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

  ColumnFilters<String> get category => $composableBuilder(
      column: $table.category, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get price => $composableBuilder(
      column: $table.price, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get location => $composableBuilder(
      column: $table.location, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get delivery => $composableBuilder(
      column: $table.delivery, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get imagePath => $composableBuilder(
      column: $table.imagePath, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get contact => $composableBuilder(
      column: $table.contact, builder: (column) => ColumnFilters(column));
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

  ColumnOrderings<String> get category => $composableBuilder(
      column: $table.category, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get price => $composableBuilder(
      column: $table.price, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get location => $composableBuilder(
      column: $table.location, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get delivery => $composableBuilder(
      column: $table.delivery, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get imagePath => $composableBuilder(
      column: $table.imagePath, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get contact => $composableBuilder(
      column: $table.contact, builder: (column) => ColumnOrderings(column));
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

  GeneratedColumn<String> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);

  GeneratedColumn<double> get price =>
      $composableBuilder(column: $table.price, builder: (column) => column);

  GeneratedColumn<String> get location =>
      $composableBuilder(column: $table.location, builder: (column) => column);

  GeneratedColumn<bool> get delivery =>
      $composableBuilder(column: $table.delivery, builder: (column) => column);

  GeneratedColumn<String> get imagePath =>
      $composableBuilder(column: $table.imagePath, builder: (column) => column);

  GeneratedColumn<String> get contact =>
      $composableBuilder(column: $table.contact, builder: (column) => column);
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
            Value<String> category = const Value.absent(),
            Value<double> price = const Value.absent(),
            Value<String> location = const Value.absent(),
            Value<bool> delivery = const Value.absent(),
            Value<String> imagePath = const Value.absent(),
            Value<String> contact = const Value.absent(),
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
            Value<int> id = const Value.absent(),
            required String title,
            required String description,
            required String category,
            required double price,
            required String location,
            Value<bool> delivery = const Value.absent(),
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
  Value<String> role,
  Value<int> id,
  required String fullName,
  required String farmingType,
  Value<String?> email,
  Value<String?> phoneNumber,
  Value<String?> location,
  Value<String?> profileImage,
});
typedef $$UserProfilesTableUpdateCompanionBuilder = UserProfilesCompanion
    Function({
  Value<String> role,
  Value<int> id,
  Value<String> fullName,
  Value<String> farmingType,
  Value<String?> email,
  Value<String?> phoneNumber,
  Value<String?> location,
  Value<String?> profileImage,
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
  ColumnFilters<String> get role => $composableBuilder(
      column: $table.role, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get fullName => $composableBuilder(
      column: $table.fullName, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get farmingType => $composableBuilder(
      column: $table.farmingType, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get email => $composableBuilder(
      column: $table.email, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get phoneNumber => $composableBuilder(
      column: $table.phoneNumber, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get location => $composableBuilder(
      column: $table.location, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get profileImage => $composableBuilder(
      column: $table.profileImage, builder: (column) => ColumnFilters(column));
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
  ColumnOrderings<String> get role => $composableBuilder(
      column: $table.role, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get fullName => $composableBuilder(
      column: $table.fullName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get farmingType => $composableBuilder(
      column: $table.farmingType, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get email => $composableBuilder(
      column: $table.email, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get phoneNumber => $composableBuilder(
      column: $table.phoneNumber, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get location => $composableBuilder(
      column: $table.location, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get profileImage => $composableBuilder(
      column: $table.profileImage,
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
  GeneratedColumn<String> get role =>
      $composableBuilder(column: $table.role, builder: (column) => column);

  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get fullName =>
      $composableBuilder(column: $table.fullName, builder: (column) => column);

  GeneratedColumn<String> get farmingType => $composableBuilder(
      column: $table.farmingType, builder: (column) => column);

  GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);

  GeneratedColumn<String> get phoneNumber => $composableBuilder(
      column: $table.phoneNumber, builder: (column) => column);

  GeneratedColumn<String> get location =>
      $composableBuilder(column: $table.location, builder: (column) => column);

  GeneratedColumn<String> get profileImage => $composableBuilder(
      column: $table.profileImage, builder: (column) => column);
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
            Value<String> role = const Value.absent(),
            Value<int> id = const Value.absent(),
            Value<String> fullName = const Value.absent(),
            Value<String> farmingType = const Value.absent(),
            Value<String?> email = const Value.absent(),
            Value<String?> phoneNumber = const Value.absent(),
            Value<String?> location = const Value.absent(),
            Value<String?> profileImage = const Value.absent(),
          }) =>
              UserProfilesCompanion(
            role: role,
            id: id,
            fullName: fullName,
            farmingType: farmingType,
            email: email,
            phoneNumber: phoneNumber,
            location: location,
            profileImage: profileImage,
          ),
          createCompanionCallback: ({
            Value<String> role = const Value.absent(),
            Value<int> id = const Value.absent(),
            required String fullName,
            required String farmingType,
            Value<String?> email = const Value.absent(),
            Value<String?> phoneNumber = const Value.absent(),
            Value<String?> location = const Value.absent(),
            Value<String?> profileImage = const Value.absent(),
          }) =>
              UserProfilesCompanion.insert(
            role: role,
            id: id,
            fullName: fullName,
            farmingType: farmingType,
            email: email,
            phoneNumber: phoneNumber,
            location: location,
            profileImage: profileImage,
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
typedef $$DonationsTableCreateCompanionBuilder = DonationsCompanion Function({
  Value<int> id,
  required String title,
  required String description,
  required String category,
  required String location,
  required String contact,
  Value<String?> donorName,
  Value<String?> imagePath,
  Value<DateTime> dateAdded,
});
typedef $$DonationsTableUpdateCompanionBuilder = DonationsCompanion Function({
  Value<int> id,
  Value<String> title,
  Value<String> description,
  Value<String> category,
  Value<String> location,
  Value<String> contact,
  Value<String?> donorName,
  Value<String?> imagePath,
  Value<DateTime> dateAdded,
});

class $$DonationsTableFilterComposer
    extends Composer<_$LocalDatabase, $DonationsTable> {
  $$DonationsTableFilterComposer({
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

  ColumnFilters<String> get category => $composableBuilder(
      column: $table.category, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get location => $composableBuilder(
      column: $table.location, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get contact => $composableBuilder(
      column: $table.contact, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get donorName => $composableBuilder(
      column: $table.donorName, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get imagePath => $composableBuilder(
      column: $table.imagePath, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get dateAdded => $composableBuilder(
      column: $table.dateAdded, builder: (column) => ColumnFilters(column));
}

class $$DonationsTableOrderingComposer
    extends Composer<_$LocalDatabase, $DonationsTable> {
  $$DonationsTableOrderingComposer({
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

  ColumnOrderings<String> get category => $composableBuilder(
      column: $table.category, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get location => $composableBuilder(
      column: $table.location, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get contact => $composableBuilder(
      column: $table.contact, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get donorName => $composableBuilder(
      column: $table.donorName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get imagePath => $composableBuilder(
      column: $table.imagePath, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get dateAdded => $composableBuilder(
      column: $table.dateAdded, builder: (column) => ColumnOrderings(column));
}

class $$DonationsTableAnnotationComposer
    extends Composer<_$LocalDatabase, $DonationsTable> {
  $$DonationsTableAnnotationComposer({
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

  GeneratedColumn<String> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);

  GeneratedColumn<String> get location =>
      $composableBuilder(column: $table.location, builder: (column) => column);

  GeneratedColumn<String> get contact =>
      $composableBuilder(column: $table.contact, builder: (column) => column);

  GeneratedColumn<String> get donorName =>
      $composableBuilder(column: $table.donorName, builder: (column) => column);

  GeneratedColumn<String> get imagePath =>
      $composableBuilder(column: $table.imagePath, builder: (column) => column);

  GeneratedColumn<DateTime> get dateAdded =>
      $composableBuilder(column: $table.dateAdded, builder: (column) => column);
}

class $$DonationsTableTableManager extends RootTableManager<
    _$LocalDatabase,
    $DonationsTable,
    Donation,
    $$DonationsTableFilterComposer,
    $$DonationsTableOrderingComposer,
    $$DonationsTableAnnotationComposer,
    $$DonationsTableCreateCompanionBuilder,
    $$DonationsTableUpdateCompanionBuilder,
    (Donation, BaseReferences<_$LocalDatabase, $DonationsTable, Donation>),
    Donation,
    PrefetchHooks Function()> {
  $$DonationsTableTableManager(_$LocalDatabase db, $DonationsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DonationsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DonationsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DonationsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<String> description = const Value.absent(),
            Value<String> category = const Value.absent(),
            Value<String> location = const Value.absent(),
            Value<String> contact = const Value.absent(),
            Value<String?> donorName = const Value.absent(),
            Value<String?> imagePath = const Value.absent(),
            Value<DateTime> dateAdded = const Value.absent(),
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
            Value<int> id = const Value.absent(),
            required String title,
            required String description,
            required String category,
            required String location,
            required String contact,
            Value<String?> donorName = const Value.absent(),
            Value<String?> imagePath = const Value.absent(),
            Value<DateTime> dateAdded = const Value.absent(),
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
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$DonationsTableProcessedTableManager = ProcessedTableManager<
    _$LocalDatabase,
    $DonationsTable,
    Donation,
    $$DonationsTableFilterComposer,
    $$DonationsTableOrderingComposer,
    $$DonationsTableAnnotationComposer,
    $$DonationsTableCreateCompanionBuilder,
    $$DonationsTableUpdateCompanionBuilder,
    (Donation, BaseReferences<_$LocalDatabase, $DonationsTable, Donation>),
    Donation,
    PrefetchHooks Function()>;

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

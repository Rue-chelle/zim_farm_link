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
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
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
        delivery,
        createdAt
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
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
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
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
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
  final DateTime createdAt;
  const Listing(
      {required this.id,
      required this.title,
      required this.description,
      required this.imagePath,
      required this.price,
      required this.location,
      required this.category,
      required this.contact,
      required this.delivery,
      required this.createdAt});
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
    map['created_at'] = Variable<DateTime>(createdAt);
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
      createdAt: Value(createdAt),
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
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
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
      'createdAt': serializer.toJson<DateTime>(createdAt),
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
          bool? delivery,
          DateTime? createdAt}) =>
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
        createdAt: createdAt ?? this.createdAt,
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
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
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
          ..write('delivery: $delivery, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title, description, imagePath, price,
      location, category, contact, delivery, createdAt);
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
          other.delivery == this.delivery &&
          other.createdAt == this.createdAt);
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
  final Value<DateTime> createdAt;
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
    this.createdAt = const Value.absent(),
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
    this.createdAt = const Value.absent(),
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
    Expression<DateTime>? createdAt,
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
      if (createdAt != null) 'created_at': createdAt,
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
      Value<bool>? delivery,
      Value<DateTime>? createdAt}) {
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
      createdAt: createdAt ?? this.createdAt,
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
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
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
          ..write('delivery: $delivery, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

abstract class _$LocalDatabase extends GeneratedDatabase {
  _$LocalDatabase(QueryExecutor e) : super(e);
  $LocalDatabaseManager get managers => $LocalDatabaseManager(this);
  late final $ListingsTable listings = $ListingsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [listings];
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
  Value<DateTime> createdAt,
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
  Value<DateTime> createdAt,
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

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));
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

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));
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

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
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
            Value<DateTime> createdAt = const Value.absent(),
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
            createdAt: createdAt,
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
            Value<DateTime> createdAt = const Value.absent(),
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
            createdAt: createdAt,
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

class $LocalDatabaseManager {
  final _$LocalDatabase _db;
  $LocalDatabaseManager(this._db);
  $$ListingsTableTableManager get listings =>
      $$ListingsTableTableManager(_db, _db.listings);
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  TicketDao? _ticketDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `ticket` (`id` TEXT NOT NULL, `checkin_at` INTEGER NOT NULL, `user_id` TEXT NOT NULL, `added_at` INTEGER NOT NULL, `is_checkin` INTEGER NOT NULL, `tourism` TEXT NOT NULL, `qty` INTEGER NOT NULL, `totalprice` INTEGER NOT NULL, `imageUrl` TEXT NOT NULL, PRIMARY KEY (`id`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  TicketDao get ticketDao {
    return _ticketDaoInstance ??= _$TicketDao(database, changeListener);
  }
}

class _$TicketDao extends TicketDao {
  _$TicketDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _ticketModelInsertionAdapter = InsertionAdapter(
            database,
            'ticket',
            (TicketModel item) => <String, Object?>{
                  'id': item.id,
                  'checkin_at': _dateTimeConverter.encode(item.checkin_at),
                  'user_id': item.user_id,
                  'added_at': _dateTimeConverter.encode(item.added_at),
                  'is_checkin': item.is_checkin ? 1 : 0,
                  'tourism': item.tourism,
                  'qty': item.qty,
                  'totalprice': item.totalprice,
                  'imageUrl': item.imageUrl
                }),
        _ticketModelDeletionAdapter = DeletionAdapter(
            database,
            'ticket',
            ['id'],
            (TicketModel item) => <String, Object?>{
                  'id': item.id,
                  'checkin_at': _dateTimeConverter.encode(item.checkin_at),
                  'user_id': item.user_id,
                  'added_at': _dateTimeConverter.encode(item.added_at),
                  'is_checkin': item.is_checkin ? 1 : 0,
                  'tourism': item.tourism,
                  'qty': item.qty,
                  'totalprice': item.totalprice,
                  'imageUrl': item.imageUrl
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<TicketModel> _ticketModelInsertionAdapter;

  final DeletionAdapter<TicketModel> _ticketModelDeletionAdapter;

  @override
  Future<List<TicketModel>> findAllTicket() async {
    return _queryAdapter.queryList('SELECT * FROM Ticket',
        mapper: (Map<String, Object?> row) => TicketModel(
            id: row['id'] as String,
            checkin_at: _dateTimeConverter.decode(row['checkin_at'] as int),
            user_id: row['user_id'] as String,
            added_at: _dateTimeConverter.decode(row['added_at'] as int),
            is_checkin: (row['is_checkin'] as int) != 0,
            tourism: row['tourism'] as String,
            qty: row['qty'] as int,
            totalprice: row['totalprice'] as int,
            imageUrl: row['imageUrl'] as String));
  }

  @override
  Future<TicketModel?> findTicketById(String id) async {
    return _queryAdapter.query('SELECT * FROM Ticket WHERE id = ?1',
        mapper: (Map<String, Object?> row) => TicketModel(
            id: row['id'] as String,
            checkin_at: _dateTimeConverter.decode(row['checkin_at'] as int),
            user_id: row['user_id'] as String,
            added_at: _dateTimeConverter.decode(row['added_at'] as int),
            is_checkin: (row['is_checkin'] as int) != 0,
            tourism: row['tourism'] as String,
            qty: row['qty'] as int,
            totalprice: row['totalprice'] as int,
            imageUrl: row['imageUrl'] as String),
        arguments: [id]);
  }

  @override
  Future<void> insertTicket(TicketModel ticket) async {
    await _ticketModelInsertionAdapter.insert(ticket, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteTicket(TicketModel ticket) async {
    await _ticketModelDeletionAdapter.delete(ticket);
  }
}

// ignore_for_file: unused_element
final _dateTimeConverter = DateTimeConverter();

import 'dart:async';

import 'package:floor/floor.dart';

import 'package:kembang_belor_apps/features/payment/data/data_source/local/DAO/ticket_dao.dart';
import 'package:kembang_belor_apps/features/payment/data/models/ticket.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'app_database.g.dart';

@TypeConverters([DateTimeConverter])
@Database(version: 1, entities: [TicketModel])
abstract class AppDatabase extends FloorDatabase {
  TicketDao get ticketDao;
}

class DateTimeConverter extends TypeConverter<DateTime, int> {
  @override
  DateTime decode(int databaseValue) {
    return DateTime.fromMillisecondsSinceEpoch(databaseValue);
  }

  @override
  int encode(DateTime value) {
    return value.millisecondsSinceEpoch;
  }
}

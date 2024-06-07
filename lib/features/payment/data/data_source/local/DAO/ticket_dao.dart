import 'package:floor/floor.dart';
import 'package:kembang_belor_apps/features/payment/data/models/ticket.dart';

@dao
abstract class TicketDao {
  @Query('SELECT * FROM Ticket')
  Future<List<TicketModel>> findAllTicket();

  @Query('SELECT * FROM Ticket WHERE id = :id')
  Future<TicketModel?> findTicketById(String id);

  @insert
  Future<void> insertTicket(TicketModel ticket);

  @delete
  Future<void> deleteTicket(TicketModel ticket);
}

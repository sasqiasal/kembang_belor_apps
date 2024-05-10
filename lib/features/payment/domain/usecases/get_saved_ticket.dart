import 'package:kembang_belor_apps/core/usecase/use_case.dart';
import 'package:kembang_belor_apps/features/payment/domain/entity/ticket.dart';
import 'package:kembang_belor_apps/features/payment/domain/repository/payment_repository.dart';

class GetSavedTicketsUseCase implements UseCase<List<TicketEntity>, void> {
  final PaymentRepository _repository;

  GetSavedTicketsUseCase(this._repository);
  @override
  Future<List<TicketEntity>> call({void params}) {
    return _repository.getSavedTickets();
  }
}

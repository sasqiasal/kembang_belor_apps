import 'package:kembang_belor_apps/core/usecase/use_case.dart';
import 'package:kembang_belor_apps/features/payment/domain/entity/ticket.dart';
import 'package:kembang_belor_apps/features/payment/domain/repository/payment_repository.dart';

class InsertTicketUseCase implements UseCase<void, TicketEntity> {
  final PaymentRepository _repository;

  InsertTicketUseCase(this._repository);
  @override
  Future<void> call({TicketEntity? params}) {
    return _repository.saveTicket(params!);
  }
}

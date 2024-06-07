import 'package:kembang_belor_apps/core/resources/data_state/data_state.dart';
import 'package:kembang_belor_apps/core/usecase/use_case.dart';
import 'package:kembang_belor_apps/features/payment/domain/entity/ticket.dart';
import 'package:kembang_belor_apps/features/payment/domain/repository/payment_repository.dart';

class GetMyTicketUseCase
    implements UseCase<DataState<List<TicketEntity>>, String?> {
  final PaymentRepository _repository;

  GetMyTicketUseCase(this._repository);

  @override
  Future<DataState<List<TicketEntity>>> call({String? params}) {
    return _repository.getMyTicket(uuid: params!);
  }
}

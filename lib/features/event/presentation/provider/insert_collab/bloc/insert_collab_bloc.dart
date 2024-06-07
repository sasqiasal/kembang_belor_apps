import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kembang_belor_apps/features/event/domain/entities/vendor_collab.dart';
import 'package:kembang_belor_apps/features/event/domain/usecase/insert_vendor.dart';

part 'insert_collab_event.dart';
part 'insert_collab_state.dart';

class InsertCollabBloc extends Bloc<InsertCollabEvent, InsertCollabState> {
  final InsertVendorCollabsUseCase usecase;
  InsertCollabBloc(this.usecase) : super(InsertCollabInitial()) {
    on<InsertCollab>(_insertCollab);
  }

  void _insertCollab(
      InsertCollab event, Emitter<InsertCollabState> emit) async {
    emit(InsertCollabLoading());

    try {
      await usecase(params: event.entity);
      emit(InsertCollabSuccess());
    } catch (e) {
      emit(InsertCollabFailure());
    }
  }
}

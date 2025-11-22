import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/usecases/usecase.dart';
import '../../domain/usecases/get_dashboard_data.dart';
import 'dashboard_event.dart';
import 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  final GetDashboardData getDashboardData;

  DashboardBloc({required this.getDashboardData}) : super(DashboardInitial()) {
    on<DashboardLoadRequested>(_onDashboardLoadRequested);
  }

  Future<void> _onDashboardLoadRequested(
    DashboardLoadRequested event,
    Emitter<DashboardState> emit,
  ) async {
    emit(DashboardLoading());
    final result = await getDashboardData(NoParams());
    result.fold(
      (failure) => emit(const DashboardError('Failed to load dashboard data')),
      (data) => emit(DashboardLoaded(data)),
    );
  }
}

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecases/get_fund_details.dart';
import 'fund_details_event.dart';
import 'fund_details_state.dart';

class FundDetailsBloc extends Bloc<FundDetailsEvent, FundDetailsState> {
  final GetFundDetails getFundDetails;

  FundDetailsBloc({required this.getFundDetails})
      : super(FundDetailsInitial()) {
    on<LoadFundDetails>(_onLoadFundDetails);
  }

  Future<void> _onLoadFundDetails(
    LoadFundDetails event,
    Emitter<FundDetailsState> emit,
  ) async {
    emit(FundDetailsLoading());
    final result = await getFundDetails(
      GetFundDetailsParams(timePeriod: event.timePeriod),
    );

    result.fold(
      (failure) => emit(FundDetailsError(failure.message)),
      (fundDetails) => emit(FundDetailsLoaded(
        fundDetails: fundDetails,
        selectedTimePeriod: event.timePeriod,
      )),
    );
  }
}

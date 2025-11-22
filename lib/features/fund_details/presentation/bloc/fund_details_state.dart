import 'package:equatable/equatable.dart';

import '../../domain/entities/fund_details.dart';

abstract class FundDetailsState extends Equatable {
  const FundDetailsState();

  @override
  List<Object> get props => [];
}

class FundDetailsInitial extends FundDetailsState {}

class FundDetailsLoading extends FundDetailsState {}

class FundDetailsLoaded extends FundDetailsState {
  final FundDetails fundDetails;
  final String selectedTimePeriod;

  const FundDetailsLoaded({
    required this.fundDetails,
    required this.selectedTimePeriod,
  });

  @override
  List<Object> get props => [fundDetails, selectedTimePeriod];
}

class FundDetailsError extends FundDetailsState {
  final String message;

  const FundDetailsError(this.message);

  @override
  List<Object> get props => [message];
}

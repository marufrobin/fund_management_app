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
  final bool isLoading;

  const FundDetailsLoaded({
    required this.fundDetails,
    required this.selectedTimePeriod,
    this.isLoading = false,
  });

  FundDetailsLoaded copyWith({
    FundDetails? fundDetails,
    String? selectedTimePeriod,
    bool? isLoading,
  }) {
    return FundDetailsLoaded(
      fundDetails: fundDetails ?? this.fundDetails,
      selectedTimePeriod: selectedTimePeriod ?? this.selectedTimePeriod,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object> get props => [fundDetails, selectedTimePeriod, isLoading];
}

class FundDetailsError extends FundDetailsState {
  final String message;

  const FundDetailsError(this.message);

  @override
  List<Object> get props => [message];
}

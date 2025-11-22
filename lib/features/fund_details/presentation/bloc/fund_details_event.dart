import 'package:equatable/equatable.dart';

abstract class FundDetailsEvent extends Equatable {
  const FundDetailsEvent();

  @override
  List<Object> get props => [];
}

class LoadFundDetails extends FundDetailsEvent {
  final String timePeriod;

  const LoadFundDetails([this.timePeriod = '6M']);

  @override
  List<Object> get props => [timePeriod];
}

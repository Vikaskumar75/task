part of 'stocks_cubit.dart';

@immutable
abstract class StocksState extends Equatable {
  @override
  List<Object?> get props => <Object>[];
}

class StocksInitial extends StocksState {}

class StocksLoading extends StocksState {}

class StocksLoaded extends StocksState {
  StocksLoaded({
    required this.stocks,
  });
  final StockList stocks;

  @override
  List<StockList> get props => <StockList>[stocks];
}

class StocksError extends StocksState {
  StocksError(this.error);
  final Failure error;

  @override
  List<Failure> get props => <Failure>[error];
}

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';
import '../../data/repository/stock_list_model.dart';
import '../../data/service/stock_service.dart';
import '../../utils/handle_error.dart';

part 'stocks_state.dart';

class StocksCubit extends Cubit<StocksState> {
  StocksCubit() : super(StocksInitial());

  TextEditingController fromDate = TextEditingController();
  TextEditingController toDate = TextEditingController();
  final int _userId = 1;

  Future<void> getStockList() async {
    emit(StocksLoading());
    Stock.getStock(
      fromDate: fromDate.text,
      toDate: toDate.text,
      userId: _userId,
    ).then(
      (StockList value) => emit(StocksLoaded(stocks: value)),
      onError: (dynamic err, StackTrace stackTrace) => emit(
        StocksError(handleError(err)),
      ),
    );
  }

  void resetState() => emit(StocksInitial());

  @override
  void onChange(Change<StocksState> change) {
    print(change);
    super.onChange(change);
  }
}

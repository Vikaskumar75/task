import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'stocks_loaded.dart';
import '../../logic/stocks/stocks_cubit.dart';
import '../../utils/adaptive_text.dart';
import 'initial_widget.dart';

class StocksScreen extends StatelessWidget {
  const StocksScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AdaptiveText('Stocks'),
        centerTitle: true,
        elevation: 2,
      ),
      body: BlocBuilder<StocksCubit, StocksState>(
        builder: (BuildContext context, StocksState state) {
          if (state is StocksLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is StocksLoaded) {
            return StocksLoadedWidget(state: state);
          } else if (state is StocksError) {
            return Center(
              child: AdaptiveText(state.error.message),
            );
          } else {
            return InitialWidget();
          }
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../logic/stocks/stocks_cubit.dart';
import '../../utils/adaptive_text.dart';
import 'order_info.dart';

class StocksLoadedWidget extends StatelessWidget {
  const StocksLoadedWidget({
    Key? key,
    required this.state,
  }) : super(key: key);
  final StocksLoaded state;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ListView.separated(
          itemCount: state.stocks.data.length,
          separatorBuilder: (BuildContext context, int index) {
            return Divider();
          },
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 2,
                child: ListTile(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return OrderInfo(state: state.stocks.data[index]);
                      },
                    );
                  },
                  title: AdaptiveText(
                    state.stocks.data[index].customerName,
                  ),
                  subtitle: AdaptiveText(
                    state.stocks.data[index].pickingDate.split(' ').first,
                  ),
                  trailing: AdaptiveText(
                    state.stocks.data[index].totalPickQuantity,
                    style: Theme.of(context).textTheme.headline5,
                  ),
                ),
              ),
            );
          },
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () =>
                  BlocProvider.of<StocksCubit>(context).resetState(),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                  Theme.of(context).primaryColor,
                ),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              child: Container(
                height: 40,
                alignment: Alignment.center,
                width: double.infinity,
                child: AdaptiveText('Select again'),
              ),
            ),
          ),
        )
      ],
    );
  }
}

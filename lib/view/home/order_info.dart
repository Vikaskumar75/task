import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/logic/scanning/scanning_cubit.dart';
import '../../data/repository/stock_list_model.dart';
import '../../utils/adaptive_text.dart';

class OrderInfo extends StatelessWidget {
  const OrderInfo({
    Key? key,
    required this.state,
  }) : super(key: key);
  final Datum state;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ScanningCubit>(
      create: (BuildContext context) => ScanningCubit(),
      child: Builder(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
              title: const AdaptiveText('Products'),
              centerTitle: true,
              elevation: 2,
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 10.0,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  AdaptiveText(
                    state.customerName,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  SizedBox(height: 10),
                  AdaptiveText(
                    'Total quantity: ${state.totalPickQuantity}',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  SizedBox(height: 10),
                  AdaptiveText(
                    state.description,
                    style: Theme.of(context).textTheme.bodyText2,
                    textAlign: TextAlign.center,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      AdaptiveText(
                        'Pick date: ${state.pickingDate.split(' ').first}',
                        style: Theme.of(context).textTheme.bodyText2,
                        textAlign: TextAlign.center,
                      ),
                      AdaptiveText(
                        'OrderId: ${state.salesOrderId}',
                        style: Theme.of(context).textTheme.bodyText2,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  Expanded(
                      child: BlocConsumer<ScanningCubit, List<int>>(
                    listener: (context, scannedQuantity) {
                      int totalQuantity = 0;
                      for (var i = 0; i < scannedQuantity.length; i++) {
                        totalQuantity += scannedQuantity[i];
                      }
                      print(totalQuantity);
                      print(
                          int.parse(state.totalPickQuantity) == totalQuantity);

                      if (int.parse(state.totalPickQuantity) == totalQuantity) {
                        Navigator.pop(context);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: AdaptiveText('order scanned successfully'),
                          ),
                        );
                      }
                    },
                    bloc: BlocProvider.of<ScanningCubit>(context)
                      ..getQuantitylength(state),
                    builder: (context, scannedQuantity) {
                      return ListView.builder(
                        shrinkWrap: true,
                        itemCount: state.itemDetails.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ListTile(
                            onTap: () {
                              BlocProvider.of<ScanningCubit>(context)
                                  .updateScannedQuantity(index, state);
                            },
                            title: Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: AdaptiveText(
                                state.itemDetails[index].itemName,
                                maxLines: 1,
                              ),
                            ),
                            subtitle: AdaptiveText(
                              '${scannedQuantity[index]}/${state.itemDetails[index].pickingQty}',
                            ),
                            trailing: AdaptiveText(
                              '${state.itemDetails[index].productCode}',
                            ),
                          );
                        },
                      );
                    },
                  ))
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

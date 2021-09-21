import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../logic/stocks/stocks_cubit.dart';
import '../../utils/adaptive_text.dart';

import 'date_picker_text_fields.dart';

class InitialWidget extends StatelessWidget {
  const InitialWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final StocksCubit stockCubit = BlocProvider.of<StocksCubit>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          DatePickerTextFields(
            controller: stockCubit.fromDate,
            labelText: 'From',
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.04,
          ),
          DatePickerTextFields(
            controller: stockCubit.toDate,
            labelText: 'To',
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.04,
          ),
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.05,
            child: ElevatedButton(
              onPressed: () {
                stockCubit.getStockList();
              },
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
              child: AdaptiveText('Fetch stock'),
            ),
          )
        ],
      ),
    );
  }
}

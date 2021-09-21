import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'logic/scanning/scanning_cubit.dart';
import 'logic/stocks/stocks_cubit.dart';

import 'view/home/stocks_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<StocksCubit>(
          create: (BuildContext context) => StocksCubit(),
        ),
        
      ],
      child: MaterialApp(
        title: 'Task',
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.dark,
        theme: ThemeData(
          primaryColor: Colors.teal[600],
          accentColor: Colors.white,
        ),
        home: StocksScreen(),
      ),
    );
  }
}

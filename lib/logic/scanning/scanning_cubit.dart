import 'package:bloc/bloc.dart';
import 'package:task/data/repository/stock_list_model.dart';
import 'package:task/data/service/scanning_service.dart';


class ScanningCubit extends Cubit<List<int>> {
  ScanningCubit() : super(<int>[]);
  final List<int> scannedQuantity = <int>[];

  final List<String> barCodes = <String>[
    'P@UK0251@150921UN1000000020',
    'P@UK0251@150921UN1000000022',
    'P@UK0251@150921UN1000000022'
  ];

  void getQuantitylength(Datum model) {
    for (int i = 0; i < model.itemDetails.length; i++) {
      scannedQuantity.insert(i, 0);
    }
    emit(scannedQuantity);
  }

  void updateScannedQuantity(int index, Datum model) {
    if (scannedQuantity[index] <
        int.parse(model.itemDetails[index].pickingQty)) {
      int temp = scannedQuantity[index] + 1;
      scannedQuantity.removeAt(index);
      scannedQuantity.insert(index, temp);
      Scanning.scan(
              barCode: barCodes[index], pickListNo: model.pickingNo, userId: 1)
          .then((value) {
        if (value.statusCode == 200) {
          emit([]);
          emit(scannedQuantity);
        }
      });
    }
  }
}

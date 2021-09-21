import 'package:http/http.dart' as http;

import '../repository/stock_list_model.dart';

class Stock {
  static Future<StockList> getStock({
    required String fromDate,
    required String toDate,
    required int userId,
  }) async {
    final Uri url = Uri.parse(
      'http://67.211.45.136:3039/api/APIPickList?FromeDate=$fromDate&ToDate=$toDate&UserId=$userId',
    );
    final http.Response response = await http.get(url);
    if (response.statusCode < 200 || response.statusCode >= 300) {
      throw response;
    }
    return stockListFromJson(response.body);
  }
}

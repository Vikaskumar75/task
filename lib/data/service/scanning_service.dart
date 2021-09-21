import 'package:http/http.dart' as http;

class Scanning {
  static Future<http.Response> scan({
    required String barCode,
    required String pickListNo,
    required int userId,
  }) async {
    final Uri url = Uri.parse(
      'http://67.211.45.136:3039/api/APIPickList?StockOutBarcode=$barCode&PickListNo=$pickListNo&UserId=$userId&type=PickingStockOut',
    );
    final http.Response response = await http.get(url);
    return response;
  }
}

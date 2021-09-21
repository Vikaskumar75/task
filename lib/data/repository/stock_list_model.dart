import 'dart:convert';

StockList stockListFromJson(String str) => StockList.fromJson(json.decode(str));

String stockListToJson(StockList data) => json.encode(data.toJson());

class StockList {
    StockList({
        required this.status,
        required this.msg,
        required this.data,
    });

    final int status;
    final String msg;
    final List<Datum> data;

    StockList copyWith({
        int? status,
        String? msg,
        List<Datum>? data,
    }) => 
        StockList(
            status: status ?? this.status,
            msg: msg ?? this.msg,
            data: data ?? this.data,
        );

    factory StockList.fromJson(Map<String, dynamic> json) => StockList(
        status: json["Status"],
        msg: json["msg"],
        data: List<Datum>.from(json["Data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "Status": status,
        "msg": msg,
        "Data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    Datum({
        required this.pickingId,
        required this.pickingNo,
        required this.pickingDate,
        required this.salesOrderId,
        required this.description,
        required this.customerName,
        required this.totalPickQuantity,
        required this.dispatchQty,
        required this.stockOutQty,
        required this.itemDetails,
    });

    final String pickingId;
    final String pickingNo;
    final String pickingDate;
    final String salesOrderId;
    final String description;
    final String customerName;
    final String totalPickQuantity;
    final String dispatchQty;
    final String stockOutQty;
    final List<ItemDetail> itemDetails;

    Datum copyWith({
        String? pickingId,
        String? pickingNo,
        String? pickingDate,
        String? salesOrderId,
        String? description,
        String? customerName,
        String? totalPickQuantity,
        String? dispatchQty,
        String? stockOutQty,
        List<ItemDetail>? itemDetails,
    }) => 
        Datum(
            pickingId: pickingId ?? this.pickingId,
            pickingNo: pickingNo ?? this.pickingNo,
            pickingDate: pickingDate ?? this.pickingDate,
            salesOrderId: salesOrderId ?? this.salesOrderId,
            description: description ?? this.description,
            customerName: customerName ?? this.customerName,
            totalPickQuantity: totalPickQuantity ?? this.totalPickQuantity,
            dispatchQty: dispatchQty ?? this.dispatchQty,
            stockOutQty: stockOutQty ?? this.stockOutQty,
            itemDetails: itemDetails ?? this.itemDetails,
        );

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        pickingId: json["PickingId"],
        pickingNo: json["PickingNo"],
        pickingDate: json["PickingDate"],
        salesOrderId: json["SalesOrderId"],
        description: json["Description"],
        customerName: json["CustomerName"],
        totalPickQuantity: json["TotalPickQuantity"],
        dispatchQty: json["DispatchQty"],
        stockOutQty: json["StockOutQty"],
        itemDetails: List<ItemDetail>.from(json["ItemDetails"].map((x) => ItemDetail.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "PickingId": pickingId,
        "PickingNo": pickingNo,
        "PickingDate": pickingDate,
        "SalesOrderId": salesOrderId,
        "Description": description,
        "CustomerName": customerName,
        "TotalPickQuantity": totalPickQuantity,
        "DispatchQty": dispatchQty,
        "StockOutQty": stockOutQty,
        "ItemDetails": List<dynamic>.from(itemDetails.map((x) => x.toJson())),
    };
}

class ItemDetail {
    ItemDetail({
        required this.pickingDetailsId,
        required this.pickingId,
        required this.pickingQty,
        required this.stockOutQty,
        required this.stockOutStatus,
        required this.dispatchQty,
        required this.dispatchStatus,
        required this.productCode,
        required this.itemName,
    });

    final String pickingDetailsId;
    final String pickingId;
    final String pickingQty;
    final String stockOutQty;
    final String stockOutStatus;
    final String dispatchQty;
    final String dispatchStatus;
    final String productCode;
    final String itemName;

    ItemDetail copyWith({
        String? pickingDetailsId,
        String? pickingId,
        String? pickingQty,
        String? stockOutQty,
        String? stockOutStatus,
        String? dispatchQty,
        String? dispatchStatus,
        String? productCode,
        String? itemName,
    }) => 
        ItemDetail(
            pickingDetailsId: pickingDetailsId ?? this.pickingDetailsId,
            pickingId: pickingId ?? this.pickingId,
            pickingQty: pickingQty ?? this.pickingQty,
            stockOutQty: stockOutQty ?? this.stockOutQty,
            stockOutStatus: stockOutStatus ?? this.stockOutStatus,
            dispatchQty: dispatchQty ?? this.dispatchQty,
            dispatchStatus: dispatchStatus ?? this.dispatchStatus,
            productCode: productCode ?? this.productCode,
            itemName: itemName ?? this.itemName,
        );

    factory ItemDetail.fromJson(Map<String, dynamic> json) => ItemDetail(
        pickingDetailsId: json["PickingDetailsId"],
        pickingId: json["PickingId"],
        pickingQty: json["PickingQty"],
        stockOutQty: json["StockOutQty"],
        stockOutStatus: json["StockOutStatus"],
        dispatchQty: json["DispatchQty"],
        dispatchStatus: json["DispatchStatus"],
        productCode: json["ProductCode"],
        itemName: json["ItemName"],
    );

    Map<String, dynamic> toJson() => {
        "PickingDetailsId": pickingDetailsId,
        "PickingId": pickingId,
        "PickingQty": pickingQty,
        "StockOutQty": stockOutQty,
        "StockOutStatus": stockOutStatus,
        "DispatchQty": dispatchQty,
        "DispatchStatus": dispatchStatus,
        "ProductCode": productCode,
        "ItemName": itemName,
    };
}


class Invoice {
  String? id;
  String? sellInvoiceId;
  String? sellInvoiceCode;
  String? sellInvoiceDate;
  String? customerName;
  String? customerCode;
  String? vehicleName;
  String? vehicleCode;
  int? totalPrice;
  int? totalPriceWhenUsingBuyPrices;
  int? tax;
  int? discount;
  int? toPay;
  int? toPayWhenUsingBuyPrices;
  bool? useBuyPrice;

  Invoice({this.id, this.sellInvoiceId, this.sellInvoiceCode, this.sellInvoiceDate, this.customerName, this.customerCode, this.vehicleName, this.vehicleCode, this.totalPrice, this.totalPriceWhenUsingBuyPrices, this.tax, this.discount, this.toPay, this.toPayWhenUsingBuyPrices, this.useBuyPrice});

  Invoice.fromJson(Map<String, dynamic> json) {
    if(json["id"] is String) {
      id = json["id"];
    }
    if(json["sellInvoiceId"] is String) {
      sellInvoiceId = json["sellInvoiceId"];
    }
    if(json["sellInvoiceCode"] is String) {
      sellInvoiceCode = json["sellInvoiceCode"];
    }
    if(json["sellInvoiceDate"] is String) {
      sellInvoiceDate = json["sellInvoiceDate"];
    }
    if(json["customerName"] is String) {
      customerName = json["customerName"];
    }
    if(json["customerCode"] is String) {
      customerCode = json["customerCode"];
    }
    if(json["vehicleName"] is String) {
      vehicleName = json["vehicleName"];
    }
    if(json["vehicleCode"] is String) {
      vehicleCode = json["vehicleCode"];
    }
    if(json["totalPrice"] is int) {
      totalPrice = json["totalPrice"];
    }
    if(json["totalPriceWhenUsingBuyPrices"] is int) {
      totalPriceWhenUsingBuyPrices = json["totalPriceWhenUsingBuyPrices"];
    }
    if(json["tax"] is int) {
      tax = json["tax"];
    }
    if(json["discount"] is int) {
      discount = json["discount"];
    }
    if(json["toPay"] is int) {
      toPay = json["toPay"];
    }
    if(json["toPayWhenUsingBuyPrices"] is int) {
      toPayWhenUsingBuyPrices = json["toPayWhenUsingBuyPrices"];
    }
    if(json["useBuyPrice"] is bool) {
      useBuyPrice = json["useBuyPrice"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["sellInvoiceId"] = sellInvoiceId;
    _data["sellInvoiceCode"] = sellInvoiceCode;
    _data["sellInvoiceDate"] = sellInvoiceDate;
    _data["customerName"] = customerName;
    _data["customerCode"] = customerCode;
    _data["vehicleName"] = vehicleName;
    _data["vehicleCode"] = vehicleCode;
    _data["totalPrice"] = totalPrice;
    _data["totalPriceWhenUsingBuyPrices"] = totalPriceWhenUsingBuyPrices;
    _data["tax"] = tax;
    _data["discount"] = discount;
    _data["toPay"] = toPay;
    _data["toPayWhenUsingBuyPrices"] = toPayWhenUsingBuyPrices;
    _data["useBuyPrice"] = useBuyPrice;
    return _data;
  }
}
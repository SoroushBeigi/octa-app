import 'package:flutter/material.dart';
import 'package:octa/model/invoice_model.dart';
import 'package:octa/providers/api_provider.dart';

class HomeProvider extends ChangeNotifier {
  final _apiProvider = ApiProvider();
  bool isLoading = true;
  List<Invoice> invoices = [];
  Future<void> loadInvoices() async {
    invoices = await _apiProvider.loadInvoices() ?? [];
    isLoading=false;
    notifyListeners();
  }

  Future<void> loadWithButton()async{
    isLoading=true;
    notifyListeners();
    await loadInvoices();
  }
}

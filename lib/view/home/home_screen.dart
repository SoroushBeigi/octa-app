import 'package:flutter/material.dart';
import 'package:octa/providers/storage_provider.dart';
import 'package:octa/view-model/home_vm.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => HomeProvider(),
      builder: (context, child) => const _HomeScreen(),
    );
  }
}

class _HomeScreen extends StatefulWidget {
  const _HomeScreen({super.key});

  @override
  State<_HomeScreen> createState() => __HomeScreenState();
}

class __HomeScreenState extends State<_HomeScreen> {
  @override
  void initState() {
    super.initState();
    final provider = context.read<HomeProvider>();
    provider.loadInvoices();
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<HomeProvider>();
    return Scaffold(
      backgroundColor: const Color.fromRGBO(97, 97, 97, 1),
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        title: Text(
          'UserName: ${storage.userName}',
          style: const TextStyle(color: Colors.white),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => provider.loadWithButton(),
        child: const Icon(Icons.refresh),
      ),
      body: provider.isLoading
          ? const Center(
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            )
          : Center(
              child: RefreshIndicator(
                onRefresh: ()=>provider.loadWithButton(),
                child: ListView.builder(
                  
                    itemCount: provider.invoices.length,
                    itemBuilder: (context, index) {
                      final item = provider.invoices[index];
                      return Container(
                        margin: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(5)),
                          color: Colors.black.withOpacity(0.5),
                        ),
                        child: ListTile(
                          contentPadding: const EdgeInsets.all(8),
                          title: Text(
                            '\$${item.totalPrice}\nCustomer Name: ${item.customerName}',
                            style: const TextStyle(color: Colors.white),
                          ),
                          subtitle: Text(
                            'Vehicle Name: ${item.vehicleName}, Vehice Code: ${item.vehicleCode}',
                            style: TextStyle(color: Colors.grey[300]),
                          ),
                        ),
                      );
                    }),
              ),
            ),
    );
  }
}

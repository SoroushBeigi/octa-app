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
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<HomeProvider>();
    return Scaffold(
      appBar: AppBar(
        title: Text(storage.userName),
      ),
      body: Center(
        child: ListView.builder(
            itemCount: provider.invoices.length,
            itemBuilder: (context, index) {
              final item = provider.invoices[index];
              return ListTile(
                title: Text('\$${item.totalPrice}'),
                subtitle: Text('Vehicle Name: ${item.vehicleName} + Vehice Code: ${item.vehicleCode}'),
              );
            }),
      ),
    );
  }
}

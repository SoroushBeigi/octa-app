import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:octa/model/invoice_model.dart';
import 'package:octa/view-model/home_vm.dart';
import 'package:octa/view/home/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  testWidgets('HomeScreen displays loading indicator', (WidgetTester tester) async {
    final homeProvider = HomeProvider();
    homeProvider.isLoading = true;

    await tester.pumpWidget(
      MaterialApp(
        home: ChangeNotifierProvider.value(
          value: homeProvider,
          child: const HomeScreen(),
        ),
      ),
    );

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
    expect(find.text('UserName: '), findsNothing);
    expect(find.byType(ListView), findsNothing);
  });

  testWidgets('HomeScreen displays loaded data', (WidgetTester tester) async {
    final homeProvider = HomeProvider();
    homeProvider.isLoading = false;
    homeProvider.invoices = [
      Invoice(totalPrice: 100, customerName: 'John Doe', vehicleName: 'Car', vehicleCode: 'ABC123'),
    ];

    await tester.pumpWidget(
      MaterialApp(
        home: ChangeNotifierProvider.value(
          value: homeProvider,
          child: const HomeScreen(),
        ),
      ),
    );

    expect(find.byType(CircularProgressIndicator), findsNothing);
    expect(find.text('UserName: John Doe'), findsOneWidget);
    expect(find.byType(ListView), findsOneWidget);
    expect(find.text('Car'), findsOneWidget);
  });

  testWidgets('HomeScreen reloads data on button tap', (WidgetTester tester) async {
    final homeProvider = HomeProvider();
    homeProvider.isLoading = false;
    homeProvider.invoices = [
      Invoice(totalPrice: 100, customerName: 'John Doe', vehicleName: 'Car', vehicleCode: 'ABC123'),
    ];

    await tester.pumpWidget(
      MaterialApp(
        home: ChangeNotifierProvider.value(
          value: homeProvider,
          child: const HomeScreen(),
        ),
      ),
    );

    expect(find.byType(CircularProgressIndicator), findsNothing);
    expect(find.text('UserName: John Doe'), findsOneWidget);
    expect(find.byType(ListView), findsOneWidget);
    expect(find.text('Car'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.refresh));
    await tester.pump();

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
    expect(find.text('UserName: John Doe'), findsOneWidget);
    expect(find.byType(ListView), findsNothing);
  });
}

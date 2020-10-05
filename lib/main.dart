import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './pages/auth_page.dart';
import './pages/home_page.dart';
import './pages/money_transfer_page.dart';
import './pages/transaction_history_page.dart';
import './pages/welcome_page.dart';
import './pages/draw_funds_page.dart';
import './pages/deposit_cash_page.dart';
import './providers/auth_provider.dart';
import './providers/ui_operations_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AuthProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => UiControllerProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Mobile POS',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: WelcomePage(),
        routes: {
          HomePage.tag: (ctx) => HomePage(),
          WelcomePage.tag: (ctx) => WelcomePage(),
          AuthPage.tag: (ctx) => AuthPage(),
          MoneyTransferPage.tag: (ctx) => MoneyTransferPage(),
          TransactionHistoryPage.tag: (ctx) => TransactionHistoryPage(),
          DrawFundsPage.tag: (ctx) => DrawFundsPage(),
          DepositCashPage.tag: (ctx) => DepositCashPage(),
        },
      ),
    );
  }
}

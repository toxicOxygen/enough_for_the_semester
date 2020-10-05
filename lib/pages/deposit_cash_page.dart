import 'package:flutter/material.dart';
import '../components/account_balance_widget.dart';
import 'dart:io';
import '../components/cashout_form_widget.dart';
import '../components/custom_backgrounds.dart';

class DepositCashPage extends StatelessWidget {
  static const String tag = "deposit-cash-screen";

  final textStyle = TextStyle(color: Colors.white);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          MyGradientBackground(),
          SafeArea(
              child: SingleChildScrollView(
            child: Column(
              children: [
                ListTile(
                  leading: IconButton(
                    icon: Icon(
                      Platform.isIOS ? Icons.chevron_left : Icons.arrow_back,
                    ),
                    color: Colors.white,
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  title: Text(
                    "Deposit Funds Page",
                    style: textStyle,
                  ),
                ),
                Divider(
                  height: 0,
                ),
                Hero(
                  tag: "credit-card",
                  child: AccountBalanceWidget(),
                ),
                CustomCashoutForm(
                  showPhoneNumber: true,
                ),
              ],
            ),
          )),
        ],
      ),
    );
  }
}

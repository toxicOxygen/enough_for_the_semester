import 'package:flutter/material.dart';
import "dart:io";
import '../components/custom_backgrounds.dart';
import '../components/account_balance_widget.dart';
import '../components/cashout_form_widget.dart';

class DrawFundsPage extends StatelessWidget {
  static const String tag = "draw-funds-page";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          MyGradientBackground(),
          SafeArea(child: DrawsScreenActual()),
        ],
      ),
    );
  }
}

class DrawsScreenActual extends StatelessWidget {
  DrawsScreenActual({
    Key key,
  }) : super(key: key);

  final TextStyle textStyle = TextStyle(color: Colors.white);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
              "Draw Funds Page",
              style: textStyle,
            ),
          ),
          Divider(
            height: 0,
          ),
          CustomCashoutForm(
            showPhoneNumber: true,
          ),
          Hero(
            tag: "credit-card",
            child: AccountBalanceWidget(),
          ),
        ],
      ),
    );
  }
}

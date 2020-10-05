import 'package:flutter/material.dart';
import '../components/custom_backgrounds.dart';
import '../components/account_balance_widget.dart';
import '../local_data.dart';
import 'dart:io';

class TransactionHistoryPage extends StatelessWidget {
  static const String tag = "transaction-history-page";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          HomePageBackground(
            invert: true,
          ),
          SafeArea(
            child: TransPageWidget(),
          ),
        ],
      ),
    );
  }
}

class TransPageWidget extends StatelessWidget {
  TransPageWidget({
    Key key,
  }) : super(key: key);

  final textStyle = TextStyle(color: Colors.white);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ListTile(
            leading: IconButton(
              icon:
                  Icon(Platform.isIOS ? Icons.chevron_left : Icons.arrow_back),
              color: Colors.black,
              onPressed: () => Navigator.of(context).pop(),
              iconSize: 35,
            ),
            title: Text(
              "Transaction History",
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  .copyWith(color: Colors.black),
            ),
          ),
          Hero(
            tag: "credit-card",
            child: AccountBalanceWidget(
              showBtn: false,
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Flexible(
            child: Container(
              child: ListView.builder(
                itemCount: 4,
                itemBuilder: (ctx, i) {
                  return ListTile(
                    leading: Icon(
                      Icons.monetization_on,
                      color: Colors.white,
                    ),
                    title: Text(
                      localTransactions[i].name,
                      style: textStyle,
                    ),
                    trailing: Text(
                      "₵ ${localTransactions[i].price}",
                      style: textStyle,
                    ),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}

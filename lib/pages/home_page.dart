import 'package:flutter/material.dart';
import '../components/custom_backgrounds.dart';
import '../components/account_balance_widget.dart';
import '../components/main_menu_widget.dart';
import './money_transfer_page.dart';
import './deposit_cash_page.dart';
import './draw_funds_page.dart';

class HomePage extends StatelessWidget {
  static const String tag = "home-page";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(fit: StackFit.expand, children: [
        HomePageBackground(),
        Container(
          child: SafeArea(
            child: Column(children: [
              ListTile(
                title: Text(
                  "Mobile POS Menu",
                  style: Theme.of(context)
                      .textTheme
                      .headline5
                      .copyWith(color: Colors.white),
                ),
                trailing: IconButton(
                  icon: Icon(Icons.person_pin),
                  color: Colors.white,
                  onPressed: () => {},
                ),
              ),

              //account balance widget
              Hero(tag: "credit-card", child: AccountBalanceWidget()),

              //menu widgets
              SizedBox(
                height: 15,
              ),
              MainMenuWidget(
                title: "Money Transfer",
                onTap: () => Navigator.of(context).pushNamed(
                  MoneyTransferPage.tag,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              MainMenuWidget(
                title: "Draw Funds",
                onTap: () => Navigator.of(context).pushNamed(
                  DrawFundsPage.tag,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              MainMenuWidget(
                title: "Deposit Cash",
                onTap: () => Navigator.of(context).pushNamed(
                  DepositCashPage.tag,
                ),
              )
            ]),
          ),
        )
      ]),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/ui_operations_provider.dart';
import '../components/main_menu_widget.dart';
import '../components/transfer_widget.dart';
import '../components/money_transfer_button.dart';

class MoneyTransferPage extends StatelessWidget {
  static const String tag = "money-transfer-page";

  final blackTextStyle = TextStyle(color: Colors.black);

  @override
  Widget build(BuildContext context) {
    final uiProvider = Provider.of<UiControllerProvider>(context, listen: true);
    return Scaffold(
      backgroundColor: Color.fromRGBO(244, 244, 244, 1.0),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0.0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Chip(
              label: Text("Transfer"),
              backgroundColor: Colors.deepOrange[400],
              labelStyle: TextStyle(color: Colors.white),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'Request',
              style: blackTextStyle.copyWith(fontSize: 16),
            )
          ],
        ),
      ),
      body: Container(
        width: double.infinity,
        child: Stack(
          children: [
            Positioned(
              left: 0,
              right: 0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 15,
                  ),
                  MoneyTransferWidget(),
                  SizedBox(
                    height: 15,
                  ),
                  //delivery
                  Container(
                    padding: EdgeInsets.only(right: 20),
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: Text(
                      'Exchange rate ¢1.00 = ¢1.34',
                      textAlign: TextAlign.end,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  MainMenuWidget(
                    title: "Delivery",
                    elevation: 0,
                    trailing: Text("Send Direct to bank"),
                  ),

                  MainMenuWidget(
                    title: "Switch to bank transfer",
                    elevation: 0,
                    trailing: Switch(
                      activeColor: Colors.deepOrangeAccent,
                      value: uiProvider.transferOption,
                      onChanged: (v) {
                        uiProvider.setTransferOption(v);
                      },
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: MoneyTransferButton(),
            )
          ],
        ),
      ),
    );
  }
}

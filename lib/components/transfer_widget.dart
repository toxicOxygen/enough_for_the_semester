import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/ui_operations_provider.dart';

class MoneyTransferWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final uiProvider = Provider.of<UiControllerProvider>(context, listen: true);

    return Container(
      width: width * 0.9,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      child: Card(
        color: Colors.white,
        elevation: 0.0,
        child: !uiProvider.transferOption
            ? Column(
                children: [
                  SizedBox(
                    height: 8,
                  ),
                  PriceTag(
                    title: "Amount You Want to Send",
                  ),
                  Divider(height: 0),
                  SizedBox(
                    height: 8,
                  ),
                  PriceTag(
                    title: "Receiver's E-zwich No.",
                    accountNumber: true,
                  ),
                ],
              )
            : Padding(
                padding: const EdgeInsets.all(8.0),
                child: PriceTag(
                  title: "Enter Bank Account No.",
                  accountNumber: true,
                ),
              ),
      ),
    );
  }
}

class PriceTag extends StatelessWidget {
  final String title;
  final bool accountNumber;

  PriceTag({this.title, this.accountNumber = false});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          flex: 1,
          child: Container(
            decoration: BoxDecoration(
              border: Border(
                right: BorderSide(
                  color: Colors.black.withAlpha(10),
                ),
              ),
            ),
            child: Column(
              children: [
                if (!accountNumber)
                  SizedBox(
                    height: 5,
                  ),
                if (!accountNumber)
                  Container(
                    child: Text(
                      "GHS",
                      textAlign: TextAlign.center,
                    ),
                    width: double.infinity,
                  ),
                if (accountNumber)
                  Container(
                    width: double.infinity,
                    child: Icon(
                      Icons.credit_card,
                      color: Colors.black54,
                    ),
                  )
              ],
            ),
          ),
        ),
        Flexible(
          flex: 3,
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Text("$title", textAlign: TextAlign.end),
                  padding: EdgeInsets.only(right: 20),
                ),
                Container(
                  padding: EdgeInsets.only(right: 20),
                  width: double.infinity,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.end,
                    decoration: InputDecoration(
                        border: InputBorder.none, hintText: 'type here'),
                    style: Theme.of(context).textTheme.headline5.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

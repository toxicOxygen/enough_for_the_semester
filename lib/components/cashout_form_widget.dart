import 'package:flutter/material.dart';
import '../providers/ui_operations_provider.dart';
import '../providers/auth_provider.dart';
import 'package:provider/provider.dart';
import '../local_data.dart';

class CustomCashoutForm extends StatelessWidget {
  CustomCashoutForm({
    Key key,
    this.showPhoneNumber = false,
  }) : super(key: key);

  final bool showPhoneNumber;
  final TextStyle textStyle = TextStyle(color: Colors.white);

  @override
  Widget build(BuildContext context) {
    final localAuth = Provider.of<AuthProvider>(context, listen: false);
    final uiProvider = Provider.of<UiControllerProvider>(context, listen: true);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Select a payout option",
                  style: textStyle,
                ),
                DropdownButton(
                  value: uiProvider.selectedPaymentOption,
                  style: TextStyle(color: Colors.white),
                  iconEnabledColor: Colors.white,
                  items: paymentOptions.map((e) {
                    return DropdownMenuItem(
                      child: Text(
                        e,
                        style: TextStyle(color: Colors.black38),
                      ),
                      value: e,
                    );
                  }).toList(),
                  onChanged: (e) {
                    uiProvider.setPaymentOption(e);
                  },
                  hint: Text(
                    "Select",
                    style: textStyle,
                  ),
                ),
              ],
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              maxLength: 10,
              decoration: InputDecoration(
                labelText: "Enter amount",
                labelStyle: TextStyle(color: Colors.white),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.white),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
            ),
            if (showPhoneNumber)
              SizedBox(
                height: 10,
              ),
            if (showPhoneNumber)
              TextFormField(
                keyboardType: TextInputType.phone,
                maxLength: 10,
                decoration: InputDecoration(
                  labelText: "Phone",
                  labelStyle: TextStyle(color: Colors.white),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
              ),
            Align(
              alignment: Alignment.bottomRight,
              child: RaisedButton.icon(
                icon: Icon(Icons.fingerprint),
                label: Text("Verify and Cashout"),
                onPressed: () async {
                  localAuth.authenticate().then((value) {
                    Scaffold.of(context).hideCurrentSnackBar();
                    Scaffold.of(context).showSnackBar(SnackBar(
                      content: Text(
                        "Operation was successful",
                        style: TextStyle(color: Colors.white),
                      ),
                      backgroundColor: Colors.green,
                    ));
                  }).catchError((e) {
                    print(e);
                    Scaffold.of(context).hideCurrentSnackBar();
                    Scaffold.of(context)
                        .showSnackBar(SnackBar(content: Text(e.toString())));
                  });
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

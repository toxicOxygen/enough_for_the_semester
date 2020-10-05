import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/auth_provider.dart';

class MoneyTransferButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final auth = Provider.of<AuthProvider>(context, listen: false);

    return Container(
      width: double.infinity,
      child: Card(
        elevation: 0.0,
        child: Column(
          children: [
            Container(
              width: width * 0.9,
              child: ListTile(
                title: Text("Transcation Fee (1.5%)"),
                trailing: Icon(
                  Icons.add,
                  color: Colors.deepOrange[400],
                  size: 20,
                ),
              ),
            ),
            Divider(
              thickness: 1,
              color: Colors.black12.withAlpha(10),
              height: 0,
            ),
            SizedBox(
              height: 10,
            ),
            Text('Total you pay'),
            SizedBox(
              height: 10,
            ),
            Text(
              "¢287.99",
              style: Theme.of(context)
                  .textTheme
                  .headline4
                  .copyWith(fontWeight: FontWeight.bold, color: Colors.black),
            ),
            SizedBox(
              height: 15,
            ),
            RaisedButton(
              onPressed: () {
                auth.authenticate().then((value) {
                  Scaffold.of(context).hideCurrentSnackBar();
                  Scaffold.of(context).showSnackBar(SnackBar(
                    content: Text("Success"),
                  ));
                }).catchError((e) {
                  Scaffold.of(context).hideCurrentSnackBar();
                  Scaffold.of(context).showSnackBar(SnackBar(
                    content: Text("Failed"),
                  ));
                });
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Continue"),
                ],
              ),
              color: Colors.deepOrange[400],
              textColor: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}

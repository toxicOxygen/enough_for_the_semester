import 'package:flutter/material.dart';
import '../providers/auth_provider.dart';
import '../utils/validators.dart';
import 'package:provider/provider.dart';
import 'home_page.dart';
import '../components/custom_backgrounds.dart';

class AuthPage extends StatelessWidget {
  static const String tag = "auth-screen";

  final _enabledBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: Colors.white));

  final _formInputTextStyle = TextStyle(color: Colors.white);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          MyGradientBackground(),
          Container(
            child: SafeArea(
              child: Column(children: [
                ListTile(
                  leading: Hero(
                      tag: "app-logo",
                      child: FlutterLogo(
                        size: 35,
                      )),
                  title: Text(
                    "Authenticate",
                    style: Theme.of(context)
                        .textTheme
                        .headline5
                        .copyWith(color: Colors.white),
                  ),
                ),
                Divider(
                  color: Colors.black26,
                  height: 1,
                ),
                CustomInPageForm(
                  formInputTextStyle: _formInputTextStyle,
                  enabledBorder: _enabledBorder,
                )
              ]),
            ),
          )
        ],
      ),
    );
  }
}

class CustomInPageForm extends StatelessWidget {
  CustomInPageForm({
    Key key,
    @required TextStyle formInputTextStyle,
    @required OutlineInputBorder enabledBorder,
  })  : _formInputTextStyle = formInputTextStyle,
        _enabledBorder = enabledBorder,
        super(key: key);

  final TextStyle _formInputTextStyle;
  final OutlineInputBorder _enabledBorder;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final localAuth = Provider.of<AuthProvider>(context, listen: true);

    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
          TextFormField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: "Enter E-zwich number",
              labelStyle: _formInputTextStyle,
              enabledBorder: _enabledBorder,
              errorStyle: TextStyle(color: Colors.white),
              border: _enabledBorder,
            ),
            style: _formInputTextStyle,
            onSaved: (val) => localAuth.cardNumber = val,
            validator: (val) => validateCardNumber(val),
          ),
          SizedBox(
            height: 15,
          ),
          RaisedButton.icon(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            icon: Icon(
                localAuth.isAuthenticating ? Icons.cancel : Icons.fingerprint),
            label: Text(localAuth.isAuthenticating
                ? "Canecel"
                : "Authenticate and proceed"),
            onPressed: () => _submitForm(context, localAuth),
          )
        ]),
      ),
    );
  }

  void _submitForm(context, auth) async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      auth.authenticate().then((value) {
        Navigator.pop(context);
        Navigator.of(context).pushReplacementNamed(HomePage.tag);
      }).catchError((e) {
        print(e);
        Scaffold.of(context).hideCurrentSnackBar();
        Scaffold.of(context)
            .showSnackBar(SnackBar(content: Text(e.toString())));
      });
    }
  }
}

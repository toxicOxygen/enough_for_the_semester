import 'package:flutter/material.dart';

class MainMenuWidget extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final double elevation;
  final Widget trailing;
  final bool bold;

  MainMenuWidget(
      {@required this.title,
      this.onTap,
      this.elevation,
      this.trailing,
      this.bold = true});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Container(
      height: height * 0.1,
      width: width * 0.9,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      child: Card(
        elevation: elevation ?? 10.0,
        child: Center(
          child: ListTile(
            onTap: onTap,
            title: Text(
              this.title,
              style: TextStyle(
                  fontWeight: bold ? FontWeight.bold : FontWeight.normal),
            ),
            trailing: trailing ?? Icon(Icons.chevron_right),
          ),
        ),
      ),
    );
  }
}

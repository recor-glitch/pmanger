import 'package:flutter/material.dart';

class CustomBottom extends StatelessWidget {
  const CustomBottom({super.key, required this.children});
  final Widget children;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.1,
      decoration: BoxDecoration(
          color: Color.fromRGBO(40, 40, 40, 1),
          border: Border(top: BorderSide(color: Colors.white54, width: 0.5))),
      child: children,
    );
  }
}

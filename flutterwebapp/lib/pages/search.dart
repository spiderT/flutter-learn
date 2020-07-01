import 'package:flutter/material.dart';

class SearchUser extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextField(
      autofocus: true,
      decoration: InputDecoration(
          labelText: "用户名", hintText: "用户名或邮箱", prefixIcon: Icon(Icons.person)),
    );
  }
}

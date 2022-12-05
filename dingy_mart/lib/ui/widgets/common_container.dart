import 'package:flutter/material.dart';

Widget commonContainer(Widget child,[BoxConstraints? _constraints, BoxDecoration? _decoration]){
  return Container(
    constraints: _constraints,
    decoration: _decoration,
    child: child,
  );
}
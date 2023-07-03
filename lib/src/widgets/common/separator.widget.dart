import 'package:flutter/material.dart';

class Separator extends StatelessWidget {
  final Axis? direction;
  final double? size;
  const Separator({super.key, this.direction = Axis.vertical, this.size});

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return direction == Axis.vertical
        ? SizedBox(height: size ?? deviceSize.height * 0.025)
        : SizedBox(width: size ?? deviceSize.width * 0.025);
  }
}

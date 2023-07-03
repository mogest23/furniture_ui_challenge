import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Titlebar extends StatelessWidget {
  final String title;
  const Titlebar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(
        title,
        style: Theme.of(context).textTheme.labelLarge,
      ),
      trailing: SvgPicture.asset("assets/svg/right_arrow.svg", height: 18),
    );
  }
}

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class Weather extends StatelessWidget {
  const Weather({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(left: 18),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Spin(child: Image.asset("assets/images/weather.png", height: 36)),
              const SizedBox(width: 8),
              Text(
                "32ºC",
                style: theme.textTheme.labelMedium?.apply(color: Colors.white),
              ),
            ],
          ),
          Text(
            "24",
            style: theme.textTheme.displayLarge?.apply(
              letterSpacingDelta: 4,
              color: Colors.white,
              fontWeightDelta: 900,
            ),
          ),
          Text(
            "January",
            style: theme.textTheme.titleMedium?.apply(color: Colors.white),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:furniture_app_ui_challenge/src/src.dart';
import 'package:furniture_app_ui_challenge/src/widgets/home_widgets/categories.widget.dart';

class HighlightCard extends StatefulWidget {
  const HighlightCard({super.key});

  @override
  State<HighlightCard> createState() => _HighlightCardState();
}

class _HighlightCardState extends State<HighlightCard> {
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    final cardColor = theme.primaryColor;

    return SizedBox(
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.only(
              top: deviceSize.height * 0.05,
            ),
            height: deviceSize.height * 0.425,
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              color: cardColor,
              child: Container(
                height: deviceSize.height * 0.4,
                padding: EdgeInsets.only(
                  left: deviceSize.width * 0.05,
                  top: deviceSize.width * 0.03,
                  bottom: deviceSize.width * 0.05,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: deviceSize.width * 0.3,
                      child: const Weather(),
                    ),
                    SizedBox(height: deviceSize.height * 0.05),
                    const Expanded(child: CategoriesList()),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            right: 32.0,
            top: 0.0,
            child: Image.asset(
              "assets/images/ladder.png",
              height: deviceSize.height * 0.25,
            ),
          )
        ],
      ),
    );
  }
}

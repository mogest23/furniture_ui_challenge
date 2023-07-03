import 'package:flutter/material.dart';

import 'package:furniture_app_ui_challenge/src/src.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    final theme = Theme.of(context);

    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: deviceSize.width * 0.05),
            child: ListView(
              children: [
                SizedBox(height: deviceSize.height * 0.025),
                Row(
                  children: [
                    CircleAvatar(
                      radius: deviceSize.height * 0.05,
                      foregroundImage:
                          const AssetImage('assets/images/user.png'),
                    ),
                    const SizedBox(width: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Decoration",
                          style: theme.textTheme.headlineLarge
                              ?.apply(fontWeightDelta: 600),
                        ),
                        Text(
                          "Room",
                          style: theme.textTheme.headlineSmall
                              ?.apply(fontWeightDelta: 0),
                        ),
                      ],
                    )
                  ],
                ),
                const Hero(tag: "Details", child: HighlightCard()),
                const Titlebar(title: "Recommended"),
                const RecommendedGrid(),
              ],
            ),
          ),
          const Align(
            alignment: Alignment.bottomCenter,
            child: MyBottomBar(),
          ),
        ],
      ),
    );
  }
}

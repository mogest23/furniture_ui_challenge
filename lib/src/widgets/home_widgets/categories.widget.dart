import 'package:flutter/material.dart';
import 'package:furniture_app_ui_challenge/src/consts.dart';
import 'package:furniture_app_ui_challenge/src/screens/details.screen.dart';

class CategoriesList extends StatefulWidget {
  const CategoriesList({super.key});

  @override
  State<CategoriesList> createState() => _CategoriesListState();
}

class _CategoriesListState extends State<CategoriesList> {
  late GlobalKey _globalKey;

  @override
  void initState() {
    super.initState();
    _globalKey = GlobalKey();
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    return Container(
      key: _globalKey,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final item = categories[index];
          return CategoryTile(
            globalKey: _globalKey,
            category: item,
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox(width: deviceSize.width * 0.025);
        },
      ),
    );
  }
}

class CategoryTile extends StatelessWidget {
  final GlobalKey globalKey;
  final Map<String, String> category;
  const CategoryTile({
    super.key,
    required this.globalKey,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    Color cardColor = theme.primaryColor,
        contentColor = theme.scaffoldBackgroundColor;

    return MaterialButton(
      padding: EdgeInsets.zero,
      onPressed: () {
        final Offset offset =
            (globalKey.currentContext!.findRenderObject() as RenderBox)
                .localToGlobal(Offset.zero);
        Navigator.push(
          context,
          PageRouteBuilder(
            pageBuilder: (context, animation1, animation2) => DetailsScreen(
                index: categories.indexOf(category), offset: offset),
            transitionDuration: const Duration(milliseconds: 500),
            transitionsBuilder: (_, a, __, c) =>
                FadeTransition(opacity: a, child: c),
          ),
        );
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => DetailsScreen(
        //       index: categories.indexOf(category),
        //     ),
        //   ),
        // );
      },
      child: Column(
        children: [
          CircleAvatar(
            radius: 26,
            backgroundColor: contentColor,
            foregroundColor: cardColor,
            child: Image.asset(
              category["icon"]!,
              color: cardColor,
              height: 32,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            category["name"] ?? '',
            style: Theme.of(context)
                .textTheme
                .labelMedium
                ?.apply(color: Colors.white),
          )
        ],
      ),
    );
  }
}

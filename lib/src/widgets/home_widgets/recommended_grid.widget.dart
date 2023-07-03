import 'package:flutter/material.dart';
import 'package:furniture_app_ui_challenge/src/consts.dart';

class RecommendedGrid extends StatefulWidget {
  const RecommendedGrid({super.key});

  @override
  State<RecommendedGrid> createState() => _RecommendedGridState();
}

class _RecommendedGridState extends State<RecommendedGrid> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemCount: recommend.length,
      itemBuilder: (context, index) {
        return RecommendedTile(item: recommend[index]);
      },
    );
  }
}

class RecommendedTile extends StatelessWidget {
  final Map item;
  const RecommendedTile({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: item["color"],
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24),
        child: Image.asset(item["image"]),
      ),
    );
  }
}

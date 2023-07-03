// import 'package:animate_do/animate_do.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:furniture_app_ui_challenge/src/consts.dart';
// import 'package:furniture_app_ui_challenge/src/widgets/home_widgets/categories.widget.dart';

// class DetailsScreen extends StatefulWidget {
//   final int index;
//   final Offset offset;
//   const DetailsScreen({super.key, required this.index, required this.offset});

//   @override
//   State<DetailsScreen> createState() => _DetailsScreenState();
// }

// class _DetailsScreenState extends State<DetailsScreen>
//     with TickerProviderStateMixin {
//   bool _isSpin = false;
//   int _selected = 0;
//   double _size = 100;
//   final _animationDuration = const Duration(milliseconds: 500);

//   @override
//   Widget build(BuildContext context) {
//     final deviceSize = MediaQuery.of(context).size;
//     final theme = Theme.of(context);
//     final cardColor = theme.primaryColor;
//     final contentColor = theme.scaffoldBackgroundColor;

//     return 
    
//     Scaffold(
//       backgroundColor: cardColor,
//       appBar: AppBar(
//         backgroundColor: cardColor,
//         leading: IconButton(
//           icon: SvgPicture.asset(
//             'assets/svg/back_arrow.svg',
//             theme: SvgTheme(currentColor: contentColor),
//           ),
//           onPressed: () => Navigator.pop(context),
//         ),
//       ),
//       body: TweenAnimationBuilder<double>(
//           duration: const Duration(milliseconds: 600),
//           tween: Tween(begin: 1, end: 0),
//           builder: (context, double value, _) {
//             return Hero(
//               tag: "Details",
//               child: Column(
//                 children: [
//                   SizedBox(
//                     height: deviceSize.height * 0.15,
//                     child: categoriesList(),
//                   ),
//                   Expanded(
//                     child: SlideInUp(
//                       delay: const Duration(milliseconds: 800),
//                       duration: const Duration(milliseconds: 300),
//                       from: MediaQuery.of(context).size.height,
//                       child: BottomSheet(
//                         onClosing: () => Navigator.pop(context),
//                         backgroundColor: contentColor,
//                         enableDrag: false,
//                         builder: (context) {
//                           return Container(
//                             width: deviceSize.width,
//                             padding: EdgeInsets.symmetric(
//                               horizontal: deviceSize.width * 0.025,
//                               vertical: deviceSize.height * 0.02,
//                             ),
//                             child: Center(
//                               child: Column(
//                                 children: [
//                                   Container(
//                                     width: deviceSize.width * 0.1,
//                                     height: 6,
//                                     decoration: BoxDecoration(
//                                       color: Colors.grey[300],
//                                       borderRadius: BorderRadius.circular(10),
//                                     ),
//                                   ),
//                                   Expanded(
//                                     child: Column(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.center,
//                                       children: [
//                                         AnimatedContainer(
//                                           height: _size,
//                                           duration: _animationDuration,
//                                           curve: Curves.linear,
//                                           child: Draggable(
//                                             data: Colors.green,
//                                             onDragEnd: (details) {},
//                                             onDragUpdate: (details) {},
//                                             onDraggableCanceled:
//                                                 (velocity, offset) {},
//                                             feedback: Image.asset(
//                                               "assets/images/box_colors/${colors[_selected]['colorName']}.png",
//                                               height: _size,
//                                             ),
//                                             child: Image.asset(
//                                               "assets/images/box_colors/${colors[_selected]['colorName']}.png",
//                                               fit: BoxFit.fill,
//                                             ),
//                                           ),
//                                         ),
//                                         SizedBox(
//                                             height: deviceSize.height * 0.05),
//                                         Text(
//                                           "BOSNAS POSNA",
//                                           style: theme.textTheme.titleMedium
//                                               ?.apply(
//                                             fontWeightDelta: 50,
//                                           ),
//                                         ),
//                                         Text(
//                                           "Footstool with storage, Ransta",
//                                           style:
//                                               theme.textTheme.labelLarge?.apply(
//                                             color: Colors.grey[400],
//                                             fontWeightDelta: 0,
//                                           ),
//                                         ),
//                                         SizedBox(
//                                             height: deviceSize.height * 0.025),
//                                         Text(
//                                           "124\$",
//                                           style: theme.textTheme.titleLarge
//                                               ?.apply(fontWeightDelta: 100),
//                                         ),
//                                         SizedBox(
//                                             height: deviceSize.height * 0.025),
//                                         Row(
//                                           mainAxisAlignment:
//                                               MainAxisAlignment.center,
//                                           children: colors
//                                               .map((e) => Padding(
//                                                     padding:
//                                                         EdgeInsets.symmetric(
//                                                       horizontal:
//                                                           deviceSize.width *
//                                                               0.04,
//                                                     ),
//                                                     child: GestureDetector(
//                                                       onTap: () async {
//                                                         _size = 120;
//                                                         setState(() {});
//                                                         await Future.delayed(
//                                                             _animationDuration);
//                                                         _selected =
//                                                             colors.indexOf(e);
//                                                         _size = 100;
//                                                         setState(() {});
//                                                       },
//                                                       child: CircleAvatar(
//                                                         radius: 18,
//                                                         backgroundColor:
//                                                             _selected ==
//                                                                     colors
//                                                                         .indexOf(
//                                                                             e)
//                                                                 ? e['color']
//                                                                     as Color
//                                                                 : contentColor,
//                                                         child: CircleAvatar(
//                                                           radius: 16,
//                                                           backgroundColor:
//                                                               contentColor,
//                                                           child: CircleAvatar(
//                                                             radius: 12,
//                                                             backgroundColor:
//                                                                 e['color']
//                                                                     as Color,
//                                                           ),
//                                                         ),
//                                                       ),
//                                                     ),
//                                                   ))
//                                               .toList(),
//                                         ),
//                                         SizedBox(
//                                             height: deviceSize.height * 0.025),
//                                         Row(
//                                           mainAxisAlignment:
//                                               MainAxisAlignment.spaceAround,
//                                           children: [
//                                             const Text("Add to cart"),
//                                             ElevatedButton(
//                                               onPressed: () {},
//                                               child: const Text("Buy Now"),
//                                             )
//                                           ],
//                                         ),
//                                         SizedBox(
//                                             height: deviceSize.height * 0.025),
//                                       ],
//                                     ),
//                                   ),
//                                   SizedBox(height: deviceSize.height * 0.025),
//                                 ],
//                               ),
//                             ),
//                           );
//                         },
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             );
//           }),
//       floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
//       floatingActionButton: DragTarget(
//         onLeave: (data) {
//           _isSpin = false;
//           setState(() {});
//         },
//         onAccept: (data) {
//           _isSpin = true;
//           setState(() {});
//         },
//         builder: (context, candidateData, rejectedData) {
//           return IconButton(
//             onPressed: () {},
//             icon: _isSpin
//                 ? Stack(
//                     alignment: Alignment.center,
//                     children: [
//                       Spin(
//                         child: CircleAvatar(
//                           radius: deviceSize.height * 0.05,
//                           backgroundImage:
//                               const AssetImage('assets/images/gradient.png'),
//                         ),
//                       ),
//                       Image.asset(
//                         'assets/images/bag.png',
//                         height: 32,
//                         color: contentColor.withOpacity(0.75),
//                       ),
//                     ],
//                   )
//                 : CircleAvatar(
//                     radius: deviceSize.height * 0.04,
//                     backgroundImage:
//                         const AssetImage('assets/images/gradient.png'),
//                     child: Image.asset(
//                       'assets/images/bag.png',
//                       height: 32,
//                       color: contentColor.withOpacity(0.75),
//                     ),
//                   ),
//           );
//         },
//       ),
//     );
//   }

//   categoriesList() {
//     final deviceSize = MediaQuery.of(context).size;

//     return ListView.separated(
//       scrollDirection: Axis.horizontal,
//       itemCount: categories.length,
//       itemBuilder: (context, index) {
//         final item = categories[index];
//         return SlideInUp(
//           key: Key("$index"),
//           delay: Duration(milliseconds: 200 + (100 * index)),
//           from: widget.offset.dy,
//           child: CategoryTile(globalKey: GlobalKey(), category: item),
//         );
//       },
//       separatorBuilder: (context, index) {
//         return SizedBox(width: deviceSize.width * 0.025);
//       },
//     );
//   }
// }

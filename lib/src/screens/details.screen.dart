import 'dart:math';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:furniture_app_ui_challenge/src/src.dart';

class DetailsScreen extends StatefulWidget {
  final int index;
  final Offset offset;
  const DetailsScreen({super.key, required this.index, required this.offset});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen>
    with TickerProviderStateMixin {
  // late AnimationController _animationController;

  late GlobalKey _floatingButtonKey;
  final GlobalKey _numberKey = GlobalKey();
  int _selected = 0;
  double _size = 100, _btnSize = 0;
  final _animationDuration = const Duration(milliseconds: 250);

  Offset _dragLocation = const Offset(0, 0);

  late Offset _btnLocation;

  bool _showNumber = false;

  @override
  void initState() {
    super.initState();
    _floatingButtonKey = GlobalKey();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _btnLocation =
          (_floatingButtonKey.currentContext?.findRenderObject() as RenderBox)
              .localToGlobal(Offset.zero);
    });
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.primaryColor,
      appBar: AppBar(
        backgroundColor: theme.primaryColor,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: SvgPicture.asset(
            'assets/svg/back_arrow.svg',
            theme: SvgTheme(currentColor: theme.scaffoldBackgroundColor),
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: deviceSize.height * 0.15,
            child: categoriesList(),
          ),
          Expanded(
            child: SlideInUp(
              delay: const Duration(seconds: 1),
              from: deviceSize.height,
              child: BottomSheet(
                enableDrag: false,
                onClosing: () {},
                builder: (context) {
                  return SizedBox(
                    width: deviceSize.width,
                    child: Column(
                      children: [
                        const Separator(),
                        Container(
                          width: deviceSize.width * 0.1,
                          height: 6,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              AnimatedContainer(
                                height: _size,
                                duration: _animationDuration,
                                curve: Curves.linear,
                                child: Draggable(
                                  data: Colors.green,
                                  onDragEnd: (details) {},
                                  onDragUpdate: (details) {
                                    setState(() {
                                      _dragLocation = Offset(
                                          details.globalPosition.dx - 100,
                                          details.globalPosition.dy - 192);
                                    });

                                    final distance =
                                        (_dragLocation - _btnLocation).distance;

                                    debugPrint("Distance: $distance");

                                    if (distance < 400 && distance > 250) {
                                      _btnSize = (400.0 - distance);
                                      setState(() {});
                                    } else {
                                      _btnSize = 8;
                                      setState(() {});
                                    }
                                  },
                                  onDraggableCanceled: (velocity, offset) {},
                                  feedback: Image.asset(
                                    "assets/images/box_colors/${colors[_selected]['colorName']}.png",
                                    height: _size,
                                  ),
                                  child: Image.asset(
                                    "assets/images/box_colors/${colors[_selected]['colorName']}.png",
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              SizedBox(height: deviceSize.height * 0.05),
                              Text(
                                "BOSNAS POSNA",
                                style: theme.textTheme.titleMedium?.apply(
                                  fontWeightDelta: 50,
                                ),
                              ),
                              Text(
                                "Footstool with storage, Ransta",
                                style: theme.textTheme.labelLarge?.apply(
                                  color: Colors.grey[400],
                                  fontWeightDelta: 0,
                                ),
                              ),
                              SizedBox(height: deviceSize.height * 0.025),
                              Text(
                                "124\$",
                                style: theme.textTheme.titleLarge
                                    ?.apply(fontWeightDelta: 100),
                              ),
                              SizedBox(height: deviceSize.height * 0.025),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: colors
                                    .map((e) => Padding(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: deviceSize.width * 0.04,
                                          ),
                                          child: GestureDetector(
                                            onTap: () async {
                                              _size = 120;
                                              setState(() {});
                                              await Future.delayed(
                                                  _animationDuration);
                                              _selected = colors.indexOf(e);
                                              _size = 100;
                                              setState(() {});
                                            },
                                            child: CircleAvatar(
                                              radius: 18,
                                              backgroundColor: _selected ==
                                                      colors.indexOf(e)
                                                  ? e['color'] as Color
                                                  : theme
                                                      .scaffoldBackgroundColor,
                                              child: CircleAvatar(
                                                radius: 16,
                                                backgroundColor: theme
                                                    .scaffoldBackgroundColor,
                                                child: CircleAvatar(
                                                  radius: 12,
                                                  backgroundColor:
                                                      e['color'] as Color,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ))
                                    .toList(),
                              ),
                              SizedBox(height: deviceSize.height * 0.025),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  const Text("Add to cart"),
                                  ElevatedButton(
                                    onPressed: () {},
                                    child: const Text("Buy Now"),
                                  )
                                ],
                              ),
                              SizedBox(height: deviceSize.height * 0.025),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: Container(
        height: 80,
        width: 80,
        padding: const EdgeInsets.only(bottom: 10, right: 10),
        child: Stack(
          alignment: Alignment.bottomRight,
          children: [
            DragTarget(
              key: _floatingButtonKey,
              onAccept: (data) async {
                _btnSize = 0;
                if (_showNumber) _showNumber = false;
                setState(() {});
                await Future.delayed(const Duration(milliseconds: 300));
                _showNumber = true;
                setState(() {});
              },
              builder: (context, size, _) {
                return Stack(
                  alignment: Alignment.center,
                  children: [
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      height: 60 + _btnSize,
                      width: 60 + _btnSize,
                      transform: Matrix4.rotationZ(_btnSize * pi / 90),
                      transformAlignment: Alignment.center,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/gradient.png'),
                        ),
                      ),
                    ),
                    Image.asset(
                      'assets/images/bag.png',
                      height: 30,
                      fit: BoxFit.fitHeight,
                    ),
                  ],
                );
              },
            ),
            if (_showNumber)
              Align(
                alignment: Alignment.topRight,
                child: Container(
                  width: 25,
                  alignment: Alignment.topRight,
                  child: SlideInUp(
                    key: _numberKey,
                    animate: _showNumber,
                    from: 25,
                    child: CircleAvatar(
                      backgroundColor: Colors.red,
                      radius: 15,
                      child: Text(
                        "1",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: theme.scaffoldBackgroundColor,
                        ),
                      ),
                    ),
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }

  Widget categoriesList() {
    final deviceSize = MediaQuery.of(context).size;

    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: categories.length,
      itemBuilder: (context, index) {
        final item = categories[index];
        return SlideInUp(
          key: Key("$index"),
          delay: Duration(milliseconds: 200 + (100 * index)),
          from: widget.offset.dy,
          child: CategoryTile(globalKey: GlobalKey(), category: item),
        );
      },
      separatorBuilder: (context, index) {
        return SizedBox(width: deviceSize.width * 0.025);
      },
    );
  }
}

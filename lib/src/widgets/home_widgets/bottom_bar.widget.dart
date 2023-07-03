import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MyBottomBar extends StatelessWidget {
  const MyBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      elevation: 0.0,
      color: Colors.transparent,
      height: kBottomNavigationBarHeight * 1.75,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        margin: const EdgeInsets.only(bottom: 5),
        child: Card(
          elevation: 5,
          // color: Theme.of(context).scaffoldBackgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SvgPicture.asset(
                'assets/svg/home.svg',
                theme: const SvgTheme(
                  currentColor: Colors.grey,
                ),
              ),
              SvgPicture.asset(
                'assets/svg/search.svg',
                theme: const SvgTheme(
                  currentColor: Colors.grey,
                ),
              ),
              SvgPicture.asset(
                'assets/svg/add.svg',
                height: 32,
                theme: const SvgTheme(
                  currentColor: Colors.grey,
                ),
              ),
              SvgPicture.asset(
                'assets/svg/bell.svg',
                theme: const SvgTheme(
                  currentColor: Colors.grey,
                ),
              ),
              SvgPicture.asset(
                'assets/svg/user.svg',
                theme: const SvgTheme(
                  currentColor: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

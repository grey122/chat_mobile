import 'package:chat_mobile/chats.dart';
import 'package:chat_mobile/constants/assets_icons.dart';
import 'package:chat_mobile/constants/color_const.dart';
import 'package:chat_mobile/people.dart';
import 'package:chat_mobile/settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomSheetScreen extends StatefulWidget {
  static const tag = "BottomSheetScreen";

  const BottomSheetScreen({Key? key}) : super(key: key);

  @override
  State<BottomSheetScreen> createState() => _BottomSheetScreenState();
}

class _BottomSheetScreenState extends State<BottomSheetScreen> {
  var tabindex = 0;
  @override
  Widget build(BuildContext context) {
    // final controller = Get.find<BottomNavBarCtr>();
    // Log.d(tag, "this prints");

    const List<Widget> _pages = <Widget>[
      Chats(),
      People(),
      Settings(),
    ];

    void changeTabIndex(int index, BuildContext context) {
      setState(() {
        tabindex = index;
      });
    }

    return Scaffold(
        // appBar: AppBar(
        //   title: Text("Scaffold"),
        // ),
        body: SafeArea(
          child: _pages.elementAt(tabindex),
        ),
        bottomNavigationBar: NavBAr(
          currentIndex: tabindex,
          onTap: (index) => changeTabIndex(index, context),
        ));
  }
}

class NavBAr extends StatelessWidget {
  const NavBAr({
    Key? key,
    required this.currentIndex,
    this.onTap,
  }) : super(key: key);

  final int currentIndex;
  final void Function(int index)? onTap;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      // iconSize: 30,
      // fixedColor: colorScheme(context).secondary,
      onTap: onTap,
      currentIndex: currentIndex,

      // showSelectedLabels: false,
      // showUnselectedLabels: false,
      unselectedItemColor: Colors.grey,
      // unselectedLabelStyle: GoogleFonts.inter(
      //   fontSize: 10,
      //   fontWeight: FontWeight.w600,
      //   height: 1.5,
      // ),

      type: BottomNavigationBarType.fixed,
      // backgroundColor: colorScheme(context).primary,
      items: [
        BottomNavigationBarItem(
          activeIcon: SvgPicture.asset(
            AssetsIcons.message,
            color: ColorsConst.textColorBlack,
            semanticsLabel: 'Message',
          ),
          label: "",
          icon: SvgPicture.asset(
            AssetsIcons.message,
            color: Colors.grey.withOpacity(0.6),
            semanticsLabel: 'Home',
          ),
        ),
        BottomNavigationBarItem(
          label: "",
          activeIcon: SizedBox(
            height: 20,
            width: 30,
            child: Stack(
              children: [
                SvgPicture.asset(
                  AssetsIcons.humans,
                  color: ColorsConst.textColorBlack,
                  semanticsLabel: 'humans',
                ),
                Positioned(
                  left: 17,
                  // top: -1,
                  child: Container(
                    height: 12,
                    width: 12,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.blue,
                      // border: Border.all(width: 2, color: Colors.white),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.only(bottom: 2),
                      child: Text(
                        '2',
                        style: TextStyle(
                          fontFamily: 'sf-pro-text',
                          fontSize: 10.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          icon: SizedBox(
            height: 20,
            width: 30,
            child: Stack(
              children: [
                SvgPicture.asset(
                  AssetsIcons.humans,
                  // color: activeColor,
                  semanticsLabel: 'humans',
                ),
                Positioned(
                  left: 17,
                  // top: -1,
                  child: Container(
                    height: 12,
                    width: 12,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.blue,
                      // border: Border.all(width: 2, color: Colors.white),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.only(bottom: 2),
                      child: Text(
                        '2',
                        style: TextStyle(
                          fontFamily: 'sf-pro-text',
                          fontSize: 10.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        BottomNavigationBarItem(
          label: "",
          activeIcon: SvgPicture.asset(
            AssetsIcons.setting,
            color: ColorsConst.textColorBlack,
            semanticsLabel: 'Settings',
          ),
          icon: SvgPicture.asset(
            AssetsIcons.setting,
            // color: activeColor,
            semanticsLabel: 'Settings',
          ),
        ),
      ],
    );
  }
}

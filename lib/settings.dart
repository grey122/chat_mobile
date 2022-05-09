import 'dart:io';

import 'package:chat_mobile/constants/asset_images.dart';
import 'package:chat_mobile/constants/assets_icons.dart';
import 'package:chat_mobile/constants/color_const.dart';
import 'package:flutter/material.dart';

import 'shared_widgets/svgs.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          // physics: const NeverScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: Platform.isIOS
                          ? const Icon(Icons.arrow_back_ios_outlined)
                          : const Icon(Icons.arrow_back_outlined)),
                  const Spacer(),
                  Container(
                    height: 100,
                    width: 100,
                    margin: const EdgeInsets.only(right: 50),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: ColorsConst.greyContainer,
                      image: DecorationImage(
                        fit: BoxFit.contain,
                        image: AssetImage(
                          AssetImages.imageSeven,
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                ],
              ),
              const Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Text(
                    'Jenny Wilson',
                    style: TextStyle(
                      fontFamily: 'sf-pro-display',
                      fontSize: 24.0,

                      color: ColorsConst.textColorBlack,
                      // fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 35, left: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    TittleIcon(
                      svgIcon: AssetsIcons.phone,
                      text: "Audio",
                    ),
                    TittleIcon(
                      svgIcon: AssetsIcons.video,
                      text: "Video",
                    ),
                    TittleIcon(
                      svgIcon: AssetsIcons.girlUser,
                      text: "Profile",
                    ),
                    TittleIcon(
                      svgIcon: AssetsIcons.mute,
                      text: "Mute",
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const BodyText(
                      text: 'Color',
                      traling: SvgIcon(AssetsIcons.circle),
                    ),
                    const BodyText(
                      text: 'Emoji',
                      traling: SvgIcon(AssetsIcons.thumbsUp),
                    ),
                    BodyText(
                      text: 'NickNames',
                      traling: Icon(
                        Icons.arrow_forward_ios_outlined,
                        color: Colors.black.withOpacity(0.2),
                      ),
                      showDivider: false,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30, left: 17),
                      child: Text(
                        'MORE ACTIONS',
                        style: TextStyle(
                          fontFamily: 'sf-pro-text',
                          fontSize: 13.0,
                          color: Colors.black.withOpacity(0.35),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: BodyText(
                        text: 'Search in Conversation',
                        traling: CircleAvatar(
                          radius: 18,
                          backgroundColor: ColorsConst.greyContainer,
                          child: Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: SvgIcon(
                              AssetsIcons.search,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const BodyText(
                      text: 'Create group',
                      traling: CircleAvatar(
                        radius: 18,
                        backgroundColor: ColorsConst.greyContainer,
                        child: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: SvgIcon(
                            AssetsIcons.groupUsers,
                            // color: Colors.black,
                          ),
                        ),
                      ),
                      showDivider: false,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30, left: 17),
                      child: Text(
                        'PRIVACY',
                        style: TextStyle(
                          fontFamily: 'sf-pro-text',
                          fontSize: 13.0,
                          color: Colors.black.withOpacity(0.35),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: BodyText(
                        text: 'Search in Conversation',
                        traling: SizedBox(
                          width: 45,
                          child: Row(
                            children: [
                              Text(
                                'On',
                                style: TextStyle(
                                  fontFamily: 'sf-pro-text',
                                  fontSize: 17.0,
                                  color: Colors.black.withOpacity(0.35),
                                  // fontWeight: FontWeight.w600,
                                ),
                              ),
                              const Spacer(),
                              Icon(
                                Icons.arrow_forward_ios_outlined,
                                size: 18,
                                color: Colors.black.withOpacity(0.2),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const BodyText(
                      text: 'Ignore Messages',
                      traling: CircleAvatar(
                        radius: 18,
                        backgroundColor: ColorsConst.greyContainer,
                        child: Padding(
                          padding: EdgeInsets.all(6.0),
                          child: SvgIcon(
                            AssetsIcons.ignore,
                            // color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    const BodyText(
                      text: 'Block',
                      traling: SizedBox(),
                      showDivider: false,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class BodyText extends StatelessWidget {
  const BodyText({
    Key? key,
    required this.text,
    required this.traling,
    this.showDivider = true,
  }) : super(key: key);
  final String text;
  final Widget traling;
  final bool showDivider;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 17),
      alignment: Alignment.center,
      height: 52,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          Row(
            children: [
              Text(
                text,
                style: const TextStyle(
                  fontFamily: 'sf-pro-text',
                  fontSize: 17.0,

                  color: ColorsConst.textColorBlack,
                  // fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              traling,
            ],
          ),
          const Spacer(),
          showDivider ? const Divider() : const SizedBox()
        ],
      ),
    );
  }
}

class TittleIcon extends StatelessWidget {
  const TittleIcon({
    Key? key,
    required this.svgIcon,
    required this.text,
  }) : super(key: key);
  final String svgIcon;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 30),
      child: SizedBox(
        width: 40,
        child: Column(
          children: [
            CircleAvatar(
              radius: 22,
              backgroundColor: ColorsConst.greyContainer,
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: SvgIcon(svgIcon),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: FittedBox(
                child: Text(
                  text,
                  style: TextStyle(
                    fontFamily: 'sf-pro-text',
                    fontSize: 12.0,

                    color: Colors.black.withOpacity(0.5),
                    // fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

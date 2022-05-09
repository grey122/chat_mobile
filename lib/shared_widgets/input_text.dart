import 'dart:ui';

import 'package:chat_mobile/constants/assets_icons.dart';
import 'package:chat_mobile/constants/color_const.dart';
import 'package:chat_mobile/shared_widgets/svgs.dart';
import 'package:flutter/material.dart';

class InputTextSearch extends StatelessWidget {
  final String hintText;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final bool isEnabled;

  // final TextEditingController controller;
  //TODO: learn how to use voidcallback here
  final dynamic onSave;
  final dynamic validator;
  final void Function()? onTap;
  const InputTextSearch({
    Key? key,
    required this.hintText,
    this.textInputAction,
    this.keyboardType,
    this.onSave,
    this.validator,
    required this.isEnabled,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 42,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: TextFormField(
          // controller: controller,
          key: key,

          onChanged: (change) {},
          onSaved: onSave,
          validator: validator,
          keyboardType: keyboardType,
          textInputAction: textInputAction,
          enabled: isEnabled,
          onTap: onTap,
          cursorColor: Colors.black,
          // style:
          //     textTheme(context).bodyText1?.copyWith(color: ColorConst.blackTwo),
          decoration: InputDecoration(
            fillColor: ColorsConst.textInputSearchContainer,
            filled: true,
            suffixIcon: IconButton(
              onPressed: () {},
              icon: const SvgIcon(AssetsIcons.search),
            ),

            // floatingLabelBehavior: FloatingLabelBehavior.auto,
            // labelText: hintText,
            // labelStyle:
            //     textTheme(context).caption?.copyWith(color: Colors.black),

            // prefixIcon: Icon(Icons.email),
            contentPadding: const EdgeInsets.only(
              left: 19.0,
              top: 8.0,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              // borderSide: BorderSide(
              //     color: colorScheme(context).secondaryVariant, width: 1),
            ),
            hintText: hintText,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),

            // errorText: "faliure",
            hintStyle: const TextStyle(
              fontFamily: "sf-pro-text",
              fontWeight: FontWeight.w500,
              color: ColorsConst.textGreyColor,
            ),
          ),
        ),
      ),
    );
  }
}

class InputTextChat extends StatelessWidget {
  final String hintText;
  final TextInputAction textInputAction;
  final TextInputType keyboardType;
  final FocusNode? focusNode;
  final String? replymessage;
  final TextEditingController? controller;
  final void Function()? onTap;

  // final TextEditingController controller;
  //TODO: learn how to use voidcallback here
  final dynamic onSave;
  final dynamic validator;
  final void Function(String)? onChanged;
  const InputTextChat({
    Key? key,
    required this.hintText,
    required this.textInputAction,
    required this.keyboardType,
    this.onSave,
    this.validator,
    this.focusNode,
    this.onChanged,
    this.replymessage,
    this.onTap,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(40),
      child: ConstrainedBox(
        constraints: const BoxConstraints(minHeight: 36, maxHeight: 100),
        child: TextFormField(
          // onFieldSubmitted: (){},

          focusNode: focusNode,
          controller: controller,
          key: key,
          maxLines: null,
          onChanged: onChanged,
          onTap: onTap,
          onSaved: onSave,
          validator: validator,
          keyboardType: keyboardType,
          textInputAction: textInputAction,

          cursorColor: Colors.black,

          // style:
          //     textTheme(cont5ext).bodyText1?.copyWith(color: ColorConst.blackTwo),
          decoration: InputDecoration(
            fillColor: Colors.black.withOpacity(0.05),
            filled: true,
            suffixIcon: const Padding(
              padding: EdgeInsets.all(10.0),
              child: SvgIcon(AssetsIcons.smile),
            ),

            // floatingLabelBehavior: FloatingLabelBehavior.auto,
            // labelText: hintText,
            // labelStyle:
            //     textTheme(context).caption?.copyWith(color: Colors.black),

            // prefixIcon: Icon(Icons.email),
            contentPadding: const EdgeInsets.only(
              left: 15.0,
              top: 13.0,
            ),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),
                borderSide: const BorderSide(color: Colors.white, width: 1)),
            hintText: hintText,
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),
                borderSide: const BorderSide(color: Colors.white, width: 1)),

            // errorText: "faliure",
            hintStyle: const TextStyle(
              fontFamily: 'sf-pro-text',
              fontSize: 17.0,

              color: Colors.grey,
              // fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

import 'text_style.dart';
import 'package:flutter/material.dart';
import 'responsive_utils.dart';

class AppBarCustom extends StatelessWidget {
  final Function callback;
  final String title;
  final Widget? trailing;
  AppBarCustom({Key? key, required this.callback, required this.title,this.trailing})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: UtilsResponsive.height(20, context),
          right: UtilsResponsive.height(10, context),
          left: UtilsResponsive.height(10, context)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
                  onTap: () {
                  callback();
                  },
                  child: Icon(Icons.arrow_back_ios_new),
                ),
          TextConstant.titleH2(context,
              text: title, fontWeight: FontWeight.w700),
          trailing??const SizedBox.shrink(),
        ],
      ),
    );
  }
}
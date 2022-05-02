import 'package:flutter/material.dart';
import 'package:fuodz/constants/app_colors.dart';
import 'package:fuodz/translations/vendor/top_vendor.i18n.dart';
import 'package:fuodz/utils/utils.dart';
import 'package:velocity_x/velocity_x.dart';

class PickupTag extends StatelessWidget {
  const PickupTag({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return "Pickup"
                    .i18n
                    .text.xs
                    .color(Utils.isDark(AppColor.pickupColor) ? Colors.white:Colors.black)
                    .make()
                    .py2()
                    .px8()
                    .box
                    .roundedLg
                    .color(AppColor.pickupColor)
                    .make();
  }
}

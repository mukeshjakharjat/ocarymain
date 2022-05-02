import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:fuodz/constants/app_images.dart';
import 'package:fuodz/constants/app_strings.dart';
import 'package:fuodz/utils/ui_spacer.dart';
import 'package:fuodz/view_models/profile.vm.dart';
import 'package:fuodz/widgets/busy_indicator.dart';
import 'package:fuodz/widgets/cards/custom.visibility.dart';
import 'package:fuodz/widgets/menu_item.dart';
import 'package:fuodz/widgets/states/empty.state.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:velocity_x/velocity_x.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard(this.model, {Key key}) : super(key: key);

  final ProfileViewModel model;
  @override
  Widget build(BuildContext context) {
    return model.authenticated
        ? VStack(
            [
              //profile card
              HStack(
                [
                  //
                  CachedNetworkImage(
                    imageUrl: model.currentUser.photo,
                    progressIndicatorBuilder: (context, imageUrl, progress) {
                      return BusyIndicator();
                    },
                    errorWidget: (context, imageUrl, progress) {
                      return Image.asset(
                        AppImages.user,
                      );
                    },
                  ).wh(Vx.dp64, Vx.dp64).box.roundedFull.clip(Clip.antiAlias).make(),

                  //
                  VStack(
                    [
                      //name
                      model.currentUser.name.text.xl.semiBold.make(),
                      //email
                      model.currentUser.email.text.light.make(),
                      //share invation code
                      AppStrings.enableReferSystem
                          ? "Share referral code".tr()
                              .text
                              .sm
                              .color(context.textTheme.bodyText1.color)
                              .make()
                              .box
                              .px4
                              .roundedSM
                              .border(color: Colors.grey)
                              .make()
                              .onInkTap(model.shareReferralCode)
                              .py4()
                          : UiSpacer.emptySpace(),
                    ],
                  ).px20().expand(),

                  //
                ],
              ).p12(),

              //
              MenuItem(
                title: "Edit Profile".tr(),
                onPressed: model.openEditProfile,
                topDivider: true,
              ),
              //change password
              MenuItem(
                title: "Change Password".tr(),
                onPressed: model.openChangePassword,
                topDivider: true,
              ),
              //referral
              CustomVisibilty(
                visible: AppStrings.enableReferSystem,
                child: MenuItem(
                  title: "Refer & Earn".tr(),
                  onPressed: model.openRefer,
                  topDivider: true,
                ),
              ),
              //Wallet
              MenuItem(
                title: "Wallet".tr(),
                onPressed: model.openWallet,
                topDivider: true,
              ),
              //addresses
              MenuItem(
                title: "Delivery Addresses".tr(),
                onPressed: model.openDeliveryAddresses,
                topDivider: true,
              ),
              //favourites
              MenuItem(
                title: "Favourites".tr(),
                onPressed: model.openFavourites,
                topDivider: true,
              ),
              //
              MenuItem(
                child: "Logout".tr().text.red500.make(),
                onPressed: model.logoutPressed,
                divider: false,
                suffix: Icon(
                  FlutterIcons.logout_ant,
                  size: 16,
                ),
              ),
            ],
          )
            .wFull(context)
            .box
            .border(color: Theme.of(context).cardColor)
            .color(Theme.of(context).cardColor)
            .shadow
            .roundedSM
            .make()
        : EmptyState(
            auth: true,
            showAction: true,
            actionPressed: model.openLogin,
          ).py12();
  }
}

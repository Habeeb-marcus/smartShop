import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:smart_shop/core/utility/constants.dart';
import 'package:smart_shop/presentation/styles/app_colors.dart';
import 'package:smart_shop/presentation/styles/text_styles.dart';


class NotificationManager {
  // static void notifySuccess(String message) {
  //   _showSnackBar(Constants.successColor,
  //       AppNavigator.instance.navKey.currentContext!, message);
  // }

  // static void notifyError(String message) {
  //   _showSnackBar(Constants.failureColor,
  //       AppNavigator.instance.navKey.currentContext!, message);
  // }

  // static void notifyInfo(String message) {
  //   _showSnackBar(AppColors.primary,
  //       AppNavigator.instance.navKey.currentContext!, message);
  // }

  static void showLoading({String? msg}) {
    if (EasyLoading.isShow) EasyLoading.dismiss();
    EasyLoading.show(
      status: msg ?? 'Loading...',
      maskType: EasyLoadingMaskType.custom,
    );
  }

  static void hideLoading() {
    if (EasyLoading.isShow) {
      EasyLoading.dismiss();
    }
  }

  static void _showSnackBar(Color color, BuildContext context, String message) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          backgroundColor: color,
          content: Text(
            message,
            style: AppTextStyle.bodyThree.copyWith(
              color: AppColors.white,
            ),
          ),
          dismissDirection: DismissDirection.down,
          margin: const EdgeInsets.all(8),
          behavior: SnackBarBehavior.floating,
        ),
      );
  }

  static void showCustomBottomSheet(BuildContext rootContext, Widget child) {
    showModalBottomSheet(
      isScrollControlled: true,
      isDismissible: true,
      shape: RoundedRectangleBorder(
          side: BorderSide(
              color: Theme.of(rootContext).brightness == Brightness.light
                  ? Colors.transparent
                  : AppColors.gray),
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(12),
          )),
      context: rootContext,
      builder: (context) {
        return child;
      },
    );
  }

  static void showBottomSheet(
    BuildContext context, {
    String? title,
    String? desc,
    double? height,
    String? acceptBtnTitle,
    String? cancelBtnTitle,
    VoidCallback? onAccept,
    VoidCallback? onCancel,
    VoidCallback? onCallCustomerSupport,
    VoidCallback? onChatWhatsapp,
    VoidCallback? onSendMail,
  }) {
    showModalBottomSheet(
      isScrollControlled: true,
      isDismissible: true,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
        top: Radius.circular(24),
      )),
      context: context,
      builder: (context) {
        return SizedBox(
          height: height ?? MediaQuery.of(context).size.height * 0.65,
          child: Padding(
            padding: const EdgeInsets.only(
                top: 12.0, bottom: 24, right: 24, left: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Center(
                  child: Container(
                    height: 5,
                    width: 60,
                    decoration: BoxDecoration(
                      color: Constants.primaryGray2,
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Text(
                  title ?? "Are You Sure You Want To Cancel This Package",
                  style: const TextStyle(
                    color: Constants.primaryBlack,
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Text(
                  desc ??
                      "Once this action has been done it cannot be reversed and your space slot will be opened up for others.",
                  style: const TextStyle(
                    color: Constants.primaryGray3,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                // SizedBox(
                //   height: 48,
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.start,
                //     crossAxisAlignment: CrossAxisAlignment.center,
                //     mainAxisSize: MainAxisSize.max,
                //     children: [
                //       Expanded(
                //         flex: 15,
                //         child: CustomOutlinedButton(
                //           borderColor: Constants.primaryBlack,
                //           text: cancelBtnTitle ?? "No, Do Not Cancel",
                //           fontSize: 12,
                //           textColor: Constants.primaryBlack,
                //           borderRadius: 4,
                //           onPressed: onCancel,
                //         ),
                //       ),
                //       const Spacer(),
                //       Expanded(
                //         flex: 15,
                //         child: CustomButton(
                //           text: acceptBtnTitle ?? "Yes, Cancel it ",
                //           backgroundColor:
                //               Constants.primaryRed.withOpacity(0.2),
                //           textColor: Constants.primaryRed,
                //           cornerRadius: 4,
                //           onPressed: onAccept,
                //         ),
                //       )
                //     ],
                //   ),
                // ),
               
               
                const SizedBox(
                  height: 24,
                ),
                CustomCardWithCenterTextIcon(
                  title: "Call customer support",
                  icons: Icons.support_agent_rounded,
                  onTap: onCallCustomerSupport,
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomCardWithCenterTextIcon(
                  title: "Chat us on WhatsApp",
                  icons: Icons.chat_bubble,
                  onTap: onChatWhatsapp,
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomCardWithCenterTextIcon(
                  title: "Send a Mail",
                  icons: Icons.mail_rounded,
                  onTap: onSendMail,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class CustomCardWithCenterTextIcon extends StatelessWidget {
  const CustomCardWithCenterTextIcon({
    Key? key,
    this.title,
    this.icons,
    this.onTap,
  }) : super(key: key);
  final String? title;
  final IconData? icons;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 48,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Constants.primaryGray2.withOpacity(0.6),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title ?? "Call customer support",
                style: const TextStyle(
                  color: Constants.primaryBlack,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Icon(
                icons ?? Icons.support_agent_rounded,
                color: Constants.primaryBlack,
              )
            ],
          ),
        ),
      ),
    );
  }
}

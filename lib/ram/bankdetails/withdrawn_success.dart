import 'package:flutter/material.dart';
import 'package:bhaktiyoga_ios/core/app_export.dart';
import 'package:bhaktiyoga_ios/widgets/custom_button.dart';

class WithdrawSuccess extends StatelessWidget {
  final withdrawnAmount;

  const WithdrawSuccess({this.withdrawnAmount});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.gray900,
      body: Container(
        width: size.width * 1.2,
        padding: getPadding(
          left: 46,
          top: 97,
          right: 46,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              withdrawnAmount.toString(),
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.left,
              style: AppStyle.txtLoraRomanSemiBold4103,
            ),
            Padding(
              padding: getPadding(
                top: 30,
              ),
              child: Text(
                "Withdraw Successful!",
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                style: AppStyle.txtLoraRomanSemiBold24Yellow100,
              ),
            ),
            Container(
              width: getHorizontalSize(
                299.00,
              ),
              margin: getMargin(
                top: 15,
                bottom: 5,
              ),
              child: Text(
                "We have received your withdrawal request and will process the above mentioned amount in the bank account provided by you within 2-4 business days.",
                maxLines: null,
                textAlign: TextAlign.center,
                style: AppStyle.txtLoraRomanSemiBold16,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: getPadding(
          left: 25,
          right: 25,
          bottom: 53,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomButton(
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.homeScreen);
              },
              height: 54,
              width: 343,
              text: "Back to Home",
              variant: ButtonVariant.OutlineLime900_1,
              shape: ButtonShape.CircleBorder24,
              fontStyle: ButtonFontStyle.LoraRomanSemiBold18Yellow100,
            ),
          ],
        ),
      ),
    );
  }
}

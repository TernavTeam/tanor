import 'package:ammlak_app/page_base.dart';
import 'package:ammlak_app/utils/app_color.dart';
import 'package:ammlak_app/view/base_pages/my_advertising_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpPage extends StatelessWidget {
  String phone;
  Function() callBackSuccess;

  OtpPage(this.phone, this.callBackSuccess, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
        builder: (context,setState) {
          return Stack(
          children: [
            Positioned(
                bottom: 0,
                child: Container(
                  width: Get.width,
                  height: Get.height / 3,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(32),
                        topRight: Radius.circular(32)),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 25),
                    child: Center(
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 30,
                          ),
                          Container(
                              padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 16),
                              width: Get.width / 2 + 60,
                              height: 56,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(
                                      width: 1, color: AppColor.colorLine)),
                              child: Center(
                                child: PinCodeTextField(
                                  cursorColor: Colors.transparent,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                  appContext: context,
                                  length: 4,
                                  obscureText: false,

                                  animationType: AnimationType.fade,
                                  textStyle: const TextStyle(
                                    fontSize: 14,
                                    fontFamily: 'IranSansNumber',

                                  ),
                                  pinTheme: PinTheme(
                                    shape: PinCodeFieldShape.underline,
                                    inactiveColor: Colors.transparent,
                                    activeColor: Colors.transparent,
                                    selectedColor: Colors.transparent,





                                    fieldHeight: 30,
                                    fieldWidth: 30,
                                    activeFillColor: Colors.transparent,
                                  ),

                                  onCompleted: (output) {
                                    Get.back();
                                    callBackSuccess();
                                  },
                                  onChanged: (String value) {},

                                ),
                              )),
                          const SizedBox(
                            height: 30,
                          ),
                          const Text(
                            'کد پیامک شده را وارد کنید ',
                            style: TextStyle(color: Color(0xff808080)),
                          ),
                          const SizedBox(
                            height: 14,
                          ),
                          Text(
                            phone,
                            style: const TextStyle(
                                color: AppColor.colorDisableItem, fontSize: 13),
                          ),
                        ],
                      ),
                    ),
                  ),
                )),
          ],
        );
      }
    );
  }


}

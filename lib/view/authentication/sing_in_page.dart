import 'package:ammlak_app/utils/app_color.dart';
import 'package:ammlak_app/view/authentication/otp_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class SingInPage extends StatefulWidget {
  String? phone;
  Function() callBackSuccess;

   SingInPage(this.callBackSuccess, {this.phone,Key? key}) : super(key: key);

  @override
  State<SingInPage> createState() => _SingInPageState();
}

class _SingInPageState extends State<SingInPage> {

  TextEditingController phoneController = TextEditingController();

  @override
void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {

    });
  }

  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (context,setState) {
        return Stack(
          children: [
            Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  width: Get.width,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(32),
                        topRight: Radius.circular(32)),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 50),
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            width: Get.width / 2,
                            child: TextFormField(
                              textAlign: TextAlign.center,
                              controller: phoneController,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              decoration: const InputDecoration(
                                hintText: 'شماره همراه',
                                hintStyle: TextStyle(
                                    fontSize: 13,
                                    color: AppColor.colorDisableItem),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 1,
                                      color: AppColor.colorDisableItem),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 60,),
                          InkWell(
                            onTap: (){
                              Get.back();
                              Get.bottomSheet(OtpPage(phoneController.text,widget.callBackSuccess),isDismissible: false);

                            },
                            child: Container(
                              width: Get.width/2,
                              height: 56,
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),border: Border.all(color: AppColor.colorLine)),
                              child: const Center(child: Text('ورود',style: TextStyle(color: AppColor.colorLine),)),
                            ),
                          )

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


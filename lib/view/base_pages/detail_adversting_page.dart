import 'package:ammlak_app/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailAdvertisingPage extends StatelessWidget {
  const DetailAdvertisingPage({Key? key}) : super(key: key);

  @override

  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Get.back();
      },
      child: Scaffold(
          backgroundColor: AppColor.backgroundColor,

          body: SafeArea(
              child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              const SizedBox(
                height: 96,
              ),
              Container(
                child:
                const Text(
                  textDirection: TextDirection.rtl,
                  'تولید سادگی نامفهوم از صنعت چاپ و طراحان گرافیکی است. چاپگرها و متون مجله در ستون و سطر آنچنان که لازم شرایط فعلی تکنولوژی مورد نیاز',
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      fontFamily: 'IranSans',
                      color: Color(0xff666666)),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              const Align(
                alignment: Alignment.topRight,
                child: Text(


                  'تولید سادگی نامفهوم از صنعت چاپ و طراحان گرافیکی است',
                  textDirection: TextDirection.rtl,
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      fontFamily: 'IranSans',
                      color: Color(0xff666666)),
                ),
              ),
              const SizedBox(
                height: 100,
              ),

              InkWell(
                onTap: (){
                  Get.back();
                },
                child: Container(
                  width: Get.width,
                  height: 312,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.grey.withOpacity(.3),
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              InkWell(
                onTap: (){
                  Get.back();
                },
                child: Container(
                  width: Get.width,
                  height: 312,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.grey.withOpacity(.3),
                  ),
                ),
              ),
              const SizedBox(
                height: 150,
              ),
              GestureDetector(
                  onTap: (){
                    _makePhoneCall('tel:0597924917');
                  },
                  child: Container(
                    height: 160,
                      width: 160,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,

                      ),
                      child: Center(child: SvgPicture.asset('assets/icon/phone_icon.svg')))),
              const SizedBox(
                height: 200,
              ),

            ],
          ),
        ),
      ))),
    );
  }
  Future<void> _makePhoneCall(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
}}

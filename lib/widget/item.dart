import 'package:ammlak_app/constants/constants.dart';
import 'package:ammlak_app/utils/app_color.dart';
import 'package:ammlak_app/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';

class ItemCustom extends StatelessWidget {
  Function onTap;
  bool status;
  Function(bool) onTapSwitch;
  bool showSwitch=false;
  bool myAdvertising;
  bool showicon;

  ItemCustom(
      {super.key,
      required this.onTap,
      this.status = true,
      required this.onTapSwitch,
        required this.showSwitch,
        required this.myAdvertising,
        required this.showicon,

      } );

  Constants constants = Constants();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        status
            ? InkWell(
                onTap: () {

      onTap();

      },
                child: widgetChild(),
              )
            : Container(child: widgetChild()),
      ],
    );
  }

  widgetChild() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 25),
          child: SizedBox(
            width: Get.width / 2,
            height: 230,
            child: Stack(
              children: [
                /// image
                Positioned(
                    child: Center(
                        child: Container(
                  width: 130,
                  height: 130,
                  foregroundDecoration: BoxDecoration(
                    color:
                        status ? Colors.transparent : AppColor.colorDisableItem,
                    backgroundBlendMode: BlendMode.saturation,
                      shape: BoxShape.circle
                  ),
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/image/home.jpg'),
                        // insert image path here
                        fit: BoxFit.cover,
                      ),
                      shape: BoxShape.circle),
                )

                        )), //circular
                Visibility(
                  visible: showicon,
                  child: Positioned(
                      bottom: 20,
                      top: 0,
                      right: 165,
                      left: 0,
                      child: SizedBox(
                          height: 25,
                          width: 25,
                          child: Center(
                              child: SvgPicture.asset(
                            'assets/icon/elevator_icon.svg',
                            height: 30,
                          )))),
                ),
                Visibility(
                  visible: showicon,
                  child: Positioned(
                      bottom: 20,
                      top: 50,
                      right: 160,
                      left: 0,
                      child: SizedBox(
                          height: 25,
                          width: 25,
                          child: Center(
                              child: SvgPicture.asset(
                            'assets/icon/balcon_icon.svg',
                            height: 30,
                          )))),
                ),
                Visibility(
                  visible: showicon,
                  child: Positioned(
                      bottom: 20,
                      top: 100,
                      right: 140,
                      left: 0,
                      child: SizedBox(
                          height: 25,
                          width: 25,
                          child: Center(
                              child: SvgPicture.asset(
                            'assets/icon/anbar_icon.svg',
                            height: 30,
                          )))),
                ),
                Visibility(
                  visible: showicon,
                  child: Positioned(
                      bottom: 20,
                      top: 150,
                      right: 100,
                      left: 0,
                      child: SizedBox(
                          height: 25,
                          width: 25,
                          child: Center(
                              child: SvgPicture.asset(
                            'assets/icon/parking_icon.svg',
                            height: 30,
                          )))),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                children: [
                  Visibility(
                      visible: myAdvertising,

                      child: SvgPicture.asset('assets/icon/tik_icon.svg',height: 12,)),
                  const SizedBox(
                    width: 5 ,
                  ),
                  Text('متری',
                      style: TextStyle(
                          color: status
                              ? AppColor.colorDisableItem
                              : AppColor.colorDisableItem)),
                  const SizedBox(
                    width: 12,
                  ),
                  Text(Constants.replaceFarsiNumber('100'),
                      style: TextStyle(
                          color: status
                              ? Colors.black
                              : AppColor.colorDisableItem,fontWeight: FontWeight.bold,)),


                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                children: [



                  Text('اجاره',
                      style: TextStyle(
                          color: status
                              ? AppColor.colorDisableItem
                              : AppColor.colorDisableItem)),
                  const SizedBox(
                    width: 12,
                  ),
                  Text(Constants.replaceAndSpaceFarsiNumber('800000'),
                      style: TextStyle(
                          color: status
                              ? AppColor.priceDisableColor
                              : AppColor.colorDisableItem)),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  Text(
                    'ودیعه',
                    style: TextStyle(
                        color:
                            status ? AppColor.colorDisableItem : AppColor.colorDisableItem),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Text(Constants.replaceAndSpaceFarsiNumber('300000000'),
                      style: TextStyle(
                          color: status
                              ? AppColor.priceDisableColor
                              : AppColor.colorDisableItem))
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Visibility(
                visible: showSwitch,
                child: Container(
                  margin: const EdgeInsets.all(10),
                  child: Tooltip(
                    message: 'از اینجا میتوانید اگهی های خود را فعال یا غیر فعال کنید',
                    triggerMode: TooltipTriggerMode.manual,

                    showDuration: const Duration(seconds: 2),
                    padding: EdgeInsets.all(5),
                    child: status==true?InkWell(
                        onTap: (){
                          onTapSwitch(status);

                        },
                        child: SvgPicture.asset('assets/icon/enableSwitch_icon.svg')):InkWell(
                        onTap: (){
                          onTapSwitch(status);
                        },
                        child: SvgPicture.asset('assets/icon/disableSwitch_icon.svg')),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }}

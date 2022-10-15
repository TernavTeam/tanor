import 'package:ammlak_app/constants/constants.dart';
import 'package:ammlak_app/models/place.dart';
import 'package:ammlak_app/page_base.dart';
import 'package:ammlak_app/utils/app_color.dart';
import 'package:ammlak_app/widget/item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class MyAdvertisingPage extends StatefulWidget {
  bool loginStatus;

  MyAdvertisingPage({required this.loginStatus, Key? key}) : super(key: key);

  @override
  State<MyAdvertisingPage> createState() => _MyAdvertisingPageState();
}

class _MyAdvertisingPageState extends State<MyAdvertisingPage> {
  List<Place> places = [];
  bool isLogin = false;
  int firstPrice = 30000;
  bool showLowOff = false;

  @override
  void initState() {
    //todo اینجا از سرور همونا رو باید بگیری اینجا فعلا بصورت موقت ئرش میکنیم
    places.add(Place(status: true));
    places.add(Place(status: false));
    super.initState();
    Future.delayed(const Duration(seconds: 5));
    final GlobalKey<ScaffoldState> _scaffoldKey =
        new GlobalKey<ScaffoldState>();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        print(
            'Backbutton pressed (device or appbar button), do whatever you want.');

        //trigger leaving and use own data
        Get.to(PageBase());

        //we need to return a future
        return Future.value(false);
      },
      child: Scaffold(
          backgroundColor: AppColor.backgroundColor,
          body: SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 25),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Directionality(
                        textDirection: TextDirection.rtl,
                        child: InkWell(
                          splashColor: Colors.transparent,

                            onTap: () {
                              Get.bottomSheet(StatefulBuilder(
                                  builder: (context, setState) {
                                    return Container(
                                      width: Get.width,
                                      height: Get.height / 2 - 20,
                                      decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(32),
                                          topLeft: Radius.circular(32),
                                        ),
                                        color: Colors.white,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8, vertical: 25),
                                        child: Center(
                                          child: Column(
                                            children: [
                                              const SizedBox(
                                                height: 25,
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.symmetric(horizontal: 23.0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                                  children: [
                                                    InkWell(
                                                      onTap: showLowOff == false
                                                          ? () {}
                                                          : () {
                                                        print("hola");
                                                        firstPrice -= 10000;
                                                        if (firstPrice <=
                                                            30000) {
                                                          showLowOff =
                                                          false;
                                                          setState(() {});
                                                        }

                                                        setState(() {});
                                                      },
                                                      child: Center(
                                                        child: CircleAvatar(
                                                          backgroundColor: Colors.transparent,

                                                          maxRadius: 50,
                                                          minRadius: 50,
                                                          child: Container(
                                                            width: 16,
                                                            height: 1.5,
                                                            color: showLowOff==false?AppColor.colorDisableItem:Colors.black,

                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      width: 25,
                                                    ),
                                                    Text(Constants
                                                        .replaceAndSpaceFarsiNumber(
                                                        firstPrice
                                                            .toString()),style: const TextStyle(letterSpacing: 2.0),),
                                                    const SizedBox(
                                                      width: 25,
                                                    ),
                                                    Center(
                                                        child: InkWell(
                                                          onTap: () {
                                                            print("hola");
                                                            firstPrice += 10000;
                                                            if (firstPrice > 30000) {
                                                              showLowOff = true;
                                                              setState(() {});
                                                            }

                                                            setState(() {});
                                                          },
                                                          child: CircleAvatar(
                                                            backgroundColor: Colors.transparent,


                                                            minRadius: 50,
                                                            maxRadius: 50,
                                                            child: SvgPicture.asset(
                                                                'assets/icon/bottomNavigationBar_icon/add_icon.svg',
                                                                height: 16,
                                                                width: 16,
                                                                color: Colors.black
                                                            ),
                                                          ),
                                                        )),
                                                  ],
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 35,
                                              ),
                                              SizedBox(
                                                width: Get.width,
                                                height: 150,

                                                child: Center(
                                                  child: Container(
                                                    width: Get.width / 2,
                                                    height: 56,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                        BorderRadius.circular(
                                                            12),
                                                        border: Border.all(
                                                            width: 1,
                                                            color: AppColor
                                                                .colorDisableItem)),
                                                    child: const Center(
                                                        child:
                                                        Text('افزایش موجودی')),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  }));
                            },

                          child: SizedBox(
                      width: Get.width,
                            height: 70,


                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  'assets/icon/addMoney_icon.svg',
                                  height: 25,
                                  width: 25,
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Directionality(
                                    textDirection: TextDirection.ltr,
                                    child: Text(
                                      textAlign: TextAlign.right,


                                      Constants.replaceAndSpaceFarsiNumber(
                                        '30000',
                                      ),
                                      style:
                                          const TextStyle(color: Color(0xff838383)),

                                    )),
                                const SizedBox(
                                  width: 8,
                                ),
                                const Text(
                                  'تومان',
                                  style:
                                      TextStyle(color: AppColor.colorDisableItem,),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    ListView.builder(
                        shrinkWrap: true,
                        itemCount: places.length,
                        itemBuilder: (context, i) {
                          Place item = places[i];
                          return ItemCustom(
                            showicon: false,
                            myAdvertising: false,
                            onTap: () {
                              print('onTap Called');
                            },
                            status: item.status,
                            showSwitch: true,
                            onTapSwitch: (bool) {
                              item.status = !item.status;
                              setState(() {});
                            },
                          );
                        }),
                  ],
                ),
              ),
            ),
          )),
    );
  }


}

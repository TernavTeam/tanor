import 'package:ammlak_app/constants/constants.dart';
import 'package:ammlak_app/utils/app_color.dart';
import 'package:ammlak_app/view/base_pages/detail_adversting_page.dart';
import 'package:ammlak_app/widget/item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  List strins=['','',''];

  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 5));
    setState(() {
      print("hola");
    });


  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      // body:Column(children: List.generate(5, (index) => const ItemCustom())
        body: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 20,
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          Constants.replaceFarsiNumber('خانه های اجاره ای تهران منطقه 10',),style: const TextStyle(fontFamily: 'IranSansNumber',color: Colors.black,fontWeight: FontWeight.bold),
                        ),
                      )),
                  Column(
                    children: List.generate(
                        strins.length
                        ,
                            (index) => Padding(
                          padding: const EdgeInsets.only(bottom: 5),
                          child: ItemCustom(
                            showicon: true,
                            myAdvertising: true,
                            showSwitch: false,

                            onTap: () {
                              Get.to(() => const DetailAdvertisingPage());
                            }, onTapSwitch: (bool ) {  },
                          ),
                        )),
                  )
                ],
              )),
        ));
  }
}


import 'package:ammlak_app/constants/constants.dart';
import 'package:ammlak_app/constants/scroll_options.dart';
import 'package:ammlak_app/utils/app_color.dart';
import 'package:ammlak_app/view/authentication/sing_in_page.dart';
import 'package:ammlak_app/view/base_pages/add_advertising_page.dart';
import 'package:ammlak_app/view/base_pages/home_page.dart';
import 'package:ammlak_app/view/base_pages/my_advertising_page.dart';
import 'package:ammlak_app/view/base_pages/search_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class PageBase extends StatefulWidget {
  PageBase({Key? key}) : super(key: key);

  @override
  State<PageBase> createState() => _PageBaseState();
}

class _PageBaseState extends State<PageBase> {
  var selectedIndex=0;
  bool showBottomNavigatio = true;
  int chooseIndexCategory = 1;
  int chooseIndexType = 1;

  int _bottomNavIndex = 0;
  final pages = [
    const Home(),
    const SearchPage(),
    AddAdvertisingPage(),
    MyAdvertisingPage(
      loginStatus: false,
    ),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();


    setState(() {});
  }

  forRefresh() {
    setState(() {});
  }

  List<String> type = [
    'زمین',
    'دفترکار',
    'مغازه',
    'خانه',



  ];
  List<String> category = [
    'فروش',
    'اجاره',

  ];
  List<String> stateList = [
    'تهران',
    'خراسان رضوی',
    'خراسان جنوبی',
    'خراسان شمالی',
    'گیلان',
    'مازندران',
    'اصفهان',
    'آذربایجان غربی',
    'آذربایجان شرقی',
    'کرمان',
    'سیستان',
    'یزد',
    'قم',
    'تبریز',
    'ابادان',
  ];
  List<String> manategh = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
  ];
  String stateFirstValue = 'تهران';
  String firstZoneValue = '10';
  String firsTypeValue = 'اجاره';
  String firstCategoryValue = 'خانه';
  int chooseIndexState = 0;
  int chooseIndexStatetest = 3;
  int chooseIndexManategh = 0;
  bool stateSelect = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
        body: pages[selectedIndex],
        bottomNavigationBar: Visibility(
          visible: showBottomNavigatio,
          child: buildMyNavBar(context),
        )

        );
  }

  bool login = false;

  callBackSuccess() {
    setState(() {
      login = true;
      selectedIndex = 3;
    });
  }

  onTapCallbavk() {
    setState(() {
      showBottomNavigatio == false;
    });
  }

  customBottomNavigationItem({
    required String picture,
    // required String text,
    required int index,
    required Function onTap,
  }) {

  }

  buildMyNavBar(BuildContext context) {
    return Container(
      color: Colors.transparent,
      width: Get.width,
      height: 56,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
              onPressed: () {
                print('hi World');
                selectedIndex = 0;
                setState(() {});
              },
              icon: selectedIndex == 0
                  ? SvgPicture.asset(
                      'assets/icon/bottomNavigationBar_icon/home_select_icon.svg',
                      height: 23,
                    )
                  : SvgPicture.asset(
                      'assets/icon/bottomNavigationBar_icon/home_dselect_icon.svg',
                      height: 23,
                    )),
          IconButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(32),
                      topLeft: Radius.circular(32),
                    ),
                  ),
                  builder: (context) {
                    return StatefulBuilder(
                        builder: (BuildContext context, StateSetter setState) {
                      return Container(
                        width: Get.width,
                        height: Get.height / 2 ,
                        decoration: const BoxDecoration(),
                        child: Align(
                          alignment: Alignment.center,

                          child: Column(
                            children: [

                              Container(
                                height: 90,
                                width: Get.width-30,
                                color: Colors.transparent,

                                child: Center(
                                  child: ListView.builder(
                                    padding: EdgeInsets.zero,

                                    shrinkWrap: true,
                                    itemCount: category.length,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, i) {

                                      return GestureDetector(
                                        onTap: (){
                                          setState(() {
                                            chooseIndexCategory = i;
                                          });
                                        },
                                        child: Container(
                                          width: Get.width / 2 - 30,
                                          height: 100,
                                          color: Colors.transparent,
                                          margin: const EdgeInsets.only(left: 2),

                                          child: Center(
                                            child: Text(
                                              category[i].toString(),
                                              style: TextStyle(
                                                  color: chooseIndexCategory ==
                                                      i
                                                      ? Colors.black
                                                      : AppColor
                                                      .colorDisableItem),
                                            ),
                                          ),
                                        ),
                                      );
                                    }
                                    // }, separatorBuilder: (BuildContext context, int index) { return SizedBox(width: 0,); },
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Container(
                                height: 1,
                                width: Get.width,
                                color: AppColor.colorDisableItem,
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              Container(
                                height: 56,
                                color: Colors.transparent,
                                child: ListView.builder(
                                  padding: EdgeInsets.zero,
                                  shrinkWrap: true,
                                  itemCount: type.length,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, i) {
                                    return GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          chooseIndexType = i;
                                        });
                                      },
                                      child: Container(
                                        width: 90,
                                        color: Colors.transparent,
                                        margin: const EdgeInsets.only(left: 2),
                                        child: Center(
                                          child: Text(
                                            type[i].toString(),
                                            style: TextStyle(
                                                color: chooseIndexType == i
                                                    ? Colors.black
                                                    : AppColor.colorDisableItem),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                              const SizedBox(height: 70),
                              InkWell(
                                onTap: (){

                                    showModalBottomSheet(isScrollControlled: true,
                                        context: context,
                                        builder: (context)=>
                                            StatefulBuilder(
                                                builder: (context, setState) {
                                                  return stateSelect == false
                                                      ? Container(
                                                    height: Get.height,
                                                    width: Get.width,
                                                    color: Colors.white,
                                                    child: Column(
                                                      children: [
                                                        const SizedBox(
                                                          height: 90,
                                                        ),
                                                        Expanded(
                                                          child: ScrollConfiguration(
                                                            behavior: MyBehavior(),
                                                            child: ListView.builder(
                                                              shrinkWrap: true,
                                                              physics:
                                                              const BouncingScrollPhysics(),
                                                              itemCount: stateList.length,
                                                              scrollDirection:
                                                              Axis.vertical,
                                                              itemBuilder: (context, i) {
                                                                return GestureDetector(
                                                                  onTap: () {
                                                                    setState(() {
                                                                      chooseIndexState =
                                                                          i;
                                                                    });
                                                                  },
                                                                  child: Center(
                                                                    child: Padding(
                                                                      padding:
                                                                      const EdgeInsets
                                                                          .symmetric(
                                                                        vertical: 8.0,
                                                                      ),
                                                                      child: Padding(
                                                                        padding:
                                                                        const EdgeInsets
                                                                            .only(
                                                                            bottom:
                                                                            20),
                                                                        child: InkWell(
                                                                          onTap: () {
                                                                            setState(() {
                                                                              stateSelect =
                                                                              true;

                                                                              stateFirstValue =
                                                                                  stateList[i]
                                                                                      .toString();
                                                                            });
                                                                          },
                                                                          child: Text(
                                                                            stateList[i]
                                                                                .toString(),
                                                                            style: TextStyle(
                                                                                color: chooseIndexState == i
                                                                                    ? Colors
                                                                                    .black
                                                                                    : const Color(
                                                                                    0xff999999),
                                                                                fontFamily:
                                                                                'iransansXv',
                                                                                fontSize:
                                                                                18,
                                                                                fontWeight: chooseIndexState == i
                                                                                    ? FontWeight
                                                                                    .bold
                                                                                    : FontWeight
                                                                                    .w400),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                );
                                                              },
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  )
                                                      : StatefulBuilder(
                                                      builder: (context, setState) {
                                                        return Container(
                                                          height: Get.height,
                                                          width: Get.width,
                                                          color: Colors.white,
                                                          child: Column(
                                                            children: [
                                                              const SizedBox(
                                                                height: 90,
                                                              ),
                                                              const Text('منطقه ',
                                                                  style: TextStyle(
                                                                      fontFamily:
                                                                      'iransansXv',
                                                                      fontSize: 15,
                                                                      color: AppColor
                                                                          .priceDisableColor)),
                                                              const SizedBox(
                                                                height: 30,
                                                              ),
                                                              Expanded(
                                                                child: ScrollConfiguration(
                                                                  behavior: MyBehavior(),
                                                                  child: ListView.builder(
                                                                    shrinkWrap: true,
                                                                    physics:
                                                                    const BouncingScrollPhysics(),
                                                                    itemCount:
                                                                    stateList.length,
                                                                    scrollDirection:
                                                                    Axis.vertical,
                                                                    itemBuilder:
                                                                        (context, i) {
                                                                      return GestureDetector(
                                                                        onTap: () {
                                                                          setState(() {});
                                                                        },
                                                                        child: Center(
                                                                          child: Padding(
                                                                            padding:
                                                                            const EdgeInsets
                                                                                .only(
                                                                                bottom:
                                                                                20),
                                                                            child: InkWell(
                                                                              onTap:
                                                                                  () async {
                                                                                chooseIndexManategh =
                                                                                    i;
                                                                                print(
                                                                                    chooseIndexManategh);
                                                                                firstZoneValue =
                                                                                    manategh[
                                                                                    i]
                                                                                        .toString();
                                                                                Get.back();
                                                                                setState(
                                                                                        () {});
                                                                                stateSelect =
                                                                                false;
                                                                                forRefresh();
                                                                              },
                                                                              child: Text(
                                                                                manategh[i]
                                                                                    .toString(),
                                                                                style: TextStyle(
                                                                                    color: chooseIndexManategh == i
                                                                                        ? Colors
                                                                                        .black
                                                                                        : const Color(
                                                                                        0xff999999),
                                                                                    fontFamily:
                                                                                    'IranSansNumber',
                                                                                    fontSize:
                                                                                    20,
                                                                                    fontWeight: chooseIndexManategh == i
                                                                                        ? FontWeight
                                                                                        .bold
                                                                                        : FontWeight
                                                                                        .normal),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      );
                                                                    },
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        );
                                                      });
                                                }));


                                },
                                child: Container(
                                  height: 100,
                                  color: Colors.transparent,

                                  child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 18.0),
                                        child:


                                           Row(children: [
                                             Text(Constants.replaceFarsiNumber(firstZoneValue),style: const TextStyle(color: AppColor.colorDisableItem),),
                                             const SizedBox(width: 5,),
                                             const Text("منطقه",style: TextStyle(color: AppColor.colorDisableItem),),
                                             const SizedBox(width: 5,),
                                             Text(stateFirstValue,style: const TextStyle(color: AppColor.colorDisableItem),),
                                            SvgPicture.asset(
                                                'assets/icon/location_icon.svg',),
                                          ]),
                                        ),
                                      ),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    });
                  },
                );
              },
              icon: SvgPicture.asset(
                'assets/icon/bottomNavigationBar_icon/search_icon.svg',
                height: 23,
              )),
          IconButton(
              onPressed: () {
                selectedIndex = 2;

                Navigator.of(context, rootNavigator: true).push(
                  MaterialPageRoute(builder: (context) {
                    return AddAdvertisingPage();
                  }),
                );
              },
              icon: SvgPicture.asset(
                'assets/icon/bottomNavigationBar_icon/add_icon.svg',
                height: 23,
              )),
          IconButton(
              onPressed: () {
                selectedIndex = 3;
                print(selectedIndex);
                setState(() {});
              },
              icon: selectedIndex == 3
                  ? SvgPicture.asset(
                      'assets/icon/bottomNavigationBar_icon/add_select_icon.svg',
                      height: 23,
                    )
                  : SvgPicture.asset(
                      'assets/icon/bottomNavigationBar_icon/add_dselect_icon.svg',
                      height: 23,
                    )),
        ],
      ),
    );
  }

  bool homeIcon(index) {
    if (index == selectedIndex) {
      return true;
    } else {
      return false;
    }
  }
}

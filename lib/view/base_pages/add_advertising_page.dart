import 'dart:io';

import 'package:ammlak_app/constants/constants.dart';
import 'package:ammlak_app/constants/scroll_options.dart';
import 'package:ammlak_app/utils/app_color.dart';
import 'package:ammlak_app/widget/textfield_custome.dart';
import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class AddAdvertisingPage extends StatefulWidget {
  AddAdvertisingPage({Key? key}) : super(key: key);

  @override
  State<AddAdvertisingPage> createState() => _AddAdvertisingPageState();
}

class _AddAdvertisingPageState extends State<AddAdvertisingPage> {
  TextEditingController meterController = TextEditingController();
  TextEditingController rentController = TextEditingController();
  TextEditingController depositController = TextEditingController();
  TextEditingController state = TextEditingController();
  TextEditingController Mantaghe = TextEditingController();
  TextEditingController _textController = TextEditingController();
  var controller = MoneyMaskedTextController(
      precision: 0, thousandSeparator: ' ', decimalSeparator: "");

  var controllerForRent = MoneyMaskedTextController(
      precision: 0, thousandSeparator: ' ', decimalSeparator: "");
  final snackBar = SnackBar(
      content: SizedBox(
    height: 56,
    width: Get.width,
    child: Text('موجودی ناکافی'),
  ));

  int maxLength = 3;
  String text = "";
  var textLength = 0;
  final GlobalKey<FormState> meterKey = GlobalKey<FormState>();
  final GlobalKey<FormState> rentKey = GlobalKey<FormState>();
  final GlobalKey<FormState> depositKey = GlobalKey<FormState>();
  final GlobalKey<FormState> test = GlobalKey<FormState>();
  final ImagePicker _picker = ImagePicker();
  bool parkingStatus = false;
  bool BalkonStatus = false;
  bool anbarStatus = false;
  bool asansoorStatus = false;
  bool stateSelect = false;
  File? _image;
  File? _image2;
  final responseHeight = Get.height / 3;
  final responseWidth = Get.width / 2;
  String stateFirstValue = 'تهران';
  String firstZoneValue = '10';
  String firsTypeValue = 'اجاره';
  String firstCategoryValue = 'خانه';
  String darad = 'دارد';
  String darad2 = 'دارد';
  bool validate = false;
  bool validateRent = false;
  bool validateDeposit = false;

  final CurrencyTextInputFormatter _formatter = CurrencyTextInputFormatter(
    locale: 'Ir',
    decimalDigits: 0,
    symbol: '',
  );

  int _count = 0;
  String manateghTxt = 'منطقه';

  void chageCount(int count) {
    setState(() {
      _count = count;
    });
  }

  var maskFormatter = MaskTextInputFormatter(
      mask: '### ### ### ',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.eager);

  forRefresh() {
    setState(() {});
  }

  List<String> type = [
    'خانه',
    'مغازه',
    'دفترکار',
    'زمین',
  ];
  List<String> category = [
    'اجاره',
    'فروش',
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
    'منطقه',
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

  int chooseIndexType = 0;
  int chooseIndexCategory = 0;
  int chooseIndexState = 0;
  int chooseIndexStatetest = 3;
  int chooseIndexManategh = 0;
  final maskCNPJ = MaskTextInputFormatter(
      mask: "#####.###/####-##", filter: {"#": RegExp(r'[0-9]')});

  Future _getFromCameraOrGallery(bool isCamera) async {
    if (isCamera) {
      final XFile? rawFileFromCamera = await _picker.pickImage(
        source: ImageSource.camera,
      );
      _image = File(rawFileFromCamera!.path);
      setState(() {});
    } else {
      final XFile? rawFileFromGallery = await _picker.pickImage(
        source: ImageSource.gallery,
      );
      final File imageConvertToXFile = File(rawFileFromGallery!.path);
      _image = File(rawFileFromGallery!.path);
      setState(() {});
    }
  }

  Future _getFromCameraOrGallery2(bool isCamera) async {
    if (isCamera) {
      final XFile? rawFileFromCamera = await _picker.pickImage(
        source: ImageSource.camera,
      );

      _image2 = File(rawFileFromCamera!.path);
      setState(() {});
    } else {
      final XFile? rawFileFromGallery = await _picker.pickImage(
        source: ImageSource.gallery,
      );
      final File imageConvertToXFile = File(rawFileFromGallery!.path);
      _image2 = File(rawFileFromGallery!.path);
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 25),
              child: Center(
                child: Column(
                  children: [
                    const SizedBox(
                      // befor nmber -->145
                      height: 50,
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 42.0),
                          child: Column(
                            children: [
                              /// بخش انتخاب اجاره یا ودیعه
                              InkWell(
                                onTap: () {
                                  FocusScope.of(context).unfocus();
                                  Get.bottomSheet(StatefulBuilder(
                                      builder: (context, setState) {
                                    return Container(
                                      height: Get.height / 4,
                                      decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(32),
                                          topLeft: Radius.circular(32),
                                        ),
                                        color: Colors.white,
                                      ),
                                      child: Container(
                                        child: ListView.builder(
                                          shrinkWrap: true,
                                          itemCount: category.length,
                                          scrollDirection: Axis.vertical,
                                          itemBuilder: (context, i) {
                                            return GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  chooseIndexCategory = i;
                                                  firsTypeValue =
                                                      category[i].toString();
                                                  Get.back();
                                                  setState(() {});
                                                  forRefresh();
                                                });
                                              },
                                              child: Container(
                                                height: 100,
                                                color: Colors.transparent,
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
                                          },
                                        ),
                                      ),
                                    );
                                  }));
                                },
                                child: Container(
                                  width: Get.width,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(firsTypeValue),
                                      const SizedBox(
                                        width: 8,
                                      ),
                                      SvgPicture.asset(
                                        'assets/icon/arrow_icon.svg',
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 45,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 42.0),
                          child: Column(
                            children: [
                              /// بخش انتخاب دسته بندی خانه ، مغازه و ...
                              InkWell(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(firstCategoryValue),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    SvgPicture.asset(
                                      'assets/icon/arrow_icon.svg',
                                    ),
                                  ],
                                ),
                                onTap: () {
                                  FocusScope.of(context).unfocus();

                                  Get.bottomSheet(StatefulBuilder(
                                      builder: (context, setState) {
                                    return Container(
                                      height: Get.height / 3,
                                      decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(32),
                                          topLeft: Radius.circular(32),
                                        ),
                                        color: Colors.white,
                                      ),
                                      child: Center(
                                        child: ListView.builder(
                                          shrinkWrap: true,
                                          itemCount: type.length,
                                          scrollDirection: Axis.vertical,
                                          itemBuilder: (context, i) {
                                            return GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  chooseIndexType = i;
                                                  firstCategoryValue =
                                                      type[i].toString();
                                                  Get.back();
                                                  setState(() {});
                                                  forRefresh();
                                                });
                                              },
                                              child: Container(
                                                height: 50,
                                                color: Colors.transparent,
                                                child: Center(
                                                  child: Text(
                                                    type[i].toString(),
                                                    style: TextStyle(
                                                        color: chooseIndexType ==
                                                                i
                                                            ? Colors.black
                                                            : AppColor
                                                                .colorDisableItem),
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    );
                                  }));
                                },
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 45,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 42.0),
                          child: Column(
                            children: [
                              /// بخش انتخاب مناطق
                              InkWell(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Row(
                                        textDirection: TextDirection.rtl,
                                        children: [
                                          Text(
                                            stateFirstValue,
                                            style: const TextStyle(
                                                fontFamily: 'IranSansNumber2',
                                                fontWeight: FontWeight.w400),
                                          ),
                                          const SizedBox(
                                            width: 3,
                                          ),
                                          const Text('منطقه'),
                                          const SizedBox(
                                            width: 3,
                                          ),
                                          Text(Constants.replaceFarsiNumber(
                                              firstZoneValue)),
                                        ]),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    SvgPicture.asset(
                                      'assets/icon/arrow_icon.svg',
                                    ),
                                  ],
                                ),
                                onTap: () {
                                  FocusScope.of(context).unfocus();

                                  Get.bottomSheet(isScrollControlled: true,
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
                                                      itemCount:
                                                          stateList.length,
                                                      scrollDirection:
                                                          Axis.vertical,
                                                      itemBuilder:
                                                          (context, i) {
                                                        return GestureDetector(
                                                          onTap: () {
                                                            setState(() {
                                                              chooseIndexState =
                                                                  i;
                                                            });
                                                          },
                                                          child: Center(
                                                            child: InkWell(
                                                              onTap: () {
                                                                setState(
                                                                    () {
                                                                  stateSelect =
                                                                      true;

                                                                  stateFirstValue =
                                                                      stateList[i]
                                                                          .toString();
                                                                });
                                                              },
                                                              child:
                                                                  Container(
                                                                  height:
                                                                    70,
                                                                  color: Colors.transparent,
                                                                  child:
                                                                    Center(
                                                                  child:
                                                                      Text(
                                                                    stateList[i]
                                                                        .toString(),
                                                                    style: TextStyle(
                                                                        color: chooseIndexState == i ? Colors.black : const Color(0xff999999),
                                                                        fontFamily: 'iransansXv',
                                                                        fontSize: 18,
                                                                        fontWeight: chooseIndexState == i ? FontWeight.bold : FontWeight.w400),
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
                                                              child: InkWell(
                                                                onTap:
                                                                    () async {
                                                                  chooseIndexManategh =
                                                                      i;

                                                                  if (chooseIndexManategh !=
                                                                      0) {
                                                                    firstZoneValue =
                                                                        manategh[i]
                                                                            .toString();
                                                                    Get.back();
                                                                    setState(
                                                                        () {});
                                                                    stateSelect =
                                                                        false;
                                                                    forRefresh();
                                                                  } else {
                                                                    () {
                                                                      chooseIndexManategh =
                                                                          1;
                                                                    };
                                                                  }
                                                                },
                                                                child:
                                                                    Container(
                                                                      height: 50,
                                                                  color: Colors.transparent,
                                                                  child:
                                                                      Center(
                                                                    child:
                                                                        Text(
                                                                      manategh[i]
                                                                          .toString(),
                                                                      style: TextStyle(
                                                                          color: chooseIndexManategh == i
                                                                              ? Colors.black
                                                                              : const Color(0xff999999),
                                                                          fontFamily: 'IranSansNumber',
                                                                          fontSize: 20,
                                                                          fontWeight: chooseIndexManategh == i ? FontWeight.bold : FontWeight.normal),
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
                                            );
                                          });
                                  }));
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(top: 45),
                                child: Text(
                                  'متر',
                                  style: TextStyle(
                                      fontSize: 12, color: AppColor.colorLine),
                                ),
                              ),
                              const SizedBox(width: 12),
                              SizedBox(
                                width: Get.width / 2 + 60,
                                child: Column(
                                  children: [
                                    Form(
                                      key: meterKey,
                                      child: Directionality(
                                        textDirection: TextDirection.rtl,
                                        child: TextFormField(
                                          keyboardType: TextInputType.number,
                                          style: const TextStyle(
                                              fontFamily: 'IranSansNumber',
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20),
                                          inputFormatters: [
                                            FilteringTextInputFormatter
                                                .digitsOnly
                                          ],
                                          textDirection: TextDirection.ltr,
                                          controller: meterController,
                                          decoration: InputDecoration(
                                            contentPadding:
                                                EdgeInsets.only(bottom: 0),
                                            enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: validate == false
                                                      ? const Color(0xffBEBEBE)
                                                      : Colors.red,
                                                  width: 1.3),
                                            ),
                                            label: const Text(
                                              'متراژ',
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontFamily: 'yekan'),
                                            ),
                                          ),
                                          validator: (value) {
                                            value = meterController.text;
                                            if (value.length <= 0) {
                                              validate = true;
                                              setState(() {});
                                            } else {
                                              validate = false;
                                              setState(() {});
                                            }
                                            return null;
                                          },
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),

                          /// metraj
                          const SizedBox(
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(top: 45),
                                child: Text(
                                  'تومان',
                                  style: TextStyle(
                                      fontSize: 12, color: AppColor.colorLine),
                                ),
                              ),
                              const SizedBox(width: 2),
                              const SizedBox(
                                width: 10,
                              ),
                              SizedBox(
                                width: Get.width / 2 + 60,
                                child: SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      StatefulBuilder(builder:
                                          (BuildContext context,
                                              StateSetter setState) {
                                        return Form(
                                          key: rentKey,
                                          child: Directionality(
                                            textDirection: TextDirection.rtl,
                                            child: TextFormField(
                                              keyboardType:
                                                  TextInputType.number,
                                              style: const TextStyle(
                                                  fontFamily: 'IranSansNumber',
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18),
                                              textDirection: TextDirection.ltr,
                                              controller: controllerForRent,
                                              decoration: InputDecoration(
                                                  contentPadding:
                                                      const EdgeInsets.only(
                                                          bottom: 0),
                                                  enabledBorder:
                                                      UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: validateRent ==
                                                                false
                                                            ? const Color(
                                                                0xffBEBEBE)
                                                            : Colors.red,
                                                        width: 1.3),
                                                  ),
                                                  label: const Text(
                                                    'اجاره',
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        fontFamily: 'yekan',
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  )),
                                              validator: (value) {
                                                value = controllerForRent.text;
                                                if (value.length <= 0) {
                                                  validateRent = true;
                                                  setState(() {});
                                                } else {
                                                  validateRent = false;
                                                  setState(() {});
                                                }
                                                return null;
                                              },
                                            ),
                                          ),
                                        );
                                      }),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),

                          /// ejare
                          const SizedBox(
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(top: 40),
                                child: Text(
                                  'تومان',
                                  style: TextStyle(
                                      fontSize: 12, color: AppColor.colorLine),
                                ),
                              ),
                              const SizedBox(width: 12),
                              SizedBox(
                                width: Get.width / 2 + 60,
                                child: SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      StatefulBuilder(builder:
                                          (BuildContext context,
                                              StateSetter setState) {
                                        return Form(
                                          key: depositKey,
                                          child: Directionality(
                                            textDirection: TextDirection.rtl,
                                            child: TextFormField(
                                              keyboardType:
                                                  TextInputType.number,
                                              style: const TextStyle(
                                                  fontFamily: 'IranSansNumber',
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18),
                                              textDirection: TextDirection.ltr,
                                              controller: controller,
                                              decoration: InputDecoration(
                                                  contentPadding:
                                                      const EdgeInsets.only(
                                                          bottom: 0),
                                                  enabledBorder:
                                                      UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: validateDeposit ==
                                                              false
                                                          ? const Color(
                                                              0xffBEBEBE)
                                                          : Colors.red,
                                                      width: 1.3,
                                                    ),
                                                  ),
                                                  errorStyle: const TextStyle(

                                                  ),
                                                  label: const Text(
                                                    'ودیعه',
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        fontFamily: 'yekan',
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  )),
                                              validator: (value) {
                                                value = controller.text;
                                                if (value.length <= 0) {
                                                  validateDeposit = true;
                                                  setState(() {});
                                                } else {
                                                  validateDeposit = false;
                                                  setState(() {});
                                                }
                                                return null;
                                              },
                                            ),
                                          ),
                                        );
                                      }),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 88,
                          ),

                          Column(
                            children: [
                              Container(


                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        anbarStatus = !anbarStatus;

                                        setState(() {
                                          print(asansoorStatus);
                                        });
                                      },
                                      child: Container(
                                        height: 31,
                                        width: Get.width/2-10,


                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,

                                          children: [
                                            anbarStatus != true
                                                ? SvgPicture.asset(
                                                    'assets/icon/circl_icon.svg',
                                                    height: 18,
                                                  )
                                                : SvgPicture.asset(
                                                    'assets/icon/tik_icon.svg'),
                                            const SizedBox(
                                              width: 8,
                                            ),
                                            Text(
                                              'انباری دارد',
                                              style: TextStyle(
                                                  color: anbarStatus == false
                                                      ? AppColor.colorDisableItem
                                                      : Colors.black),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        BalkonStatus = !BalkonStatus;

                                        setState(() {
                                          print(asansoorStatus);
                                        });
                                      },
                                      child: Container(
                                        height: 31,
                                        width: Get.width/2-20,

                                        child: Center(
                                          child: Row(
                                           mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              BalkonStatus != true
                                                  ? SvgPicture.asset(
                                                      'assets/icon/circl_icon.svg',
                                                      height: 18,
                                                    )
                                                  : SvgPicture.asset(
                                                      'assets/icon/tik_icon.svg'),
                                              const SizedBox(
                                                width: 8,
                                              ),
                                              Row(
                                                children: [
                                                  Visibility(
                                                      visible: !BalkonStatus,
                                                      child: Text(darad.toString(),
                                                          style: TextStyle(
                                                              color: BalkonStatus ==
                                                                      false
                                                                  ? AppColor
                                                                      .colorDisableItem
                                                                  : Colors.black))),
                                                  SizedBox(
                                                    width: 3,
                                                  ),
                                                  Text("بالکن",
                                                      style: TextStyle(
                                                          color: BalkonStatus == false
                                                              ? AppColor
                                                                  .colorDisableItem
                                                              : Colors.black)),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 24,
                              ),
                              Container(

                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,

                                  children: [
                                    InkWell(
                                      onTap: () {
                                        print('holachezz');
                                        parkingStatus = !parkingStatus;

                                        setState(() {
                                          print(parkingStatus);
                                        });
                                      },
                                      child: Container(
                                        height: 31,

                                        width: Get.width/2-10,

                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            parkingStatus != true
                                                ? SvgPicture.asset(
                                                    'assets/icon/circl_icon.svg',
                                                    height: 18,
                                                  )
                                                : SvgPicture.asset(
                                                    'assets/icon/tik_icon.svg'),
                                            const SizedBox(
                                              width: 8,
                                            ),
                                            Text(
                                              'پارکینگ',
                                              style: TextStyle(
                                                  color: parkingStatus == false
                                                      ? AppColor.colorDisableItem
                                                      : Colors.black),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        print('holachezz');
                                        asansoorStatus = !asansoorStatus;

                                        setState(() {
                                          print(asansoorStatus);
                                        });
                                      },
                                      child: Container(

                                        width: Get.width/2-20,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,

                                          children: [
                                            asansoorStatus != true
                                                ? SvgPicture.asset(
                                                    'assets/icon/circl_icon.svg',
                                                    height: 18,
                                                  )
                                                : SvgPicture.asset(
                                                    'assets/icon/tik_icon.svg'),
                                            const SizedBox(
                                              width: 8,
                                            ),
                                            Text(
                                              'آسانسور',
                                              style: TextStyle(
                                                  color: asansoorStatus == false
                                                      ? AppColor.colorDisableItem
                                                      : Colors.black),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 150,
                          ),

                          CustomTextfield(
                            maxLength: 6,
                            hint: '',
                            text1: 'توضیحات مثلا',
                            text2: 'سال ساخت 98 ، رو به افتاب',
                            text3: 'طبقه دوم',
                          ),
                          const SizedBox(
                            height: 150,
                          ),
                          CustomTextfield(
                            maxLength: 6,
                            hint: '',
                            text1: 'اگرخانه معایبی دارد اینجا بنویسید مثلا',
                            text2: 'خط تلفن ندارد ، از مترو دور است',
                            text3: ' منطقه شلوغ',
                          ),
                          const SizedBox(
                            height: 150,
                          ),

                          /// this section for image set
                          _image == null
                              ? InkWell(
                              splashColor: Colors.transparent,

                              onTap: () {
                                    Get.bottomSheet(Container(
                                      width: Get.width,
                                      height: 140,
                                      decoration: const BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(12),
                                              topLeft: Radius.circular(12))),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          SizedBox(

                                            height: Get.height,
                                            width: Get.width/3,

                                            child: IconButton(
                                                onPressed: () {
                                                  _getFromCameraOrGallery(false);
                                                  Get.back();
                                                },
                                                icon: SvgPicture.asset(
                                                    'assets/icon/grid_icon.svg')),
                                          ),
                                          SizedBox(
                                            height: Get.height,
                                            width: Get.width/3,
                                            child: IconButton(
                                                onPressed: () async {
                                                  await _getFromCameraOrGallery(
                                                      true);
                                                  Get.back();
                                                },
                                                icon: SvgPicture.asset(
                                                    'assets/icon/camera2_icon.svg')),
                                          ),
                                          SizedBox(
                                            height: Get.height,
                                            width: Get.width/3,
                                            child: IconButton(
                                                onPressed: _image == null
                                                    ? () {}
                                                    : () {
                                                        _image = null;
                                                        Get.back();
                                                        setState(() {});
                                                      },
                                                icon: SvgPicture.asset(
                                                  'assets/icon/trash_icon.svg',
                                                  color: _image == null
                                                      ? AppColor.colorDisableItem
                                                      : Colors.black,
                                                )),
                                          ),
                                        ],
                                      ),
                                    ));
                                  },
                                  child: Container(
                                    width: Get.width,
                                    height: 150,

                                    child: Center(
                                      child: SvgPicture.asset(
                                          'assets/icon/camera_icon.svg',height: 80,),
                                    ),
                                  ))
                              : InkWell(
                            splashColor: Colors.transparent,

                            onTap: () {
                                    Get.bottomSheet(Container(
                                      width: Get.width,
                                      height: 140,
                                      decoration: const BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(12),
                                              topLeft: Radius.circular(12))),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          SizedBox(
                                            height: Get.height,
                                            width: Get.width/3,
                                            child: IconButton(
                                                onPressed: () {
                                                  _getFromCameraOrGallery(false);
                                                  Get.back();
                                                },
                                                icon: SvgPicture.asset(
                                                    'assets/icon/grid_icon.svg')),
                                          ),
                                          SizedBox(
                                            height: Get.height,
                                            width: Get.width/3,
                                            child: IconButton(
                                                onPressed: () async {
                                                  await _getFromCameraOrGallery(
                                                      true);
                                                  Get.back();
                                                },
                                                icon: SvgPicture.asset(
                                                    'assets/icon/camera2_icon.svg')),
                                          ),
                                          SizedBox(
                                            height: Get.height,
                                            width: Get.width/3,
                                            child: IconButton(
                                                onPressed: _image == null
                                                    ? () {}
                                                    : () {
                                                        _image = null;
                                                        setState(() {});
                                                        Get.back();
                                                      },
                                                icon: SvgPicture.asset(
                                                  'assets/icon/trash_icon.svg',
                                                  color: _image == null
                                                      ? AppColor.colorDisableItem
                                                      : Colors.black,
                                                )),
                                          ),
                                        ],
                                      ),
                                    ));
                                  },
                                  child: CircleAvatar(
                                    radius: 110,
                                    backgroundImage: Image.file(
                                      File(_image!.path),
                                      fit: BoxFit.fitWidth,
                                    ).image,
                                  ),
                                ),

                          _image2 == null
                              ? InkWell(
                              splashColor: Colors.transparent,

                              onTap: () {

                                    Get.bottomSheet(Container(
                                      width: Get.width,
                                      height: 140,
                                      decoration: const BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(12),
                                              topLeft: Radius.circular(12))),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          SizedBox(

                                            height: Get.height,
                                            width: Get.width/3,

                                            child: IconButton(
                                                onPressed: () {
                                                  _getFromCameraOrGallery2(false);
                                                  Get.back();
                                                },
                                                icon: SvgPicture.asset(
                                                    'assets/icon/grid_icon.svg')),

                                          ),
                                          SizedBox(
                                            height: Get.height,
                                            width: Get.width/3,
                                            child: IconButton(
                                                onPressed: () {
                                                  _getFromCameraOrGallery2(true);
                                                  Get.back();
                                                },
                                                icon: SvgPicture.asset(
                                                    'assets/icon/camera2_icon.svg')),
                                          ),
                                          SizedBox(
                                            height: Get.height,
                                            width: Get.width/3,
                                            child: IconButton(
                                              onPressed: _image2 == null
                                                  ? () {}
                                                  : () {
                                                      _image2 = null;
                                                      setState(() {});
                                                      Get.back();
                                                    },
                                              icon: SvgPicture.asset(
                                                'assets/icon/trash_icon.svg',
                                                color: _image2 == null
                                                    ? AppColor.colorDisableItem
                                                    : Colors.black,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ));
                                  },
                                  child: Container(
                                    height: 150,

                                    width: Get.width,
                                    child: Center(
                                      child: SvgPicture.asset(
                                          'assets/icon/camera_icon.svg',height: 80,),
                                    ),
                                  ))
                              : InkWell(
                            splashColor: Colors.transparent,

                            onTap: () {
                                    Get.bottomSheet(Container(
                                      width: Get.width,
                                      height: 140,

                                      decoration: const BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(12),
                                              topLeft: Radius.circular(12))),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Container(

                                            width: Get.width/3,

                                            height: Get.height,

                                            child: IconButton(
                                                onPressed: () {
                                                  _getFromCameraOrGallery2(false);
                                                  Get.back();
                                                },
                                                icon: SvgPicture.asset(
                                                    'assets/icon/grid_icon.svg')),
                                          ),
                                          Container(

                                            height:Get.height ,
                                            width: Get.width/3,

                                            child: IconButton(
                                                onPressed: () async {
                                                  await _getFromCameraOrGallery2(
                                                      true);
                                                  Get.back();
                                                },
                                                icon: SvgPicture.asset(
                                                    'assets/icon/camera2_icon.svg')),
                                          ),
                                          Container(
                                            height: Get.height,
                                            width: Get.width/3,

                                            child: IconButton(
                                                onPressed: () {
                                                  _image2 = null;
                                                  Get.back();
                                                  setState(() {});
                                                },
                                                icon: SvgPicture.asset(
                                                  'assets/icon/trash_icon.svg',
                                                  color: _image2 == null
                                                      ? AppColor.colorDisableItem
                                                      : Colors.black,
                                                )),
                                          ),
                                        ],
                                      ),
                                    ));
                                  },
                                  child: CircleAvatar(
                                    radius: 110,
                                    backgroundImage: Image.file(
                                      File(_image2!.path),
                                      fit: BoxFit.fitWidth,
                                    ).image,
                                  ),
                                ),

                          const SizedBox(
                            height: 50,
                          ),

                          /// Button Send
                          InkWell(
                            splashColor: Colors.transparent,

                            onTap: () {
                              print("object");
                              checkValidator(meterKey);
                              checkValidator(rentKey);
                              checkValidator(depositKey);

                            },
                            child: GestureDetector(
                              onTap: (){print('fff');},
                              child: SizedBox(
                                height: 90,

                                width: Get.width,
                                child: Center(
                                  child: Container(
                                      width: 200,
                                      height: 48,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(12),
                                          border: Border.all(
                                              width: 1, color: AppColor.colorLine)),
                                      child: const Center(child: Text('ارسال آگهی'))),
                                ),
                              ),
                            ),
                          ),

                          const SizedBox(
                            height: 50,
                          ),
                        ]),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  checkValidator(keyValidator) {
    if (keyValidator.currentState!.validate()) {
      setState(() {});
    }
  }
}

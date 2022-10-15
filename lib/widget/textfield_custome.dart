import 'dart:core';

import 'package:ammlak_app/component/max_word_textinput_formater.dart';
import 'package:ammlak_app/component/text_input_field_widget.dart';
import 'package:ammlak_app/constants/constants.dart';
import 'package:ammlak_app/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class CustomTextfield extends StatefulWidget {
String text1;
String text2;
String text3;

   int maxLength = 0;
  var hint;
  bool showHint=true;




  CustomTextfield({required this.maxLength, required this.hint,required this.text1,required this.text2,required this.text3, Key? key})
      : super(key: key);

  @override
  State<CustomTextfield> createState() => _CustomTextfieldState();
}

class _CustomTextfieldState extends State<CustomTextfield> {
  int _count = 0;
  int _maxLine = 1;
  bool showDescription = true;
  bool showBorder=true;


  maxLineFunction(){
    _maxLine=3;

    setState(() {

    });
  }

  void chageCount(int count) {
    setState(() {
      _count = count;
      if (_count != 0) {
        showDescription = false;
        showBorder=false;
      } else {
        showDescription = true;
        showBorder=true;


      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return _buildTextField();
  }

  // Widget _buildTextField() {
  //
  //
  //    return Padding(
  //      padding: EdgeInsets.symmetric(horizontal: 16),
  //      child: Column(
  //       children: [
  //         Padding(
  //           padding: const EdgeInsets.only(bottom: 8.0),
  //           child: Visibility(
  //             visible: showDescription,
  //             child: Column(children:  [
  //               Align(
  //                   alignment: Alignment.centerRight,child: Text(widget.text1,style:  TextStyle(color: Color(0xffAAAAAA).withOpacity(.3)),)),
  //               Align(
  //                   alignment: Alignment.centerRight,
  //                   child: Text(widget.text2,style:  TextStyle(color: Color(0xffAAAAAA).withOpacity(.3)))),
  //               Align(
  //                   alignment: Alignment.centerRight,
  //                   child: Text(widget.text3,style:  TextStyle(color: Color(0xffAAAAAA).withOpacity(.3)))),
  //             ],),
  //           ),
  //         ),
  //
  //         Align(
  //           alignment: Alignment.centerRight,
  //           child: Container(
  //             width: Get.width,
  //             decoration:  BoxDecoration(
  //
  //                 border:
  //                     Border(bottom: BorderSide(width: .1, color: showBorder==true?Colors.black:Colors.transparent))),
  //             child: Directionality(
  //               textDirection: TextDirection.rtl,
  //               child: TextInputFieldWidget(
  //
  //
  //                 textInputFormatters: [
  //
  //                   // FilteringTextInputFormatter.allow(RegExp(r"[a-z\s_-]+")),
  //                   MaxWordTextInputFormater(
  //
  //                       maxWords: widget.maxLength, currentLength: chageCount),
  //                 ],
  //                 maxLines: 3,
  //
  //
  //
  //
  //
  //
  //               ),
  //             ),
  //           ),
  //         ),
  //         const SizedBox(
  //           height: 10,
  //         ),
  //         Align(alignment: Alignment.centerRight, child: _buildCompute()),
  //       ],
  //   ),
  //    );
  // }
  Widget _buildTextField() {
    return _buildContain(
      Column(
        children: [

          TextInputFieldWidget(
            textInputFormatters: [
              // FilteringTextInputFormatter.allow(RegExp(r"[a-z\s_-]+")),
              MaxWordTextInputFormater(maxWords: 6, currentLength: chageCount)
            ],
            hintText:" ${widget.text1}\n${widget.text2}\n${widget.text3}",

            maxLines: 4,
            lineHeight: 1.5,
          ),


        ],

      ),
    );
  }
  Widget _buildContain(Widget child) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Column(
        children: [
          Container(

              margin: const EdgeInsets.only(left: 16, right: 16, ),
              decoration: const BoxDecoration(
                border: Border(bottom: BorderSide(width: 1,color: AppColor.borderColor)),


               ),

              child: child),
          SizedBox(height: 8,),
          _buildCompute()

        ],
      ),
    );
  }


  Widget _buildCompute() {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(Constants.replaceFarsiNumber("$_count/${widget.maxLength}"),style: const TextStyle(fontFamily: 'IranSansNumber'),),

          const SizedBox(width: 8,),
          const Text('کلمه',style: TextStyle(fontFamily: 'IranSansNumber',fontSize: 12),),

        ],
      ),
    );
  }
}

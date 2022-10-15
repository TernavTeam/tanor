import 'package:flutter/material.dart';
class CustomModalBottomSheet extends StatelessWidget {
  const CustomModalBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListView.builder(itemBuilder: (context, index) {
          return Row(
            children: [
              Text('اجاره'),
              SizedBox(width: 45,),
              Text('اجاره'),
            ],
          );
        },)
      ],
    );
  }
}

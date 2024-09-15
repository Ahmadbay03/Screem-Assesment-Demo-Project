import 'package:flutter/material.dart';
import '../consts.dart';

class TopBar extends StatelessWidget {
  TopBar({super.key, required this.title, required this.backButton});
  String title;
  bool backButton;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 15,),
        backButton ? IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          padding: EdgeInsets.zero,
          icon:  Icon(
            Icons.arrow_back_ios,
            size: 35,
            color: Colors.blue[800],
          ),
        ):
        Image.asset('assets/images/logo.png', width: width !* 0.15,),
        Spacer(),
        Text(title ,
          style: TextStyle(
              color: Colors.blue[800],
              fontWeight: FontWeight.bold,
              fontSize: 30
          ) ,
        ),
        SizedBox(width: 20,)
      ],
    );
  }
}

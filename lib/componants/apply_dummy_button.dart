import 'package:flutter/material.dart';

class ApplyButton extends StatelessWidget {
  const ApplyButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 50,
        decoration:BoxDecoration(
          color: Colors.blue[700],),
        child: Center(
          child: Text('Apply Now', style: TextStyle(fontWeight: FontWeight.bold),),
        ),
      ),
    );
  }
}

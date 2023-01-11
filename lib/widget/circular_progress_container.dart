import 'package:flutter/material.dart';
import '../constants/module.dart';
import '../model/module.dart';
import 'package:provider/provider.dart';

class CircularProgressContainer extends StatelessWidget{

  CircularProgressContainer({Key? key,required this.message}):super(key: key);
  final String message;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(AppConstants.dialogBorderRadius),
      child: Container(
        width: 295,
        height: 120,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(
                AppConstants.dialogBorderRadius)),

        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0,horizontal: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(message,style: TextStyle(color: Colors.black54,fontSize: 14,fontWeight: FontWeight.w400,),),
              CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(AppConstants.textColor),
              )
            ],
          ),
        ),
      ),
    );
  }
}
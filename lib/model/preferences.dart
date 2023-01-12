import 'module.dart';
import 'package:flutter/foundation.dart';

class Preferences with ChangeNotifier{
  int info=1;
  int design=1;
  int response=1;
  int dictionary=1;
  User? user;

  Preferences({required this.info,required this.design,required this.response,required this.dictionary,
  required this.user});

}
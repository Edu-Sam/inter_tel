import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:inter_tel/widget/circular_progress_container.dart';
import '../constants/module.dart';
import '../model/module.dart';
import 'module.dart';
import 'package:provider/provider.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class Info extends StatefulWidget{
  Info({Key? key}): super(key: key);

  InfoState createState()=> InfoState();
}

class InfoState extends State<Info>{

  TextEditingController name_controller=TextEditingController();
  TextEditingController email_controller=TextEditingController();
  TextEditingController phone_no_controller=TextEditingController();
  GlobalKey<FormState> form_key=GlobalKey<FormState>();
  bool isLoading=false;
  Validation validation=Validation();


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            backgroundColor: AppConstants.textColor,
            iconTheme: IconThemeData(color: Colors.white),
            title: Text('Info',style: TextStyle(color: Colors.white,),),
          ),
          body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: Colors.white,
            child: SingleChildScrollView(
                child: Form(
                  key: form_key,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 20.0),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 0.0),
                          child: Text('Create your profile by filling the form below',
                            style: TextStyle(color: Colors.grey,fontSize: 12,fontWeight: FontWeight.w500),),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 20.0),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            //height: 52,
                            child: TextFormField(
                              controller: name_controller,
                              validator: (text){
                                return validation.nameValidator(text!);
                              },
                              decoration: InputDecoration(
                                hintText: 'Enter Your Name',
                                hintStyle: TextStyle(color: Colors.grey,fontSize: 15,fontWeight: FontWeight.w400),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25.0),
                                    borderSide: BorderSide.none
                                ),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25.0),
                                    borderSide: BorderSide.none
                                ),
                                disabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25.0),
                                    borderSide: BorderSide.none
                                ),
                                filled: true,
                                fillColor: Colors.grey.shade100,
                                prefixIcon: Icon(CupertinoIcons.person,color: AppConstants.textColor,),

                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 20.0),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                         //   height: 52,
                            child: TextFormField(
                              controller: email_controller,
                              validator: (text){
                                return validation.emailValidator(text);
                              },
                              decoration: InputDecoration(
                                hintText: 'Enter Your Email',
                                hintStyle: TextStyle(color: Colors.grey,fontSize: 15,fontWeight: FontWeight.w400),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25.0),
                                    borderSide: BorderSide.none
                                ),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25.0),
                                    borderSide: BorderSide.none
                                ),
                                disabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25.0),
                                    borderSide: BorderSide.none
                                ),
                                filled: true,
                                fillColor: Colors.grey.shade100,
                                prefixIcon: Icon(CupertinoIcons.mail,color: AppConstants.textColor,),

                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 20.0),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                       //     height: 70,
                            child: IntlPhoneField(
                              controller: phone_no_controller,
                              validator: (text){
                                return validation.phoneValidator(text!.completeNumber);
                              },
                              decoration: InputDecoration(
                                hintText: 'Enter Your Phone Number',
                                hintStyle: TextStyle(color: Colors.grey,fontSize: 15,fontWeight: FontWeight.w400),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25.0),
                                    borderSide: BorderSide.none
                                ),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25.0),
                                    borderSide: BorderSide.none
                                ),
                                disabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25.0),
                                    borderSide: BorderSide.none
                                ),
                                filled: true,
                                fillColor: Colors.grey.shade100,
                                prefixIcon: Icon(CupertinoIcons.phone,color: AppConstants.textColor,),

                              ),
                            ),
                          ),
                        ),

                        Padding(
                          padding: EdgeInsets.only(top: 40.0),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: 56,
                            child: ElevatedButton(
                              child: Text('Submit',style: TextStyle(color: Colors.white,fontSize: 14,
                                fontWeight: FontWeight.w400,),),
                              onPressed: () async{
                                if(form_key.currentState!.validate()){
                                  setState(() {
                                    isLoading=true;
                                  });
                                  await createProfile().then((value){
                                    setState(() {
                                      isLoading=false;
                                    });
                                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=> Design(null))).then((value){
                                      setState(() {

                                      });
                                    });
                                  });
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                  primary: AppConstants.textColor,
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0))
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
            ),
          ),
        ),
        isLoading ?
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Colors.black.withOpacity(0.4),
          child: Center(
            child: CircularProgressContainer(
              message: 'Creating user.please wait...',
            )
          ),
        )   :
        SizedBox()
      ],
    );
  }

  Future<void> createProfile() async{
    return Future.delayed(Duration(seconds: 2), (){

      User user=User(name: name_controller.text,email: email_controller.text,phone_number: phone_no_controller.text);
      Provider.of<Preferences>(context,listen: false).user=user;

    });
  }

  final snackBar = SnackBar(content: Text('User created successfully',style: TextStyle(
      color: Colors.green
  ),));
}
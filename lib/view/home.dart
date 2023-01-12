import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../constants/module.dart';
import '../model/module.dart';
import 'module.dart';
import 'package:provider/provider.dart';


class Home extends StatefulWidget{
  Home({Key? key}): super(key: key);

  @override
  HomeState createState()=> HomeState();
}

class HomeState extends State<Home>{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppConstants.textColor,
        iconTheme: IconThemeData(color: Colors.white),
        title: Text('Home',style: TextStyle(color: Colors.white,),),
      ),
      drawer: Theme(

        data:Theme.of(context).copyWith(
            canvasColor: Colors.white,
         // cardColor: AppConstants.textColor
          //  canvasColor: Color.fromRGBO(66, 7, 91, 0.4)
        ),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.75,
          height: MediaQuery.of(context).size.height,
          color: Colors.white,
          child: Drawer(
            elevation: 10,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 30, horizontal: 0.0),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.75,
                height: MediaQuery.of(context).size.height,
                color: Colors.white,
                child: drawerDetails(),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget drawerDetails(){
    return Column(
      children: [
        Padding(
            padding: EdgeInsets.symmetric(vertical: 20.0,horizontal: 20.0),
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppConstants.textColor,
                  border: Border.all(color: AppConstants.textColor)
             //     color: HexColor.fromHex("#010634"),
              //    border: Border.all(color: HexColor.fromHex("#010634"))
              ),
              child: Center(
                child: Icon(CupertinoIcons.person,color: Colors.white,
                  size: 80,),
              ),
            )
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 20.0),
          child: Text('Intertel Technologies',
            style: TextStyle(color: AppConstants.textColor,fontWeight: FontWeight.w800,
              fontSize: 20,),),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 0.0,horizontal: 20.0),
          child: Text('Software developer',
            style: TextStyle(color: AppConstants.textColor,fontSize: 14,fontWeight: FontWeight.w600),),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 0.0,horizontal: 20.0),
          child: Text('edungugi20@gmail.com',
            style: TextStyle(color: AppConstants.textColor,fontSize: 14,fontWeight: FontWeight.w500),),
        ),
        SizedBox(height: 30.0,),
        Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0,horizontal: 20.0),
            child: GestureDetector(
              onTap: (){
                Provider.of<Preferences>(context,listen: false).info=0;
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context)=> Info())).then((value){
                  setState(() {

                  });
                });
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(CupertinoIcons.mail_solid,color: AppConstants.textColor,size: 25,),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5.0),
                        child: Text('Info',style: TextStyle(color: AppConstants.textColor),),
                      ),

                    ],
                  ),

                  Provider.of<Preferences>(context,listen: false).info > 0 ?
                  Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                        color: AppConstants.textColor,
                        shape: BoxShape.circle
                    ),
                    child: Center(
                      child: Text('1',style: TextStyle(color: Colors.white,
                          fontSize: 12,fontWeight: FontWeight.w500),),
                    ),
                  ) :Container()
                ],
              ),
            )
        ),


        Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0,horizontal: 20.0),
            child: GestureDetector(
              onTap: (){
                Provider.of<Preferences>(context,listen: false).design=0;
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context)=> Design(null))).then((value){
                  setState(() {

                  });
                });
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(CupertinoIcons.arrow_swap,color: AppConstants.textColor,size: 25,),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5.0),
                        child: Text('Design',style: TextStyle(color: AppConstants.textColor),),
                      ),

                    ],
                  ),

                  Provider.of<Preferences>(context,listen: false).design > 0 ?
                  Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                        color: AppConstants.textColor,
                        shape: BoxShape.circle
                    ),
                    child: Center(
                      child: Text('1',style: TextStyle(color: Colors.white,
                          fontSize: 12,fontWeight: FontWeight.w500),),
                    ),
                  ):Container()
                ],
              ),
            )
        ),
        Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0,horizontal: 20.0),
            child: GestureDetector(
              onTap: (){
                Provider.of<Preferences>(context,listen: false).response=0;
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context)=> Response())).then((value){
                  setState(() {

                  });
                });
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(CupertinoIcons.arrow_right_arrow_left,color: AppConstants.textColor,size: 25,),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5.0),
                        child: Text('Response',style: TextStyle(color: AppConstants.textColor),),
                      ),

                    ],
                  ),

                  Provider.of<Preferences>(context,listen: false).response > 0 ?
                  Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                        color: AppConstants.textColor,
                        shape: BoxShape.circle
                    ),
                    child: Center(
                      child: Text('1',style: TextStyle(color: Colors.white,
                          fontSize: 12,fontWeight: FontWeight.w500),),
                    ),
                  ):Container()
                ],
              ),
            )
        ),
        Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0,horizontal: 20.0),
            child: GestureDetector(
              onTap: (){
                Provider.of<Preferences>(context,listen: false).dictionary=0;
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context)=> DictionaryScreen())).then((value){
                  setState(() {

                  });
                });
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(CupertinoIcons.arrow_down_doc,color: AppConstants.textColor,size: 25,),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5.0),
                        child: Text('Dictionary',style: TextStyle(color: AppConstants.textColor),),
                      ),

                    ],
                  ),

                  Provider.of<Preferences>(context,listen: false).dictionary > 0 ?
                  Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                        color: AppConstants.textColor,
                        shape: BoxShape.circle
                    ),
                    child: Center(
                      child: Text('1',style: TextStyle(color: Colors.white,
                          fontSize: 12,fontWeight: FontWeight.w500),),
                    ),
                  ):Container()
                ],
              ),
            )
        ),
      ],
    );
  }
}
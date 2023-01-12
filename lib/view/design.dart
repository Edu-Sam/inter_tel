import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../constants/module.dart';
import '../model/module.dart';
import 'package:provider/provider.dart';

class Design extends StatefulWidget{
  Design(Key? key): super(key: key);

  @override
  DesignState createState()=> DesignState();
}

class DesignState extends State<Design>{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppConstants.textColor,
        iconTheme: IconThemeData(color: Colors.white),
        title: Text('Design',style: TextStyle(color: Colors.white,),),
      ),

      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.white,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
           Column(
             children: <Widget>[
               Container(
                 height: 200,

                 decoration: BoxDecoration(
                     color: Colors.grey.shade100,
                   image: DecorationImage(
                     image: AssetImage("assets/images/sky_ocean.jpg",),
                     fit: BoxFit.cover
                   )
                 ),
               ),
               Expanded(
               child: Container(
                 width: MediaQuery.of(context).size.width,

                 decoration: BoxDecoration(
                   color: Colors.white,
                   borderRadius: BorderRadius.only(topLeft: Radius.circular(20.0),topRight: Radius.circular(20.0)),
                   boxShadow: [
                     BoxShadow(
                       offset: const Offset(1.0,1.0),
                       spreadRadius: 1.0,
                       blurRadius: 1.0,
                       color: Colors.black12
                     )
                   ]
                 ),
                 child: Padding(
                   padding: EdgeInsets.only(top: 50.0),
                   child: Column(
                     children: [
                       Padding(
                         padding: EdgeInsets.only(top: 10.0),
                         child: Text(Provider.of<Preferences>(context,listen: false).user!.name,
                         style: TextStyle(color: Colors.black87,fontSize: 24,
                         fontWeight: FontWeight.w600),),
                       ),
                       Padding(
                         padding: EdgeInsets.only(top: 10.0),
                         child: Text(Provider.of<Preferences>(context,listen: false).user!.email,
                           style: TextStyle(color: Colors.black54,fontSize: 16,
                               fontWeight: FontWeight.w500),),
                       ),

                       Padding(
                         padding: EdgeInsets.only(top: 10.0),
                         child: Text(Provider.of<Preferences>(context,listen: false).user!.phone_number,
                           style: TextStyle(color: Colors.black54,fontSize: 14,
                               fontWeight: FontWeight.w500),),
                       ),

                     ],
                   ),
                 )
               ),
               )
             ],
           ),
           Positioned(
             top: 150.0,
             child: Container(
               height: 100,
               width: 100,
               decoration: BoxDecoration(
                 shape: BoxShape.circle,
                 color: AppConstants.textColor,
               ),
               child: Center(
                 child: Icon(CupertinoIcons.person,size: 24,color: Colors.white,),
               ),
             ),
           )
          ],
        )
      ),
    );
  }
}
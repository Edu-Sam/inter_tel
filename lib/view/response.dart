import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../constants/module.dart';
import '../model/module.dart';
import '../services/module.dart';

class Response extends StatefulWidget{
  Response({Key? key}): super(key: key);

  @override
  ResponseState createState()=> ResponseState();
}

class ResponseState extends State<Response>{

  late Future<dynamic> future_todos;

  Api api=Api();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    future_todos=getTodos(5);
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar:AppBar(
        backgroundColor: AppConstants.textColor,
        iconTheme: IconThemeData(color: Colors.white),
        title: Text('Response',style: TextStyle(color: Colors.white,),),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.grey.shade100,
        child: FutureBuilder<dynamic>(
          future: future_todos,
          builder: (context,snapshot){
            if(snapshot.connectionState==ConnectionState.done && snapshot.hasData){

             if(snapshot.data is List){
               List<Todo> todos=snapshot.data;
               return SingleChildScrollView(
                   child: Padding(
                     padding: EdgeInsets.symmetric(vertical: 20.0,horizontal: 20.0),
                     child: Column(
                       children: todos.asMap().map((index, element){
                         return MapEntry(
                           index,Padding(
                           padding: EdgeInsets.only(
                             bottom: 20.0
                           ),
                           child: Container(
                             width: MediaQuery.of(context).size.width,
                             decoration: BoxDecoration(
                               color: Colors.white,
                               borderRadius: BorderRadius.circular(12.0),
                               boxShadow: [
                                 BoxShadow(
                                   offset: const Offset(1.0,1.0),
                                   spreadRadius: 1.0,
                                   blurRadius: 1.0,
                                   color: Colors.black12
                                 )
                               ]
                             ),
                             //height: MediaQuery.of(context).size.height * 0.09,

                             child: Padding(
                               padding: EdgeInsets.only(left: 10.0,top: 20.0,bottom: 20.0),
                               child: Column(
                                 mainAxisAlignment: MainAxisAlignment.start,
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                 children: [
                                   Padding(
                                     padding: EdgeInsets.only(left: 0.0),
                                     child: Text(element.title,style: TextStyle(
                                       color: Colors.black54,fontSize: 16,
                                       fontWeight: FontWeight.w500
                                     ),),
                                   ),
                                 Padding(
                                   padding: EdgeInsets.only(top: 10.0),
                                   child: Row(
                                     children: [
                                       element.completed ?
                                        Container(
                                          width: 120,
                                          height: 30,
                                          decoration: BoxDecoration(
                                            color: Colors.green.shade100.withOpacity(0.3),
                                            borderRadius: BorderRadius.circular(20.0)
                                          ),
                                          child: Center(
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(vertical: 0.0,horizontal: 5.0),
                                              child: Row(
                                                children: [
                                                  Icon(Icons.check,color: Colors.green.shade800,),
                                                  Text('Completed',style: TextStyle(
                                                      color: Colors.green.shade800,
                                                      fontSize: 11,fontWeight: FontWeight.w600
                                                  ),)
                                                ],
                                              ),
                                            )
                                          ),
                                        ) :
                                       Container(
                                         width: 120,
                                         height: 30,
                                         decoration: BoxDecoration(
                                             color: Colors.redAccent.shade100.withOpacity(0.3),
                                             borderRadius: BorderRadius.circular(20.0)
                                         ),
                                         child: Center(
                                           child: Padding(
                                             padding: EdgeInsets.symmetric(vertical: 0.0,horizontal: 5.0),
                                             child: Row(
                                               children: [
                                                 Icon(Icons.error_outline,color: Colors.red.shade800,),
                                                 Text('Not Completed',style: TextStyle(
                                                     color: Colors.red.shade800,
                                                     fontSize: 11,fontWeight: FontWeight.w600
                                                 ),)
                                               ],
                                             ),
                                           )
                                         ),
                                       )
                                      /* element.completed ?
                                       Padding(
                                         padding: EdgeInsets.only(top: 0.0),
                                         child: Icon(
                                           CupertinoIcons.check_mark_circled,
                                           color: Colors.green.shade800,
                                           size: 21,
                                         ),
                                       ):
                                       Padding(
                                         padding: EdgeInsets.only(top: 0.0),
                                         child: Icon(
                                           Icons.error_outline,
                                           color: Colors.red,
                                           size: 21,
                                         ),
                                       ),
                                       Padding(
                                         padding: EdgeInsets.only(top: 0.0),
                                         child: Text(element.completed ? 'Completed' :' Not Completed',
                                           style: TextStyle(color: element.completed ?
                                           Colors.green.shade800 : Colors.red,
                                               fontSize: 14,
                                               fontWeight: FontWeight.w500),),
                                       ),*/
                                     ],
                                   ),
                                 )
                                 ],
                               ),
                             ),
                           ),
                         )
                         );
                       }).values.toList(),
                     ),
                   )
               );
             }

             else{
               return Center(
                 child: Text('No data available',style: TextStyle(
                   color: Colors.black54,fontSize: 14,
                   fontWeight: FontWeight.w600
                 ),),
               );
             }
            }

            else if(snapshot.connectionState==ConnectionState.waiting){
              return Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(AppConstants.textColor),
                ),
              );
            }

            else if(snapshot.hasError){
              return Center(
                child: Text('Error loading data.Please try again',style: TextStyle(
                  color: Colors.black54,fontSize: 14,fontWeight: FontWeight.w400,
                ),),
              );
            }

            else{
              return SizedBox();
            }
          },
        ),
      ),
    );
  }

  Future<dynamic> getTodos(int limit) async{
    var result=await api.getTodos(limit);
    if(result is List<Todo>){
      List<Todo> todos=result;
      return todos;
    }

    else{
      return [];
    }

  }
}
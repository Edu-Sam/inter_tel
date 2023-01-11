import 'package:flutter/material.dart';
import '../constants/module.dart';

class DictionaryScreen extends StatefulWidget{
  DictionaryScreen({Key? key}): super(key: key);

  @override
  DictionaryScreenState createState()=> DictionaryScreenState();
}

class DictionaryScreenState extends State<DictionaryScreen>{

  bool dictionary_key_status=false;
  bool dictionary_value_status=false;


  Map<String,String> dictionary_list={'34': 'thirty-four', '90': 'ninety',
  '91': 'ninety-one','21': 'twenty-one',
  '61': 'sixty-one', '9': 'nine',
  '2': 'two', '6': 'six', '3': 'three',
  '8': 'eight', '80': 'eighty', '81': 'eighty-one',
  'Ninety-Nine': '99', 'nine-hundred': '900'};

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //dictionary_list=dictionary_map as List;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppConstants.textColor,
        iconTheme: IconThemeData(color: Colors.white),
        title: Text('Dictionary',style: TextStyle(color: Colors.white,),),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.grey.shade100,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 20.0),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 20.0,bottom: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: (){
                          setState(() {
                            dictionary_key_status=!dictionary_key_status;
                          });
                          sortByKey();
                        },
                        child: Container(
                          width: 70,
                          height: 30,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              border: Border.all(color: Colors.grey)
                          ),
                          child: Center(
                            child:  Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Key',style: TextStyle(color: Colors.black54,fontSize: 12,
                                    fontWeight: FontWeight.w500),),
                                dictionary_key_status ? Icon(Icons.keyboard_arrow_up,
                                  size: 18,color: Colors.black54,):
                                Icon(Icons.keyboard_arrow_down,
                                  size: 18,color: Colors.black54,)
                              ],
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          setState(() {
                            dictionary_value_status=!dictionary_value_status;
                          });
                          sortByValue();
                        },
                        child: Container(
                          width: 70,
                          height: 30,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              border: Border.all(color: Colors.grey)
                          ),
                          child: Center(
                            child:  Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Value',style: TextStyle(color: Colors.black54,fontSize: 12,
                                    fontWeight: FontWeight.w500),),
                                dictionary_value_status ? Icon(Icons.keyboard_arrow_up,
                                  size: 18,color: Colors.black54,):
                                Icon(Icons.keyboard_arrow_down,
                                  size: 18,color: Colors.black54,)
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                    children: dictionary_list.map((index, element){
                      return MapEntry(index, Padding(
                        padding: EdgeInsets.symmetric(vertical: 20.0,horizontal: 0.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.08,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(14.0),
                              boxShadow: [
                                BoxShadow(
                                    offset: const Offset(1.0,1.0),
                                    blurRadius: 1.0,
                                    spreadRadius: 1.0,
                                    color: Colors.black12
                                )
                              ]
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 20.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(element.toString(),style: TextStyle(
                                        color: Colors.black54,fontSize: 15,
                                        fontWeight: FontWeight.w500
                                    ),),
                                    Container(
                                      width: 30,
                                      height: 30,
                                      decoration: BoxDecoration(
                                        color: Colors.green.shade800,
                                        shape: BoxShape.circle,
                                      ),
                                      child: Center(
                                        child: Text(index.toString(),style: TextStyle(
                                            color: Colors.white,fontSize: 12,fontWeight: FontWeight.w500
                                        ),),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          )
                        ),
                      ));
                    }).values.toList()
                ),
              ],
            ),
          )
        ),
      ),
    );
  }

  sortByKey(){
    if(dictionary_key_status){
      setState(() {
       dictionary_list=Map.fromEntries(dictionary_list.entries.toList()..sort((e1,e2)=>e1.key.compareTo(e2.key)));

      });
    }

    else{
      setState(() {
        dictionary_list=Map.fromEntries(dictionary_list.entries.toList()..sort((e1,e2)=>e2.key.compareTo(e1.key)));
      });
    }
  }

  sortByValue(){
    if(dictionary_value_status){
      setState(() {
        dictionary_list=Map.fromEntries(dictionary_list.entries.toList()..sort((e1,e2)=>e1.value.compareTo(e2.value)));

      });
    }

    else{
      setState(() {
        //dictionary_list=Map.fromEntries(dictionary_list.entries.toList()..sort((e1,e2)=>e1.value.compareTo(e2.value)));

        dictionary_list=Map.fromEntries(dictionary_list.entries.toList()..sort((e1,e2)=>e2.value.compareTo(e1.value)));
      });
    }
  }

}
import 'dart:convert';

import 'package:flutter/material.dart';
import '../model/module.dart';
import 'package:http/http.dart' as http;
import 'dart:io';

class Api{


  static const String DOMAIN=DomainServer.domain;
  static const String PATH=DomainServer.domain_path;

  Future<dynamic> getTodos(int limit) async{

    print("The domain is " + DOMAIN.toString());
    print("The path is " + PATH.toString());
    print("The limit is " + limit.toString());

    try{
      var url = Uri.https(DOMAIN,PATH,{"_limit":limit.toString()});

      http.Response response = await http.get(url,headers: {"Accept":"application/json"});
      /*http.Response response=await http.get(Uri.parse('https://jsonplaceholder.typicode.com/todos'),
          headers: {"Accept":"application/json"}
      );*/

      print("response is " + response.body.toString());

      if(response.statusCode==200){
        var result=jsonDecode(response.body);
        var todo_temp=result as List;
        List<Todo> todos=todo_temp.map((e) => Todo.fromJson(e)).toList();
        return todos;
      }

      else{
        return [];
      }


    }
    catch(Exception,stacktrace){
     print("Error: " + stacktrace.toString());
     return [];
    }

  }
}
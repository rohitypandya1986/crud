import 'package:crud/productview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'delete.dart';
import 'details.dart';
import 'edit.dart';

class Model extends StatelessWidget
{
  late List list;

  Model({required this.list});

  @override
  Widget build(BuildContext context)
  {
    return ListView.builder
      (
      itemBuilder: (context,index)
      {
        return ListTile
          (
          //title:Text(list[index]["product_name"]),
          title:Text(list[index]["srno"]),
          subtitle: Column
            (
            children:
            [
              // Text(list[index]["product_price"]),
              // Text(list[index]["product_description"])
              Text(list[index]["location"]),
              Text(list[index]["logged_in"])
            ],
          ),
          trailing: Wrap
            (
            children:
            [

              IconButton(onPressed: ()
              {

                Navigator.push(context,MaterialPageRoute(builder: (context) => Details(list:list,index:index)));

              }, icon: Icon(Icons.edit)),
              IconButton(onPressed: ()
              {

                Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => DeleteProduct(id: list[index]["id"])));
              }, icon: Icon(Icons.delete)),

            ],
          ),

        );


      },itemCount:list.length,);
  }

}
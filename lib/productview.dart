import 'dart:convert';

import 'package:crud/model.dart';
import 'package:flutter/material.dart';
import 'addproduct.dart';
import 'package:http/http.dart' as http;

class ProductViewScreeen extends StatefulWidget
{
  const ProductViewScreeen({super.key});

  @override
  State<ProductViewScreeen> createState() => _ProductViewScreeenState();
}

class _ProductViewScreeenState extends State<ProductViewScreeen>
{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold
      (
      appBar: AppBar(title: Text("Products"),),
      body: FutureBuilder
        (
        future: getdata(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot)
        {
          if(snapshot.hasData)
          {
            return Model(list:snapshot.data);
          }
          if(snapshot.hasError)
          {

            print("Network Error");
            print(snapshot.error);
            print("Network Error");
          }

          return CircularProgressIndicator();


        },),
      floatingActionButton: FloatingActionButton(
        onPressed: ()
        {
          Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => AddProduct()));
        },
        child: Icon(Icons.add),),
    );
  }

  getdata()async
  {

    //var url = Uri.parse("https://prakrutitech.buzz/Fluttertestapi/productview.php");
    //var url = Uri.parse("https://www.umiyaji.com/newrohit.php");
    var url = Uri.parse("https://www.pgvcl.com/rohit.php");
    var response = await http.get(url);
    print(response.body);
    return jsonDecode(response.body);
  }

}
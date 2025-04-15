import 'package:crud/productview.dart';
import 'package:flutter/material.dart';
import 'dart:io'; // for ssl certificate

class MyHttpOverrides extends

// for ssl certificate
HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}

void main()
{
  HttpOverrides.global = MyHttpOverrides();  // for ssl certificate
  runApp(MaterialApp(home:ProductViewScreeen()));
}


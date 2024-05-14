
import 'package:flutter/material.dart';

Elemt( String text,Function f,{Color c=Colors.black}){
  return InkWell(
    child:Text(text,style: TextStyle(color: c) ),
    onTap: (){
      f();
    },
  );
}
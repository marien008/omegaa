import 'package:flutter/material.dart';



class SwitchCostum{

  bool value;
  Function f;


  SwitchCostum({required this.value,required this.f});

  lancer(){
    return
    Container(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text((!this.value)?"Piece":"Paquet",
              style:TextStyle(
                  fontFamily: "roboto_medium"
              ),
              ),
          Switch(
              activeColor: Color.fromRGBO(50, 190, 166, 1),
              inactiveTrackColor: Colors.black,
              inactiveThumbColor: Colors.black,
              value: value,
              onChanged: ((bool) {
                f(bool);
              }))

        ],


      )
    );

     ;
  }





}
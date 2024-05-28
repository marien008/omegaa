

import 'package:flutter/material.dart';

class BlockNotification{

  String text;
  Function f;

  BlockNotification({required this.text,required this.f});

  lancer(){

    return InkWell(
      child:Container(

        height: 70,
        child: Card(
          child:Center(
              child: Text.rich(
                TextSpan(
                  children: [TextSpan(text: "le produit : "+text+" expire dans un mois "

                  ),
                    TextSpan(text: "Aller voir ",
                    style: TextStyle(
                      color: Colors.blue,
                      decoration: TextDecoration.underline
                    )
                    )
                  ])
                ))
              )
          ) ,
        onTap: (){
        this.f();

        },
    );

  }

}
import 'package:flutter/material.dart';


class ElementBlock1 {
  String  photo;
  String text;
 Function fonction;
 var context;
  ElementBlock1(this.photo,this.text,this.fonction,this.context);

  Widget afficheElement(){
    return InkWell(
      child: Container(
        child:
        Column(
          children: [
            Center(
              child:
              CircleAvatar(
                child:Image.asset(this.photo,color: Color.fromRGBO(50, 190, 166, 1),) ,
                radius:35,
                backgroundColor: Colors.white,
             
              ),
            ), Center(child:Text(this.text, style: TextStyle(
              fontFamily:"roboto_medium" ,
                color:Color.fromRGBO(50, 190, 166, 1),
        fontSize: 16
    ),
  ) ,
)
          ],
        ) ,
      )
    ,onTap: (){
     fonction();
    },)  ;
  }
}
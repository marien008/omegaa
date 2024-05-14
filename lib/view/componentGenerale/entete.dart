import 'package:flutter/material.dart';


class Entete {
late var context;
late var title;
late Function ?pageCible;
late var text;
 var  notification=true;
late var flecheR;

late Function ?actionLogo;

  Entete({this.flecheR,this.context,this.title,required this.pageCible,this.text,this.notification=true,this.actionLogo}){
      if(this.flecheR==false){
        this.flecheR=null;
      }else{
        this.flecheR= IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              this.pageCible!();
      });
    }
  }

  Demarrer(){
    return AppBar(
      leading: this.flecheR,
      title:Text(title) ,

      backgroundColor: Color.fromRGBO(50, 190, 166, 1),
      actions: [
        Row(
          children: [
            Container(
              child: Text(this.text),
            ),
            (this.notification)?
                InkWell(
                  child:Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Icon(Icons.notifications,size: 30,)
                  ) ,
                  onTap: (){
                    this.actionLogo!();
                  },
                )
            :Center()
          ],
        )
      ],
    );




  }



}
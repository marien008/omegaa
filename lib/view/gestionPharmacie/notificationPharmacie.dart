import 'package:flutter/material.dart';

import '../../controlers/espacePharmacie/admin/controler_medicament.dart';
import '../../elper/Stringifier.dart';
import '../../elper/navigation.dart';
import '../componentGenerale/blockNotification.dart';
import '../componentGenerale/entete.dart';
import '../leyouts/base.dart';
import 'adminPharmacie/AcceuilAdmin.dart';


class Notification extends StatefulWidget {
  @override

  var notification;
  Notification(this.notification);


  State<Notification> createState() => NotificationState(this.notification);
}

class NotificationState extends State<Notification> {

var notification;
NotificationState(var notification){
  this.notification=Stringifier(notification);

}

  @override
  Widget build(BuildContext context) {
    Color ColorButton = Color.fromRGBO(50, 190, 166, 1);
    double hauteur = MediaQuery
        .of(context)
        .size
        .height;

    return Scaffold(
      appBar: Entete(
        flecheR: true,
        context: context,
        title: "Notification",
        pageCible: () {
          navigation(context,pageAccueille());
        },
        text: "",
        notification: false
      )
          .Demarrer(),
      body:Base(
        child: [],
        content:ListView.builder(
            itemCount: notification.length,
            itemBuilder: (context,id){

              return ListTile(
                title: BlockNotification(text:
                  notification[id],f:(){
                  Controler_medicament(context).voirStock();
                }
                ).lancer() ,
              );

            })
        ,

      ).lancer(hauteur-300, MediaQuery.of(context).size.width-30),


    );
  }}

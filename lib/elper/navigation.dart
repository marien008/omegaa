
import 'package:flutter/material.dart';
navigation(context,pageCible){
  Navigator.pop(context);
  Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext cnt)
  {
    return pageCible;
  }

  ),(Route<dynamic> route)=>false

  );
}
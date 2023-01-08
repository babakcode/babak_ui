import 'package:babak_ui/src/constant/constants.dart';
import 'package:flutter/material.dart';

class ChangeableController extends ChangeNotifier {
  detection(Map json, [String? name]) {
    if (name == null) {
      name = json.keys.elementAt(0);
      json = json[name];
    }
    switch (name) {
      case "Scaffold":
        return Scaffold(
          body: detection(json['Scaffold.body'], 'Scaffold.body'),
          backgroundColor:
              BabakUIConstant.detectColor(json['Scaffold.backgroundColor']),
          // appBar: babak(map, map[name]['Scaffold.appBar']),
        );
      case "Container":
        return Container(
          child:
              detection(json['Container.child'], 'Container.child'),
          color: BabakUIConstant.detectColor(json['Container.color']),
        );
      case "Center":
        return Center(
          child: detection(json['Center.child'], 'Center.child'),
        );
      case "Text":
        return Text(
          json['Text.text'],
        );
      case "Scaffold.body":
      case "Container.child":
      case "Center.child":
        return detection(json['map'], json['widget']);
    }
    return null;
  }
}

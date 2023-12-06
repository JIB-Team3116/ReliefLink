import 'dart:core';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:relieflink/utils/constants.dart';
import '../../utils/crisis_data_utils.dart';
import '../../utils/data_storage.dart';
import 'package:relieflink/components/CrisisPlan/warningSignsCrisisCard.dart';
import 'package:relieflink/components/CrisisPlan/reliefTechniqueCrisisCard.dart';
import 'package:relieflink/components/CrisisPlan/reasonToLive.dart';
import '../../utils/tutorial.dart';
import '../utils/emergency_contact_utils.dart';
List<TargetFocus> crisisPlanTutorial(
    {
        required GlobalKey reasonKey,
        required GlobalKey warningKey,
    }) {
        List<TargetFocus> targets = [];

        targets.add(TargetFocus(
            keyTarget: reasonKey,
            alignSkip: Alignment.topRight,
            radius: 10,
            shape: ShapeLightFocus.RRect,
            contents: [
                TargetContent(
                    align: ContentAlign.bottom,
                    builder: (context, controller) {
                        return Container(
                            alignment: Alignment.center,
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const <Widget>[
                                    Text(
                                        "This is where you can enter your reason to live",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(fontSize: 20, color: Colors.white),
                                    )
                                ]
                            )
                        );
                    },
                )
            ]));
        targets.add(TargetFocus(
            keyTarget: warningKey,
            alignSkip: Alignment.topRight,
            radius: 10,
            shape: ShapeLightFocus.RRect,
            contents: [
                TargetContent(
                    align: ContentAlign.top,
                    builder: (context, controller) {
                        return Container(
                            alignment: Alignment.center,
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const <Widget>[
                                    Text(
                                        "This is where you can add warning signs",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(fontSize: 20, color: Colors.white),
                                    )
                                ]
                            )
                        );
                    },
                )
            ]));
        
    return targets;

}
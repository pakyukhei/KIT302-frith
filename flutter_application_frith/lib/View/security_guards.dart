import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/src/material/bottom_navigation_bar.dart';
import 'package:flutter_application_frith/Model/securityGuard.dart';
import 'package:flutter_application_frith/View/security_login.dart';
import 'package:flutter_application_frith/punchClock/punchClock_homepage.dart';
import 'package:url_launcher/url_launcher.dart';
import '../emergency/emergencyphone.dart';
import '../notepad/notepad_homepage.dart';
import 'package:torch_light/torch_light.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import '../report/new_report.dart';
import '../report/Report_Draft_Page.dart';
import 'package:flutter_application_frith/Request_Backup/Backup_homepage.dart';

class SecurityGuards extends StatefulWidget {
  const SecurityGuards({Key? key}) : super(key: key);

  ///const SecurityGuards({key, required this.guard});

  //final SecurityGuard guard;

  @override
  State<SecurityGuards> createState() => _SecurityGuardsState();
}

class _SecurityGuardsState extends State<SecurityGuards> {
  bool light = false;
  var sessionManager = SessionManager();

  Future<bool> _checkIfLightExists() async {
    try {
      final isTorchAvailable = await TorchLight.isTorchAvailable();
      return Future.value(isTorchAvailable);
    } on Exception catch (_) {
      return Future.value(false);
    }
  }

  Future<void> _turnOnLight() async {
    try {
      await TorchLight.enableTorch();
    } on Exception catch (_) {
      print("unable to turn on light");
    }
  }

  Future<void> _turnOffLight() async {
    try {
      await TorchLight.disableTorch();
    } on Exception catch (_) {
      print("unable to turn off light");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Security Guards"),
          actions: [_popupMenuButton(context)],
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //flashlight function
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          light = !light;

                          if (light) {
                            _turnOnLight();
                          } else {
                            _turnOffLight();
                          }
                        });
                      },
                      child: Container(
                        color: Colors.blueAccent,
                        width: 140,
                        height: 90,
                        child: light
                            ? Icon(
                                Icons.lightbulb,
                                color: Colors.yellow,
                                size: 80,
                              )
                            : Icon(
                                Icons.lightbulb_outline,
                                color: Colors.white,
                                size: 80,
                              ),
                      )),

                  //End of Flashlight
                  //NotePad
                  GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => NotepadPage(

                                    ///title: '',
                                    )));
                      },
                      child: Container(
                          color: Colors.blueAccent,
                          width: 140,
                          height: 90,
                          child: Icon(
                            //change notepad icon
                            Icons.edit_note,
                            color: Colors.white,
                            size: 80,
                          ))),
                  //End of Notepad
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  SizedBox(width: 40),
                  Container(
                      width: 150,
                      alignment: Alignment.center,
                      child: Text('FLASH LIGHT')),
                  SizedBox(width: 30),
                  Container(
                    width: 150,
                    alignment: Alignment.center,
                    child: Text(
                      'NOTEPAD',
                    ),
                  )
                ],
              ),
              SizedBox(height: 10),
              Row(
                //Request Backup function
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const BackupPage(),
                            ));
                      },
                      child: Container(
                        // alignment: Alignment.centerLeft,
                        color: Colors.blueAccent,
                        width: 150,
                        height: 100,
                        alignment: Alignment.center,
                        child: Icon(
                          Icons.add_moderator_sharp,
                          color: Colors.white,
                          size: 80,
                        ), //"Incident Report"
                      )),
                  //end of request back up
                  //emergency call function
                  GestureDetector(
                    onTap: () {
                      launch('tel:000');
                    },
                    child: Container(
                        //alignment: Alignment.centerLeft,
                        color: Colors.blueAccent,
                        width: 140,
                        height: 90,
                        child: Icon(
                          Icons.emergency,
                          color: Colors.white,
                          size: 80,
                        )),
                  ),
                  //end emergency call function
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  SizedBox(width: 40),
                  Container(
                      width: 150,
                      alignment: Alignment.center,
                      child: Text('REQUEST MANAGER')),
                  SizedBox(width: 30),
                  Container(
                    width: 150,
                    alignment: Alignment.center,
                    child: Text(
                      'EMERGENCY CALL',
                    ),
                  )
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const NewReport(),
                            ));
                      },
                      child: Container(
                          // alignment: Alignment.centerLeft,
                          color: Colors.blueAccent,
                          width: 140,
                          height: 90,
                          child: Icon(
                            Icons.note,
                            color: Colors.white,
                            size: 80,
                          ) //"Incident Report"
                          )),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const PunchClockPage(),
                          ));
                    },
                    child: Container(
                        //alignment: Alignment.centerRight,

                        width: 140,
                        height: 90,
                        color: Colors.blueAccent,
                        child: Icon(
                          Icons.access_time_outlined, //start/end/shift
                          color: Colors.white,
                          size: 80,
                        )),
                  )
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  SizedBox(width: 40),
                  Container(
                      width: 150,
                      alignment: Alignment.center,
                      child: Text('INCIDENT REPORT')),
                  SizedBox(width: 30),
                  Container(
                    width: 150,
                    alignment: Alignment.center,
                    child: Text(
                      'SHIFT MANAGER',
                    ),
                  )
                ],
              ),
              SizedBox(height: 10),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                GestureDetector(
                  onTap: () {
                    AlertDialog alert = AlertDialog(
                      title: Text('Are you sure you want to request back up'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SecurityGuards(),
                              )),
                          child: const Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const BackupPage(),
                              )),
                          child: const Text('Yes'),
                        ),
                      ],
                    );
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return alert;
                      },
                    );
                  },
                  child: Container(
                    // alignment: Alignment.centerLeft,
                    color: Colors.red,
                    width: 200,
                    height: 90,
                    alignment: Alignment.center,
                    child: const Text("SOS",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 50,
                        ),
                        textAlign: TextAlign.center),
                  ),
                )
              ]),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      width: 150,
                      child: Text(
                        'REQUEST BACK-UP',
                        textAlign: TextAlign.center,
                      )),
                ],
              ),
            ],
          ),
        ));
  }

  PopupMenuButton _popupMenuButton(BuildContext context) {
    return PopupMenuButton(
      itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
        PopupMenuItem(
          onTap: () {
            //
            print("Logout");
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              GestureDetector(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text("Notice"),
                            content:
                                Text("Are you sure you would like to Logout?"),
                            actions: <Widget>[
                              TextButton(
                                child: Text("No"),
                                onPressed: () => Navigator.of(context).pop(),
                              ),
                              TextButton(
                                child: Text("Yes"),
                                onPressed: () {
                                  SessionManager()
                                      .destroy(); //Destroy session data
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              SecLogin())); //go back to security login page SecLogin
                                },
                              ),
                            ],
                          );
                        });
                  },
                  child: new Text('Logout')),
            ],
          ),
          //value: 'logout',
        ),
      ],
    );
  }
}

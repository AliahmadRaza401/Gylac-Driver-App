// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, must_be_immutable, prefer_const_literals_to_create_immutables

import 'package:driver_app/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DriverOnboarding extends StatelessWidget {
  DriverOnboarding({Key? key}) : super(key: key);

  var kIcons = <Widget>[
    Onboard(
      img: 'asset/yellow-audi-car-png-hd-19.png',
      text: 'Leave sooner, drive slower, live longer',
    ),
    Onboard(
      img: 'asset/car-png-large-images-40.png',
      text: 'Everything in life is somewhere else, and you get there in a car',
    ),
    Onboard(
      img: 'asset/download.jpg',
      text: 'Never drive faster than your guardian angel can fly',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: kIcons.length,
      child: Builder(
        builder: (BuildContext context) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            color: Colors.white,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
              Expanded(child: TabBarView(children: kIcons)),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * .3,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.amber,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100))),
                    onPressed: () async{
                     await setStarted();
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => LoginPage()));
                    },
                    child: const Text(
                      'SKIP',
                      style: TextStyle(fontSize: 17),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TabPageSelector(
                      color: Colors.black, selectedColor: Colors.amber),
                ],
              ),
              SizedBox(
                height: 10,
              )
            ]),
          ),
        ),
      ),
    );
  }
  setStarted()async{
    SharedPreferences prefs=await SharedPreferences.getInstance();
    prefs.setBool('Started', true);
  }
}

class Onboard extends StatelessWidget {
  String img = '';
  String text = '';
  Onboard({Key? key, required this.img, required this.text});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(
            img,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 2,
            fit: BoxFit.contain,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Wrap(
              children: [
                Text(
                  text,
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * .06),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

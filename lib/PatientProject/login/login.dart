import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:patient_app/PatientProject/login/login_provider.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  var dropdownvalue;
  var items = ["item 1", "item 2", "item 3"];
  LoginProvider loginProvider = LoginProvider();

  @override
  Widget build(BuildContext context) {
    loginProvider = context.read<LoginProvider>();
    return Scaffold(
      body: Consumer<LoginProvider>(
        builder: (BuildContext context, value, Widget? child) => Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Color(0xFFfeb3ed),
              Color(0xFF7eadf8),
              Color(0xFFfeb3ed),
              Color(0xFF7eadf8)
            ], begin: Alignment.topRight, end: Alignment.bottomLeft),
          ),
          child: Stack(
            children: [
              Column(
                children: [
                  SizedBox(
                    height: 270,
                  ),
                  Center(
                    child: Container(
                      height: 400,
                      margin: EdgeInsets.only(left: 30, right: 30),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(color: Colors.white24),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 2, sigmaY: 1),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 30,
                            ),
                            Text(
                              "SIGN IN",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 35,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 50,
                            ),
                            TextFormField(
                              controller: value.mailController,
                              onChanged: (val) {
                                value.getDropDown({
                                  "email": val,
                                });
                              },
                              decoration: InputDecoration(
                                  fillColor: Colors.white,
                                  filled: true,
                                  border: InputBorder.none,
                                  prefixIcon: Container(
                                    color: Color(0xfFac59db),
                                    child: Icon(
                                      Icons.person,
                                      color: Colors.white,
                                    ),
                                  )),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              color: Colors.white,
                              padding: EdgeInsets.only(left: 10, right: 10),
                              child: DropdownButtonFormField(
                                value: dropdownvalue,
                                icon: const Icon(Icons.keyboard_arrow_down),
                                items: items.map((String items) {
                                  return DropdownMenuItem(
                                    value: items,
                                    child: Text(items),
                                  );
                                }).toList(),
                                decoration: InputDecoration(
                                    enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide.none),
                                    border: UnderlineInputBorder(
                                        borderSide: BorderSide.none)),
                                onChanged: (newValue) {
                                  dropdownvalue = newValue!;
                                },
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              decoration: InputDecoration(
                                  fillColor: Colors.white,
                                  filled: true,
                                  border: InputBorder.none,
                                  prefixIcon: Container(
                                    color: Color(0xfFac59db),
                                    child: Icon(
                                      Icons.person,
                                      color: Colors.white,
                                    ),
                                  )),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                width: 200,
                                alignment: Alignment.center,
                                padding: EdgeInsets.only(
                                  top: 10,
                                  bottom: 10,
                                ),
                                color: Color(0xFFac59db),
                                child: Text(
                                  "SIGN IN",
                                  style: TextStyle(
                                      fontSize: 22, color: Colors.white),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Positioned(
                top: 60,
                left: 40,
                child: Image.network(
                  "https://www.freeiconspng.com/thumbs/doctor-logo/transparent-medical-doctor-background-logos-18.png",
                  height: 200,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:patient_app/PatientProject/login/login_provider.dart';
import 'package:patient_app/util/util.dart';
import 'package:provider/provider.dart';

import '../../model/dropdownModel.dart';

class LoginPage extends StatelessWidget {
  Datum? dropdownvalue;
  Debouncer debouncer = Debouncer();
  var items = ["item 1", "item 2", "item 3"];
  LoginProvider loginProvider = LoginProvider();
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    loginProvider = context.read<LoginProvider>();
    return Scaffold(
      body: Consumer<LoginProvider>(
        builder: (BuildContext context, value, Widget? child) => Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Color(0xFF6895fe),
              Color(0xFFfeb3ed),
              Color(0xFFf4b961),
              Color(0xFF7eadf8),
              Color(0xFFe2a1fc)
            ], begin: Alignment.topLeft, end: Alignment.bottomCenter),
          ),
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 70,
                  ),
                  Image.network(
                    "https://www.freeiconspng.com/thumbs/doctor-logo/transparent-medical-doctor-background-logos-18.png",
                    height: 200,
                  ),
                  const SizedBox(
                    height: 70,
                  ),
                  const Text(
                    "SIGN IN",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 35,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 25, right: 25),
                    child: TextFormField(
                      controller: value.mailController,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      onChanged: (val) {
                        if (emailValidation(val)) {
                          debouncer.run(() {
                            value.getDropDown({
                              "email": val,
                            });
                          });
                        }
                      },
                      decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          border: InputBorder.none,
                          suffix: value.mailLoad
                              ? SizedBox(
                                  height: 15,
                                  width: 15,
                                  child: CupertinoActivityIndicator(
                                    color: Colors.black,
                                  ))
                              : SizedBox(),
                          prefixIcon: Container(
                            margin: EdgeInsets.only(right: 10),
                            color: const Color(0xfFac59db),
                            child: const Icon(
                              Icons.person,
                              color: Colors.white,
                            ),
                          )),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  value.itemCount == 0
                      ? Container()
                      : Padding(
                          padding: const EdgeInsets.only(left: 25, right: 25),
                          child: Container(
                            color: Colors.white,
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: DropdownButtonFormField(
                              value: dropdownvalue,
                              icon: const Icon(Icons.keyboard_arrow_down),
                              items: value.list.map((Datum items) {
                                return DropdownMenuItem(
                                  value: items,
                                  child: Text(items.clinicName.toString()),
                                );
                              }).toList(),
                              decoration: const InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide.none),
                                border: UnderlineInputBorder(
                                    borderSide: BorderSide.none),
                              ),
                              onChanged: (newValue) {
                                dropdownvalue = newValue!;
                              },
                            ),
                          ),
                        ),
                  const SizedBox(
                    height: 20,
                  ),
                  value.itemCount == 0
                      ? Container()
                      : Padding(
                          padding: const EdgeInsets.only(left: 25, right: 25),
                          child: TextFormField(
                            controller: value.passwordController,
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            obscureText: value.hidePassword,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(top: 10),
                              fillColor: Colors.white,
                              filled: true,
                              border: InputBorder.none,
                              suffixIcon: IconButton(
                                onPressed: () {
                                  value.hidePassword
                                      ? value.hidePassword = true
                                      : value.hidePassword = false;
                                  print(value.hidePassword
                                      ? value.hidePassword = false
                                      : value.hidePassword = true);
                                  value.notifyListeners();
                                },
                                icon: Icon(
                                  value.hidePassword
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  size: 20,
                                  color: Colors.grey,
                                ),
                              ),
                              prefixIcon: Container(
                                margin: EdgeInsets.only(right: 10),
                                color: const Color(0xfFac59db),
                                child: const Icon(
                                  Icons.person,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                  const SizedBox(
                    height: 30,
                  ),
                  GestureDetector(
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        value.login({
                          'clinic_id': dropdownvalue!.clinicId.toString(),
                          'email': value.mailController.text,
                          'password': value.passwordController.text,
                        }, context);
                      }
                    },
                    child: value.load
                        ? Center(child: CupertinoActivityIndicator())
                        : Container(
                            width: 200,
                            alignment: Alignment.center,
                            padding: const EdgeInsets.only(
                              top: 10,
                              bottom: 10,
                            ),
                            color: const Color(0xFFac59db),
                            child: const Text(
                              "SIGN IN",
                              style: TextStyle(fontSize: 22, color: Colors.white),
                            ),
                          ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

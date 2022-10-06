import 'package:flutter/material.dart';
import 'package:patient_app/Screens/MyProfile/provider/profileProvider.dart';
import 'package:patient_app/Screens/MyProfile/widget/checkdata.dart';
import 'package:provider/provider.dart';

class MyProfile extends StatelessWidget {
  late ProfileProvider profileProvider;

  @override
  Widget build(BuildContext context) {
    profileProvider = context.read<ProfileProvider>();
    return Consumer<ProfileProvider>(
      builder: (BuildContext context, value, Widget? child) => Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFe2a1fc),
              Color(0xFFe2a1fc),
              Color(0xFFf4b961),
              Color(0xFF7eadf8),
              Color(0xFF7eadf8),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Center(
                      child: Container(
                        height: 120,
                        width: 120,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: Colors.white),
                      ),
                    ),
                    Positioned(
                      bottom: 2,
                      right: 110,
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black12,
                                  offset: Offset(3, 3),
                                  blurRadius: 3),
                              BoxShadow(
                                  color: Colors.black12,
                                  offset: Offset(-3, -3),
                                  blurRadius: 3),
                            ]),
                        child: const Icon(Icons.edit),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                        child: Container(
                      color: Colors.deepPurple,
                      height: 1,
                    )),
                    const Text(
                      "Basic Info",
                      style: TextStyle(color: Colors.deepPurple),
                    ),
                    Expanded(
                        child: Container(
                      color: Colors.deepPurple,
                      height: 1,
                    )),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: TextFormField(
                          decoration: const InputDecoration(
                            hintText: "FIRSTNAME",
                            hintStyle: TextStyle(
                              color: Colors.deepPurple,
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.deepPurple, width: 1),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: TextFormField(
                          decoration: const InputDecoration(
                              hintText: "MIDDLENAME",
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.deepPurple, width: 1),
                              )),
                        ),
                      ),
                    ),
                    Expanded(
                      child: TextFormField(
                        decoration: const InputDecoration(
                            hintText: "LASTNAME",
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.deepPurple, width: 1),
                            )),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        decoration: const InputDecoration(
                            hintText: "EMAIL",
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.deepPurple, width: 1),
                            )),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: TextFormField(
                        decoration: const InputDecoration(
                            hintText: "BIRTHDAY",
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.deepPurple, width: 1),
                            )),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        decoration: const InputDecoration(
                            hintText: "SSN",
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.deepPurple, width: 1),
                            )),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: TextFormField(
                        decoration: const InputDecoration(
                            hintText: "PATIENTID",
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.deepPurple, width: 1),
                            )),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        decoration: const InputDecoration(
                            hintText: "S Orientation",
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.deepPurple, width: 1),
                            )),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: TextFormField(
                        decoration: const InputDecoration(
                            hintText: "SELECT MATERIAL STATUS",
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.deepPurple, width: 1),
                            )),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                        child: Container(
                      color: Colors.deepPurple,
                      height: 1,
                    )),
                    const Text(
                      "Contact Info",
                      style: TextStyle(color: Colors.deepPurple),
                    ),
                    Expanded(
                        child: Container(
                      color: Colors.deepPurple,
                      height: 1,
                    )),
                  ],
                ),
                CheckData(Select: value.select),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        decoration: const InputDecoration(
                            hintText: "RELATION",
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.deepPurple, width: 1),
                            )),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: TextFormField(
                        decoration: const InputDecoration(
                            hintText: "ALTERNATIVE PHONE",
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.deepPurple, width: 1),
                            )),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                CheckData(Select: value.select),
                Row(
                  children: [
                    Expanded(
                        child: Container(
                      color: Colors.deepPurple,
                      height: 1,
                    )),
                    const Text(
                      "Address",
                      style: TextStyle(color: Colors.deepPurple),
                    ),
                    Expanded(
                        child: Container(
                      color: Colors.deepPurple,
                      height: 1,
                    )),
                  ],
                ),
                TextFormField(
                  decoration: const InputDecoration(
                      hintText: "ADDRESS",
                      enabledBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.deepPurple, width: 1),
                      )),
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        decoration: const InputDecoration(
                            hintText: "APT/STE NUMBER",
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.deepPurple, width: 1),
                            )),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: TextFormField(
                        decoration: const InputDecoration(
                            hintText: "ZIP CODE",
                            enabledBorder: UnderlineInputBorder( borderSide: BorderSide(
                                color: Colors.deepPurple,
                                width:1
                            ),)),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                      hintText: "CITY", enabledBorder: UnderlineInputBorder( borderSide: BorderSide(
                      color: Colors.deepPurple,
                      width:1
                  ),)),
                ),
                Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 70,
                        child: DropdownButton(
                          underline: Container(
                            height: 1,
                            color: Colors.deepPurple,
                          ),
                          isExpanded: true,
                          value: value.dropDownItem,
                          items: value.items.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(items),
                            );
                          }).toList(),
                          onChanged: (Object? val) {
                            value.dropDownItem = val;
                            value.notifyListeners();
                          },
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: SizedBox(
                        height: 70,
                        child: DropdownButton(
                          underline: Container(
                            height: 1,
                            color: Colors.deepPurple,
                          ),
                          isExpanded: true,
                          value: value.dropDownItem,
                          items: value.items.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(items),
                            );
                          }).toList(),
                          onChanged: (Object? val) {
                            value.dropDownItem = val;
                            value.notifyListeners();
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                        child: Container(
                      color: Colors.deepPurple,
                      height: 1,
                    )),
                    const Text("Other Info",style: TextStyle(color: Colors.deepPurple),),
                    Expanded(
                        child: Container(
                      color: Colors.deepPurple,
                      height: 1,
                    )),
                  ],
                ),
                TextFormField(
                  decoration: const InputDecoration(
                      hintText: "Responsible Party Nmae",
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.deepPurple,
                            width:1
                        ),
                      )),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 40,
                  width: 350,
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black12,
                            offset: Offset(3, 3),
                            blurRadius: 3),
                        BoxShadow(
                            color: Colors.black12,
                            offset: Offset(-3, -3),
                            blurRadius: 3)
                      ],
                      color: Colors.blue[900]),
                  child: Text(
                    "Update",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

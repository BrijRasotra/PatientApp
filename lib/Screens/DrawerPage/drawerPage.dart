import 'package:flutter/material.dart';
import 'package:patient_app/Screens/DrawerPage/provider/drawerProvider.dart';
import 'package:patient_app/Screens/DrawerPage/widget/profileHeader.dart';
import 'package:provider/provider.dart';

class DrawerPage extends StatelessWidget {
  late DrawerProvider provider;

  @override
  Widget build(BuildContext context) {
    provider = context.read<DrawerProvider>();
    return Drawer(
      width: 250,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFe2a1fc),
              Color(0xFFe2a1fc),
              Color(0xFFf4b961),
              Color(0xFF7eadf8),
              Color(0xFF7eadf8),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          children: [
            ProfileHeader(),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.only(top: 40),
                itemCount: provider.drawerText.length,
                itemBuilder: (context, index) => Consumer<DrawerProvider>(
                  builder: (BuildContext context, value, Widget? child) =>
                      InkWell(
                    onTap: () {
                      Navigator.pop(context);
                      value.onDrawerItemSelected(
                          value.drawerText[index][1], index);
                    },
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 10,
                            ),
                            Icon(
                              value.drawerText[index][0],
                              size: 30,
                              color:  index == value.drawerPos
                            ? Colors.white38
                                : Colors.white,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              value.drawerText[index][1],
                              style: TextStyle(
                                color: index == value.drawerPos
                                    ? Colors.white38
                                    : Colors.white,
                                fontSize: 25,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

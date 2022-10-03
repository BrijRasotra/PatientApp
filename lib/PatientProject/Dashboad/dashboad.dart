import 'package:flutter/material.dart';

import '../DrawerPage/drawerPage.dart';

class DashBoad extends StatelessWidget {
  const DashBoad({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xFFe2a1fc),
      ),
      drawer: DrawerPage(),
      body: Container(
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

      ),
    );
  }
}

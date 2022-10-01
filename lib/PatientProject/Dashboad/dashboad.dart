import 'package:flutter/material.dart';

import '../DrawerPage/drawerPage.dart';

class DashBoad extends StatelessWidget {
  const DashBoad({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFe2a1fc),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      drawer: DrawerPage(),
      body: Container(
        decoration: const BoxDecoration(
        ),
      ),
    );
  }
}

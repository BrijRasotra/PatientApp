import 'package:flutter/material.dart';
import 'package:patient_app/Screens/DrawerPage/provider/drawerProvider.dart';
import 'package:provider/provider.dart';
import '../Appointments/appointments.dart';
import '../ChatPage/chatpage.dart';
import '../DrawerPage/drawerPage.dart';
import '../E-Prescription/e_prescription.dart';
import '../FormList/formlist_Page.dart';
import '../Insurance/insurance.dart';
import '../MyCard/mycard.dart';
import '../MyPayments/myPayment.dart';
import '../MyProfile/MyProfile.dart';
import '../Notifications/notificationPage.dart';
import '../SettingPage/settingPage.dart';
import '../WaitingRoom/waitingRoom.dart';
import '../dash_Board/dashboard.dart';

class HomePage extends StatelessWidget {
  DrawerProvider? drawerProvider;

  @override
  Widget build(BuildContext context) {
    drawerProvider = context.read<DrawerProvider>();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xFFe2a1fc),
        title: Consumer<DrawerProvider>(
            builder: (BuildContext context, value, Widget? child) => Text(
                  value.title,
                  style: TextStyle(fontSize: 22),
                )),
      ),
      drawer: DrawerPage(),
      body: Consumer<DrawerProvider>(
        builder: (_, data, __) {
          switch (data.drawerPos) {
            case 0:
              return DashBoard();
            case 1:
              return MyProfile();
            case 2:
              return Appointments();
            case 3:
              return EPrescription();
            case 4:
              return WaitingRoom();
            case 5:
              return Insurance();
            case 6:
              return FormList();
            case 7:
              return MyCard();
            case 8:
              return MyPayment();
            case 9:
              return NotificationPage();
            case 10:
              return ChatPage();
            case 11:
              return SettingPage();
            default:
              return Container();
          }
        },
      ),
    );
  }
}

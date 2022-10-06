import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class DrawerProvider extends ChangeNotifier {
  List drawerText = [
    [Icons.dashboard, 'Dashboard'],
    [Icons.person, 'MyProfile'],
    [Icons.calendar_today, 'Appointments'],
    [Icons.event_note, 'E-Prescription'],
    [Icons.chair, 'Waiting Room'],
    [Icons.shield, 'Insurance'],
    [Icons.note_alt_sharp, 'Form List'],
    [Icons.credit_card, 'My Cards'],
    [Icons.add_card_outlined, 'My Payments'],
    [Icons.notifications, 'Notification'],
    [Icons.chat, 'Chat'],
    [Icons.settings, 'Settings'],
    [Icons.logout, 'Logout']
  ];
  String _title = 'DashBoard',formType='R';
  int _drawerPos = 0;
  bool floatVisibility = true;

  String get title => _title;
  GlobalKey<ScaffoldState> scaffoldKey=GlobalKey();

  int get drawerPos => _drawerPos;

  void onDrawerItemSelected(String title,int index) {
    _title = drawerText[index][1];
    _drawerPos = index;
    notifyListeners();
  }

  String? userFName, userLName, userEmail, userImage;


  Future<void> resetHome() async {
    _title = 'Dashboard';
    _drawerPos = 0;
  }

  void setKey(GlobalKey<ScaffoldState> scaffoldKey) {
    this.scaffoldKey = scaffoldKey;
  }

  void onFormItemSelected(String title, int pos, String type) {
    formType=type;
    onDrawerItemSelected(title, pos);
  }
}

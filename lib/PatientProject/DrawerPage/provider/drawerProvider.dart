import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class DrawerProvider extends ChangeNotifier{

  List drawerText=[
    [ Icons.dashboard,'Dashboard',],
    [Icons.person,'MyProfile',],
    [ Icons.calendar_today, 'Appointments',],
    [ Icons.event_note, 'E-Prescription',],
    [Icons.chair, 'Waiting Room',],
    [Icons.shield, 'Insurance',],
    [Icons.note_alt_sharp,'Form List'],
    [Icons.credit_card,'My Cards'],
    [Icons.add_card_outlined,'My Payments'],
    [Icons.notifications,'Notification'],
    [Icons.chat,'Chat'],
    [Icons.settings,'Settings'],
    [Icons.logout,'Logout']
  ];
}
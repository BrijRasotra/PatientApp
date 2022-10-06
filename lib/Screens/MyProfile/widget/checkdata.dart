import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CheckData extends StatefulWidget {
  bool Select = false;

  CheckData({required this.Select});

  @override
  State<CheckData> createState() => _CheckDataState();
}

class _CheckDataState extends State<CheckData> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          fillColor:MaterialStatePropertyAll(Colors.deepPurple),
            value: widget.Select,
            onChanged: (val) {
              setState(() {
                widget.Select = val!;
              });
            }),
        Text(
          'Allow provider to send you voicemail or sms',
          style: TextStyle(
              color: Colors.deepPurple, fontSize: 13, fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}

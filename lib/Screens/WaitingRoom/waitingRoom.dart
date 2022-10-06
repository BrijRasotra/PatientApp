import 'package:flutter/material.dart';

class WaitingRoom extends StatelessWidget {
  const WaitingRoom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}

import 'package:flutter/material.dart';
import 'package:patient_app/Screens/login/login.dart';
import 'package:patient_app/util/local_storage.dart';
import '../../util/util.dart';
import '../HomePage/dashboad.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late Size size;
  late AnimationController _animationController;
  var _scaleTween, _translateTween;

  @override
  initState() {
    // TODO: implement initState
    super.initState();
    _animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 1500));
    _scaleTween = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: _animationController,
        curve: Interval(0.0, 0.50, curve: Curves.ease)));
    _translateTween = Tween<double>(begin: -200.0, end: 0.0).animate(
        CurvedAnimation(
            parent: _animationController,
            curve: Interval(0.50, 1.0, curve: Curves.ease)));
    _animationController.forward();
    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Future.delayed(
            Duration(milliseconds: 500),
            () => {
              print('yes'),
                  openPage(),
                });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            Color(0xFFfeb3ed),
            Color(0xFF7eadf8),
            Color(0xFFf4b961),
            Color(0xFFfeb3ed),
            Color(0xFF7eadf8)
          ], begin: Alignment.topRight, end: Alignment.bottomLeft),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedBuilder(
              animation: _animationController,
              builder: (context, child) {
                return Transform(
                  transform: Matrix4.identity()
                    ..translate(0.0, _translateTween.value, 0.0)
                    ..scale(_scaleTween.value),
                  alignment: Alignment.center,
                  child: child,
                );
              },
              child: Center(
                child: Container(
                  height: 200,
                  width: 200,
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFFac59db),
                      boxShadow: [
                        const BoxShadow(
                            color: Colors.black12,
                            offset: Offset(4, 4),
                            blurRadius: 4),
                        BoxShadow(
                            color: Color(0xFFddadf8),
                            offset: Offset(-4, -4),
                            blurRadius: 4),
                      ]),
                  child: Image.network(
                    "https://www.freeiconspng.com/thumbs/doctor-logo/transparent-medical-doctor-background-logos-18.png",
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TweenAnimationBuilder(
              duration: const Duration(seconds: 3),
              tween: Tween(begin: 0.0, end: 1.0),
              builder: (BuildContext context, double value, Widget? child) =>
                  Opacity(
                opacity: value,
                child: Text(
                  "PATIENT APP\nCARE PATIENT",
                  style: TextStyle(
                    color: Colors.blue[900],
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    shadows: const [
                      Shadow(
                        offset: Offset(5.0, 5.0),
                        blurRadius: 3.0,
                        color: Colors.black12,
                      ),
                      Shadow(
                        offset: Offset(5.0, 5.0),
                        blurRadius: 8.0,
                        color: Colors.black12,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  openPage() async {
    String id = await getId();
    bool val = await getUserLock();
    print(id);
    if (val) {
      final isAuthenticated = await LocalAuthApi.authenticate();
      print('isAuthenticated $isAuthenticated ');
      if (isAuthenticated) {
        if (id == 'null')
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => LoginPage()));
        else {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => HomePage()));
        }
      } else
        print('cancel ');
    } else {
      if (id == 'null')
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => LoginPage()));
      else {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomePage()));
      }
    }
  }
}

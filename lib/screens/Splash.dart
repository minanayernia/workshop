// import 'dart:html';
// import '';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:workshop/main.dart';
import 'package:workshop/screens/intro1.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

// class Splash extends StatefulWidget {
//   @override
//   SplashState createState() => new SplashState();
// }

// class SplashState extends State<Splash> {
//   Future checkFirstSeen() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     bool _seen = (prefs.getBool('seen') ?? false);

//     if (_seen) {
//       Navigator.of(context).pushReplacement(
//           new MaterialPageRoute(builder: (context) => new MyHomePage()));
//     } else {
//       await prefs.setBool('seen', true);
//       Navigator.of(context).pushReplacement(
//           new MaterialPageRoute(builder: (context) => new FirstIntroPage()));
//     }
//   }

//   @override
//   void initState() {
//     super.initState();
//     new Timer(new Duration(milliseconds: 200), () {
//       checkFirstSeen();
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return new Scaffold(
//       body: new Center(
//         child: new Text('Loading...'),
//       ),
//     );
//   }
// }

// SchedulerBinding.instance.addPostFrameCallback((_) {
//   // your code after page opens,splash keeps open until work is done
// });

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  // void initState() {
  //   super.initState();
    
  //     Timer(Duration(seconds: 5), () => {});
  //     print("boz");
  //     Navigator.pushNamed(context, '/login');
    
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/splash_bg.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Container(
              height: MediaQuery.of(context).size.height * 0.4,
              width: MediaQuery.of(context).size.width * 0.6,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/Learnoo_new.gif"))),
              child: Container(
                height: 50,
                width: 50,
                child: RaisedButton(
                  child: Text("home"),
                  onPressed: () {
                    Navigator.pushNamed(context, "/intro1");
                  },
                ),
              ),
            ),
          )),
    );
  }
}

// class CountDownTimer extends StatefulWidget {
//   const CountDownTimer({
//     Key key,
//     int secondsRemaining,
//     this.countDownTimerStyle,
//     this.whenTimeExpires,
//     this.countDownFormatter,
//   })  : secondsRemaining = secondsRemaining,
//         super(key: key);

//   final int secondsRemaining;
//   final Function whenTimeExpires;
//   final Function countDownFormatter;
//   final TextStyle countDownTimerStyle;

//   State createState() => new _CountDownTimerState();
// }

// class _CountDownTimerState extends State<CountDownTimer>
//     with TickerProviderStateMixin {
//   AnimationController _controller;
//   Duration duration;

//   String get timerDisplayString {
//     Duration duration = _controller.duration * _controller.value;
//     return widget.countDownFormatter != null
//         ? widget.countDownFormatter(duration.inSeconds),
//         // : formatHHMMSS(duration.inSeconds);
//       // In case user doesn't provide formatter use the default one
//      // for that create a method which will be called formatHHMMSS or whatever you like
//   }

//   @override
//   void initState() {
//     super.initState();
//     duration = new Duration(seconds: widget.secondsRemaining);
//     _controller = new AnimationController(
//       vsync: this,
//       duration: duration,
//     );
//     _controller.reverse(from: widget.secondsRemaining.toDouble());
//     _controller.addStatusListener((status) {
//       if (status == AnimationStatus.completed || status == AnimationStatus.dismissed) {
//         widget.whenTimeExpires();
//       }
//     });
//   }

//   @override
//   void didUpdateWidget(CountDownTimer oldWidget) {
//     if (widget.secondsRemaining != oldWidget.secondsRemaining) {
//       setState(() {
//         duration = new Duration(seconds: widget.secondsRemaining);
//         _controller.dispose();
//         _controller = new AnimationController(
//           vsync: this,
//           duration: duration,
//         );
//         _controller.reverse(from: widget.secondsRemaining.toDouble());
//         _controller.addStatusListener((status) {
//           if (status == AnimationStatus.completed) {
//             widget.whenTimeExpires();
//           } else if (status == AnimationStatus.dismissed) {
//             print("Animation Complete");
//           }
//         });
//       });
//     }
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return new Center(
//         child: AnimatedBuilder(
//             animation: _controller,
//             builder: (_, Widget child) {
//               return Text(
//                 timerDisplayString,
//                 style: widget.countDownTimerStyle,
//               );
//             }));
//   }
// }

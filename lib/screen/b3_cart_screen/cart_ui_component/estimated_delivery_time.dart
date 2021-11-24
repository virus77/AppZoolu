import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:treva_shop_flutter/Library/Language_Library/lib/easy_localization.dart';
import 'package:treva_shop_flutter/screen/b3_cart_screen/cart_ui_component/checkout_data.dart';
import 'package:treva_shop_flutter/screen/b3_cart_screen/cart_ui_component/rate_service.dart';
import 'package:treva_shop_flutter/screen/b3_cart_screen/cart_ui_component/time_widget.dart';

class EstimatedDeliveryTime extends StatefulWidget {
  @override
  _EstimatedDeliveryTimeState createState() => _EstimatedDeliveryTimeState();
}

class _EstimatedDeliveryTimeState extends State<EstimatedDeliveryTime> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: InkWell(
              onTap: () {
                Navigator.of(context).pop(false);
              },
              child: Icon(Icons.arrow_back)),
          elevation: 0.0,
          title: Text(
            'Tiempo estimado',
            style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 18.0,
                color: Colors.black54,
                fontFamily: "Gotik"),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Color(0xFF6991C7)),
        ),
        body: SingleChildScrollView(
            child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CircularCountDownTimer(
                      // Countdown duration in Seconds.
                      duration: 120,

                      // Controls (i.e Start, Pause, Resume, Restart) the Countdown Timer.
                      controller: CountDownController(),

                      // Width of the Countdown Widget.
                      width: 150,

                      // Height of the Countdown Widget.
                      height: 250,

                      // Ring Color for Countdown Widget.
                      color: Color(0xFFFCE273),

                      // Filling Color for Countdown Widget.
                      fillColor: Color(0xFFF27134),

                      // Background Color for Countdown Widget.
                      backgroundColor: Colors.white,

                      // Border Thickness of the Countdown Ring.
                      strokeWidth: 20.0,

                      // Begin and end contours with a flat edge and no extension.
                      strokeCap: StrokeCap.round,

                      // Text Style for Countdown Text.
                      textStyle: TextStyle(
                          fontSize: 33.0,
                          color: Colors.black87,
                          fontWeight: FontWeight.bold),

                      // Format for the Countdown Text.
                      textFormat: CountdownTextFormat.MM_SS,

                      // Handles Countdown Timer (true for Reverse Countdown (max to 0), false for Forward Countdown (0 to max)).
                      isReverse: true,

                      // Handles Animation Direction (true for Reverse Animation, false for Forward Animation).
                      isReverseAnimation: true,

                      // Handles visibility of the Countdown Text.
                      isTimerTextShown: true,

                      // Handles the timer start.
                      autoStart: true,

                      // This Callback will execute when the Countdown Starts.
                      onStart: () {
                        // Here, do whatever you want
                        print('Countdown Started');
                      },

                      // This Callback will execute when the Countdown Ends.
                      onComplete: () {
                        // Here, do whatever you want
                        print('Countdown Ended');
                      },
                    ),
                    // TimeWidget(
                    //   time: 20,
                    // ),
                  ],
                )
              ],
            ),
            CheckoutData(),
            SizedBox(
              height: 50,
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).pushReplacement(PageRouteBuilder(
                    pageBuilder: (_, __, ___) => RateService()));
              },
              child: Container(
                height: 55.0,
                width: 300.0,
                decoration: BoxDecoration(
                    color: Colors.indigoAccent,
                    borderRadius: BorderRadius.all(Radius.circular(40.0))),
                child: Center(
                  child: Text(
                    'Continuar',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 16.5,
                        letterSpacing: 1.0),
                  ),
                ),
              ),
            ),
            SizedBox(height: 100,)
          ],
        )));
  }
}

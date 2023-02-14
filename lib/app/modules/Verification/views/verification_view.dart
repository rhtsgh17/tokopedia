import 'package:external_app_launcher/external_app_launcher.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../config/warna.dart';
// ignore: unused_import
import '../../../routes/app_pages.dart';
import '../controllers/verification_controller.dart';

class VerificationView extends GetView<VerificationController> {
  final controller = Get.put(VerificationController());
  @override
  Widget build(BuildContext context) {
    double tinggi = MediaQuery.of(context).size.height;
    double lebar = MediaQuery.of(context).size.width;
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        width: lebar,
        padding: EdgeInsets.fromLTRB(25, 50, 25, 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                        width: 80,
                        height: 80,
                        // color: Colors.black,
                        margin: EdgeInsets.only(bottom: 20),
                        child: Image.asset("assets/image/mail.png",
                            alignment: Alignment.center, fit: BoxFit.contain)),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(bottom: 20),
                    child: Text("Check Your Email",
                        style: TextStyle(
                            fontSize: 35, fontWeight: FontWeight.bold)),
                  ),
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(bottom: 20),
                    child: Text(
                        "We have sent a password recover instructions to your email.",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 18, color: Colors.grey)),
                  ),
                  Center(
                    child: Container(
                        width: 180,
                        height: tinggi * 0.08,
                        margin: EdgeInsets.only(bottom: 20),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(primary: bgLogin2),
                          onPressed: () async {
                            await LaunchApp.openApp(
                              androidPackageName: 'com.google.android.gm',
                              iosUrlScheme: 'googlegmail://',
                              appStoreLink:
                                  'itms-apps://apps.apple.com/us/app/gmail-email-by-google/id422689480',
                              openStore: true,
                            );
                          },
                          child: Text("Open Email App",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18)),
                        )),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(bottom: 40),
                    child: Text("Skip, I’ll confirm later",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey,
                        )),
                  ),
                  SizedBox(
                    height: 70,
                  ),
                  Container(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                              "Did not receive the email ? Check your spam filter,or",
                              style:
                                  TextStyle(fontSize: 18, color: Colors.grey)),
                          TextButton(
                              onPressed: () {},
                              child: Text("try another email address",
                                  style:
                                      TextStyle(fontSize: 18, color: bgLogin2)))
                        ]),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}

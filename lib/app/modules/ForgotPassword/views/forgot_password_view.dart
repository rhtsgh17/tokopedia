import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tokopedia/app/routes/app_pages.dart';

import '../../../../config/warna.dart';

import '../controllers/forgot_password_controller.dart';

class ForgotPasswordView extends GetView<ForgotPasswordController> {
  final controller = Get.put(ForgotPasswordController());
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
                  Container(
                    margin: EdgeInsets.only(bottom: 20),
                    child: Text("Reset Password",
                        style: TextStyle(
                            fontSize: 35, fontWeight: FontWeight.bold)),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 40),
                    child: Text(
                        "Enter the email associated with your account and we'll send an email with instructions to reset your password.",
                        style: TextStyle(fontSize: 18, color: Colors.grey)),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    child: Text("Email Address",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 20),
                    child: TextField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            hintText: "Enter Your Email",
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                                borderRadius: BorderRadius.circular(10)))),
                  ),
                  Container(
                    width: lebar,
                    height: tinggi * 0.08,
                    margin: EdgeInsets.only(bottom: 20),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: bgLogin2),
                      onPressed: () {
                        Get.toNamed(Routes.VERIFICATION);
                      },
                      child: Text("Send Intructions",
                          style: TextStyle(color: Colors.white, fontSize: 18)),
                    ),
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

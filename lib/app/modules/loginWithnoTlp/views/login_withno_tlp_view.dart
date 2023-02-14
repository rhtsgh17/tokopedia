import 'package:flutter/material.dart';

import 'package:get/get.dart';
// ignore: unused_import
import 'package:iconly/iconly.dart';

import '../../../../config/warna.dart';
import '../../../controllers/auth_controller_controller.dart';
// ignore: unused_import
import '../../../routes/app_pages.dart';
import '../controllers/login_withno_tlp_controller.dart';

class LoginWithnoTlpView extends GetView<LoginWithnoTlpController> {
  final controller = Get.put(LoginWithnoTlpController());
  final authController = Get.put(AuthControllerController());
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
                    child: Text("Login Phone Number",
                        style: TextStyle(
                            fontSize: 35, fontWeight: FontWeight.bold)),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 40),
                    child: Text("login with your own beautiful phone number",
                        style: TextStyle(fontSize: 18, color: Colors.grey)),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    child: Text("Phone Number",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 20),
                    child: TextField(
                        controller: controller.phone,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            hintText: "Enter Your Mobile Phone",
                            prefixIcon: Container(
                              width: lebar * 0.13,
                              child: Row(
                                children: [
                                  Container(
                                      margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
                                      child: Text(
                                        "+62",
                                        style: TextStyle(
                                            fontSize: 17, color: bgLogin2),
                                      )),
                                  Container(
                                      margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
                                      height: tinggi * 0.04,
                                      child: VerticalDivider(
                                        color: Colors.grey,
                                        width: 2,
                                      ))
                                ],
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                                borderRadius: BorderRadius.circular(10)))),
                  ),
                  SizedBox(
                    height: 37,
                  ),
                  Container(
                    width: lebar,
                    height: tinggi * 0.08,
                    margin: EdgeInsets.only(bottom: 20),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: bgLogin2),
                      onPressed: () =>
                          authController.verifyPhone(controller.phone.text),
                      child: Text("Send OTP",
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

// 85692129089
// 926148
// 272935
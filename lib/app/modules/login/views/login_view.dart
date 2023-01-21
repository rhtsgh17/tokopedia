import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:tokopedia/app/modules/ForgotPassword/bindings/forgot_password_binding.dart';
import 'package:tokopedia/app/routes/app_pages.dart';
import 'package:tokopedia/config/warna.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    double tinggi = MediaQuery.of(context).size.height;
    double lebar = MediaQuery.of(context).size.width;
    return Obx(() => Scaffold(
            body: SingleChildScrollView(
          child: Container(
            width: lebar,
            padding: EdgeInsets.fromLTRB(25, 50, 25, 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: tinggi * 0.85,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 20),
                        child: Text("Hi, Welcome Back!",
                            style: TextStyle(
                                fontSize: 35, fontWeight: FontWeight.bold)),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 40),
                        child: Text("Hello again, you’ve been missed!",
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
                        margin: EdgeInsets.only(bottom: 10),
                        child: Text("Password",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 20),
                        child: TextField(
                            obscureText: controller.showhidepw.value,
                            decoration: InputDecoration(
                                suffixIcon: IconButton(
                                    onPressed: () => controller.changeEye(),
                                    icon: Icon(
                                        controller.showhidepw.value
                                            ? Icons.visibility
                                            : Icons.visibility_off,
                                        color: Colors.grey)),
                                hintText: "Enter Your Password",
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(10)))),
                      ),
                      Container(
                        alignment: Alignment.topRight,
                        margin: EdgeInsets.only(bottom: 20),
                        child: TextButton(
                            onPressed: () {
                              Get.toNamed(Routes.FORGOT_PASSWORD);
                            },
                            child: Text("Forgot Password",
                                style: TextStyle(
                                    fontSize: 15, color: Colors.grey))),
                      ),
                      Container(
                        width: lebar,
                        height: tinggi * 0.08,
                        margin: EdgeInsets.only(bottom: 20),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(primary: bgLogin2),
                          onPressed: () {
                            Get.toNamed("/home");
                          },
                          child: Text("Login",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18)),
                        ),
                      ),
                      Container(
                        width: lebar,
                        margin: EdgeInsets.only(bottom: 20),
                        child: Row(children: [
                          Expanded(child: Divider(color: Colors.grey)),
                          Container(
                              margin: EdgeInsets.symmetric(horizontal: 50),
                              child: Text("Or Login With",
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 15))),
                          Expanded(child: Divider(color: Colors.grey))
                        ]),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: lebar * 0.35,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.white),
                              onPressed: () {},
                              child: Row(
                                children: [
                                  Image.asset("assets/image/Facebook.png"),
                                  Container(
                                      margin: EdgeInsets.only(left: 10),
                                      child: Text(
                                        "Facebook",
                                        style: TextStyle(
                                            fontSize: 16, color: Colors.black),
                                      ))
                                ],
                              ),
                            ),
                          ),
                          Container(
                            width: lebar * 0.35,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.white),
                              onPressed: () {},
                              child: Row(
                                children: [
                                  Image.asset("assets/image/Google.png"),
                                  Container(
                                      margin: EdgeInsets.only(left: 10),
                                      child: Text(
                                        "Google",
                                        style: TextStyle(
                                            fontSize: 16, color: Colors.black),
                                      ))
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Don’t have an account ?",
                            style: TextStyle(fontSize: 18, color: Colors.grey)),
                        InkWell(
                          onTap: () => Get.toNamed(Routes.SIGN_UP),
                          child: Text("Sign Up",
                              style: TextStyle(fontSize: 18, color: bgLogin2)),
                        )
                      ]),
                ),
              ],
            ),
          ),
        )));
  }
}

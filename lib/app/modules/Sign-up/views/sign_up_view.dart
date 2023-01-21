import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../config/warna.dart';

import '../../../routes/app_pages.dart';
import '../controllers/sign_up_controller.dart';

class SignUpView extends GetView<SignUpController> {
  final controller = Get.put(SignUpController());
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 20),
                        child: Text("Create Account",
                            style: TextStyle(
                                fontSize: 35, fontWeight: FontWeight.bold)),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 40),
                        child: Text("Connect with your friends today!",
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
                        child: Text("Mobile Phone",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 20),
                        child: TextField(
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                                hintText: "Enter Your Mobile Phone",
                                prefixIcon: Container(
                                  width: lebar * 0.13,
                                  child: Row(
                                    children: [
                                      Container(
                                          margin:
                                              EdgeInsets.fromLTRB(10, 5, 10, 5),
                                          child: Text(
                                            "+62",
                                            style: TextStyle(
                                                fontSize: 17, color: bgLogin2),
                                          )),
                                      Container(
                                          margin:
                                              EdgeInsets.fromLTRB(0, 5, 0, 5),
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
                        width: lebar,
                        height: tinggi * 0.08,
                        margin: EdgeInsets.only(bottom: 20),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(primary: bgLogin2),
                          onPressed: () {},
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
                        TextButton(
                            onPressed: () => Get.toNamed(Routes.LOGIN),
                            child: Text("Login",
                                style:
                                    TextStyle(fontSize: 18, color: bgLogin2)))
                      ]),
                ),
              ],
            ),
          ),
        )));
  }
}

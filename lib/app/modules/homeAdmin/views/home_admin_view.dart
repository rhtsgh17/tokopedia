import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../../home/views/home_view.dart';
import '../controllers/home_admin_controller.dart';

class HomeAdminView extends GetView<HomeAdminController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('HomeAdminView'),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Center(
              child: Container(
                margin: EdgeInsets.only(top: 25),
                child: Wrap(
                  spacing: 45,
                  runSpacing: 50,
                  children: [
                    InkWell(
                      onTap: () => Get.toNamed(Routes.SLIDER_DATA),
                      child: CustomMenu(
                        icon: "assets/image/promo.png",
                        text: "Slider Data",
                      ),
                    ),
                    CustomMenu(
                      icon: "assets/image/hedset.png",
                      text: "Elektronik",
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}

Widget pilihan(lebar, warna, warna2, judul, warna3) {
  return Container(
    width: lebar * 0.7,
    height: 86,
    padding: EdgeInsets.all(20),
    margin: EdgeInsets.only(right: 12),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(6),
      gradient: LinearGradient(
        begin: Alignment.bottomCenter,
        end: Alignment.topRight,
        colors: [warna, warna2],
      ),
    ),
    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(
        width: 30,
        height: 3,
        margin: EdgeInsets.only(bottom: 5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(2), color: warna3),
      ),
      Text(
        judul,
        style: TextStyle(fontWeight: FontWeight.w600, color: Colors.white),
      )
    ]),
  );
}

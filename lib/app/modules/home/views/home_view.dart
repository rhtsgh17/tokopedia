// ignore_for_file: dead_code

import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:tokopedia/app/controllers/product_controller.dart';
import 'package:tokopedia/app/controllers/slider_controller.dart';
import 'package:iconly/iconly.dart';
import 'package:tokopedia/config/warna.dart';

import '../../../controllers/auth_controller_controller.dart';
import '../../../routes/app_pages.dart';
// import '../../detail/views/detail_view.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  final authController = Get.put(AuthControllerController());
  final sliderController = Get.put(SliderController());
  final produkController = Get.put(ProdukController());
  final homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    double tinggi = MediaQuery.of(context).size.height;
    double lebar = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: tinggi * 0.13,
              decoration: BoxDecoration(color: atas),
              // padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 10),
                    width: lebar * 0.43,
                    child: TextField(
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.search),
                            fillColor: Colors.white,
                            filled: true,
                            labelText: "Kaos Bola",
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                                borderRadius: BorderRadius.circular(10)))),
                  ),
                  Container(
                    width: lebar * 0.4,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            Icons.mail_outline,
                            color: Colors.white,
                            size: 25,
                          ),
                          Image.asset("assets/image/shopping-cart_1.png"),
                          Image.asset("assets/image/Group_19.png"),
                          TextButton(
                              onPressed: () => authController.logout(),
                              child: Image.asset("assets/image/menu_1.png"))
                        ]),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            FutureBuilder<QuerySnapshot<Object?>>(
                future: sliderController.getData(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    var listData = snapshot.data!.docs;
                    return Container(
                      width: lebar,
                      height: tinggi * 0.15,
                      child: CarouselSlider(
                        options: CarouselOptions(
                            height: 400.0,
                            autoPlay: true,
                            autoPlayInterval: Duration(seconds: 3)),
                        items: listData.map((i) {
                          return Builder(builder: (BuildContext context) {
                            return Container(
                                width: lebar,
                                margin: EdgeInsets.symmetric(horizontal: 5.0),
                                child: Container(
                                  child: Image.network((i.data()
                                      as Map<String, dynamic>)["gambarSlider"]),
                                ));
                          });
                        }).toList(),
                      ),
                    );
                  } else {
                    return SizedBox();
                  }
                }),
            Container(
              margin: EdgeInsets.only(top: 15),
              child: Wrap(
                spacing: 25,
                runSpacing: 20,
                children: [
                  CustomMenu(
                    icon: "assets/image/promo.png",
                    text: "Promo Hari ini",
                  ),
                  CustomMenu(
                    icon: "assets/image/suu.png",
                    text: "Toserba",
                  ),
                  CustomMenu(
                    icon: "assets/image/hedset.png",
                    text: "Elektronik",
                  ),
                  CustomMenu(
                    icon: "assets/image/teks.png",
                    text: "Top-up & tagihan",
                  ),
                  CustomMenu(
                    icon: "assets/image/semua.png",
                    text: "Lihat Semua",
                  ),
                  CustomMenu(
                    icon: "assets/image/mantap.png",
                    text: "Official Store",
                  ),
                  CustomMenu(
                    icon: "assets/image/play.png",
                    text: "Live Shooping",
                  ),
                  CustomMenu(
                    icon: "assets/image/seru.png",
                    text: "Tokopedia Susu",
                  ),
                  CustomMenu(
                    icon: "assets/image/cod.png",
                    text: "Bayar di Tempat",
                  ),
                  CustomMenu(
                    icon: "assets/image/looo.png",
                    text: "Bangga Lokal",
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 17,
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 40),
                  child: Text("Kejar Diskon Spesial",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                ),
              ],
            ),
            SizedBox(
              height: 13,
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 40),
                  child: Text("Berakhir Dalam",
                      style: TextStyle(
                          fontSize: 10, fontWeight: FontWeight.normal)),
                ),
                Container(
                  margin: EdgeInsets.all(7),
                  width: 100,
                  height: 23,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(13),
                    color: merah,
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.access_time,
                        color: Colors.white,
                      ),
                      Text(
                        "00 : 15 : 12",
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 170),
                  child: Text("Lihat Semua",
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.normal,
                          color: atas)),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Column(
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Container(
                          width: lebar,
                          height: tinggi * 0.4,

                          // color: Colors.black,
                          margin: EdgeInsets.only(bottom: 30),
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.topRight,
                                  end: Alignment.bottomLeft,
                                  colors: [
                                Color(0xff01A0C6),
                                Color(0xff01AA6C)
                              ])),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left: 5),
                                  child: Row(
                                    children: [
                                      Image.asset("assets/image/kejar.png")
                                    ],
                                  ),
                                ),
                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: FutureBuilder<QuerySnapshot<Object?>>(
                                    future: produkController.getDataDiskon(),
                                    builder: (context, snapshot) {
                                      if (snapshot.connectionState ==
                                          // ignore: dead_code
                                          ConnectionState.done) {
                                        // ignore: unused_local_variable
                                        var dataPromo = snapshot.data!.docs;
                                        return Row(
                                          children: List.generate(
                                              dataPromo.length, (index) {
                                            return InkWell(
                                              onTap: () => Get.toNamed(Routes.DETAIL,arguments: dataPromo[index]),
                                              child: Container(
                                                width: 148,
                                                height: 245,
                                                color: Colors.white,
                                                margin: EdgeInsets.only(left: 30),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Image.network(
                                                      (dataPromo[index].data()
                                                              as Map<String,
                                                                  dynamic>)[
                                                          "gambarP"],
                                                    ),
                                                    SizedBox(
                                                      height: 5,
                                                    ),
                                                    Row(
                                                      children: [
                                                        SizedBox(
                                                          width: 5,
                                                        ),
                                                        Container(
                                                          child: Text(
                                                            "Rp 1.000",
                                                            style: TextStyle(
                                                                fontSize: 10,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 5,
                                                    ),
                                                    Row(
                                                      children: [
                                                        SizedBox(
                                                          width: 5,
                                                        ),
                                                        Container(
                                                          height: 13,
                                                          width: 25,
                                                          color: merah1,
                                                          child: Text(
                                                            "92%",
                                                            style: TextStyle(
                                                                fontSize: 10,
                                                                color: merah),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 5,
                                                        ),
                                                        Container(
                                                          child: Text(
                                                            "Rp 12.546",
                                                            style: TextStyle(
                                                                fontSize: 10,
                                                                color:
                                                                    Colors.grey,
                                                                decoration:
                                                                    TextDecoration
                                                                        .lineThrough),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 7,
                                                    ),
                                                    Row(
                                                      children: [
                                                        SizedBox(
                                                          width: 5,
                                                        ),
                                                        Container(
                                                            child: Image.asset(
                                                                "assets/image/benar.png")),
                                                        Container(
                                                          child: Text(
                                                              "Kab.Tangerang"),
                                                        )
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 7,
                                                    ),
                                                    Row(
                                                      children: [
                                                        SizedBox(
                                                          width: 4,
                                                        ),
                                                        Container(
                                                          margin: EdgeInsets.only(
                                                              bottom: 5, top: 10),
                                                          child:
                                                              StepProgressIndicator(
                                                            totalSteps: 100,
                                                            currentStep: 80,
                                                            size: 5,
                                                            padding: 0,
                                                            selectedColor: Colors
                                                                .red.shade600,
                                                            unselectedColor:
                                                                Color(0xffeeeeee),
                                                            roundedEdges:
                                                                Radius.circular(
                                                                    2),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        Container(
                                                          margin: EdgeInsets.only(
                                                              left: 6),
                                                          child: Text(
                                                            "segera habis",
                                                            style: TextStyle(
                                                                fontSize: 10,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal),
                                                          ),
                                                        ),
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ),
                                            );
                                          }),
                                        );
                                      } else {
                                        return SizedBox();
                                      }
                                    },
                                  ),
                                )
                              ],
                            ),
                          )),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 40),
                      child: Text("Pilihan Promo Hari ini",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 170),
                      child: Text("Lihat Semua",
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.normal,
                              color: atas)),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Column(
                  children: [
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 25),
                            child: Row(
                              children: [Image.asset("assets/image/oh.png")],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 15),
                            child: Row(
                              children: [
                                Image.asset("assets/image/toserba.png")
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 15),
                            child: Row(
                              children: [Image.asset("assets/image/mega.png")],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 40),
                        child: Text("Produk Pilihan Untukmu",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 170),
                        child: Text("Lihat Semua",
                            style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.normal,
                                color: atas)),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Wrap(
                  // spacing: 20,
                  // runSpacing: 20,
                  children: [
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Container(
                            width: 158,
                            height: 300,
                            margin: EdgeInsets.only(
                              left: 30,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Image.asset("assets/image/mose.png"),
                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Row(
                                      children: [
                                        Column(
                                          children: [
                                            SizedBox(
                                              height: 8,
                                            ),
                                            Row(
                                              children: [
                                                Container(
                                                  width: 100,
                                                  child: Text(
                                                    "Logitech G603 Lightspeed ...",
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.normal),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 8,
                                            ),
                                            Container(
                                              child: Text(
                                                "Rp 609.000",
                                                style: TextStyle(
                                                    fontSize: 13,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Container(
                                      height: 13,
                                      width: 25,
                                      color: merah1,
                                      child: Text(
                                        "44%",
                                        style: TextStyle(
                                            fontSize: 10, color: merah),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Container(
                                      child: Text(
                                        "Rp 1 .090.000",
                                        style: TextStyle(
                                            fontSize: 10,
                                            color: Colors.grey,
                                            decoration:
                                                TextDecoration.lineThrough),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 7,
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Container(
                                        child: Image.asset(
                                            "assets/image/power.png")),
                                    Container(
                                      child: Text("Kab.Bandung"),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Container(
                                      child: Image.asset(
                                          "assets/image/Vector.png"),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Container(
                                      child: Text(
                                        "4.8",
                                        style: TextStyle(
                                          fontSize: 10,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Container(
                                      child: Text(
                                        "|",
                                        style: TextStyle(
                                          fontSize: 10,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Container(
                                      child: Text(
                                        "Terjual 312",
                                        style: TextStyle(
                                          fontSize: 10,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: 158,
                            height: 300,
                            margin: EdgeInsets.only(left: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Image.asset("assets/image/mosess.png"),
                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Row(
                                      children: [
                                        Column(
                                          children: [
                                            SizedBox(
                                              height: 8,
                                            ),
                                            Row(
                                              children: [
                                                Container(
                                                  width: 100,
                                                  child: Text(
                                                    "Logitech G203 Mouse Gaming",
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 8,
                                            ),
                                            Container(
                                              child: Text(
                                                "Rp 204.000",
                                                style: TextStyle(
                                                    fontSize: 13,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Container(
                                      height: 13,
                                      width: 25,
                                      color: merah1,
                                      child: Text(
                                        "46%",
                                        style: TextStyle(
                                            fontSize: 10, color: merah),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Container(
                                      child: Text(
                                        "Rp 379.000",
                                        style: TextStyle(
                                            fontSize: 10,
                                            color: Colors.grey,
                                            decoration:
                                                TextDecoration.lineThrough),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 7,
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Container(
                                        child: Image.asset(
                                            "assets/image/power.png")),
                                    Container(
                                      child: Text("Kab.Bandung"),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Container(
                                      child: Image.asset(
                                          "assets/image/Vector.png"),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Container(
                                      child: Text(
                                        "4.9",
                                        style: TextStyle(
                                          fontSize: 10,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Container(
                                      child: Text(
                                        "|",
                                        style: TextStyle(
                                          fontSize: 10,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Container(
                                      child: Text(
                                        "Terjual 6 rb",
                                        style: TextStyle(
                                          fontSize: 10,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: 158,
                            height: 300,
                            margin: EdgeInsets.only(left: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Image.asset("assets/image/ultra.png"),
                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Row(
                                      children: [
                                        Column(
                                          children: [
                                            SizedBox(
                                              height: 8,
                                            ),
                                            Row(
                                              children: [
                                                Container(
                                                  width: 100,
                                                  child: Text(
                                                    "Logitech G240 Cloth Gaming",
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 8,
                                            ),
                                            Container(
                                              child: Text(
                                                "Rp 239.000",
                                                style: TextStyle(
                                                    fontSize: 13,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Container(
                                      height: 13,
                                      width: 25,
                                      color: merah1,
                                      child: Text(
                                        "32%",
                                        style: TextStyle(
                                            fontSize: 10, color: merah),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Container(
                                      child: Text(
                                        "Rp 349.000",
                                        style: TextStyle(
                                            fontSize: 10,
                                            color: Colors.grey,
                                            decoration:
                                                TextDecoration.lineThrough),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 7,
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Container(
                                        child: Image.asset(
                                            "assets/image/power.png")),
                                    Container(
                                      child: Text("Kab.Bandung"),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Container(
                                      child: Image.asset(
                                          "assets/image/Vector.png"),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Container(
                                      child: Text(
                                        "5.0",
                                        style: TextStyle(
                                          fontSize: 10,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Container(
                                      child: Text(
                                        "|",
                                        style: TextStyle(
                                          fontSize: 10,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Container(
                                      child: Text(
                                        "Terjual 312",
                                        style: TextStyle(
                                          fontSize: 10,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        pilihan(lebar, pilihan1, pilihan2, 'For rizqi',
                            Colors.white),
                        pilihan(lebar, pilihan3, pilihan4, 'Special Discount',
                            Colors.transparent),
                        pilihan(lebar, pilihan5, pilihan6, 'Aktivitasmu',
                            Colors.transparent),
                        pilihan(lebar, pilihan7, pilihan8, 'Kesukaanmu',
                            Colors.transparent),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 17,
                ),
                Wrap(
                  // spacing: 20,
                  // runSpacing: 20,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 188,
                          height: 350,
                          margin: EdgeInsets.only(
                            left: 40,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Image.asset("assets/image/rival.png"),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Row(
                                    children: [
                                      Column(
                                        children: [
                                          SizedBox(
                                            height: 8,
                                          ),
                                          Row(
                                            children: [
                                              Container(
                                                width: 100,
                                                child: Text(
                                                  "SteelSeries Rival 3 Wireless - Gaming ...",
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.normal),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 8,
                                          ),
                                          Container(
                                            child: Text(
                                              "Rp 699.000",
                                              style: TextStyle(
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Container(
                                    height: 13,
                                    width: 25,
                                    color: merah1,
                                    child: Text(
                                      "12%",
                                      style:
                                          TextStyle(fontSize: 10, color: merah),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Container(
                                    child: Text(
                                      "790.000",
                                      style: TextStyle(
                                          fontSize: 10,
                                          color: Colors.grey,
                                          decoration:
                                              TextDecoration.lineThrough),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 7,
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Container(
                                      child: Image.asset(
                                          "assets/image/power.png")),
                                  Container(
                                    child: Text("Jakarta Pusat"),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Container(
                                    child:
                                        Image.asset("assets/image/Vector.png"),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Container(
                                    child: Text(
                                      "5.0",
                                      style: TextStyle(
                                        fontSize: 10,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Container(
                                    child: Text(
                                      "|",
                                      style: TextStyle(
                                        fontSize: 10,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Container(
                                    child: Text(
                                      "Terjual 124",
                                      style: TextStyle(
                                        fontSize: 10,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: 188,
                          height: 350,
                          margin: EdgeInsets.only(left: 30),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Image.asset("assets/image/tv.png"),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Row(
                                    children: [
                                      Column(
                                        children: [
                                          SizedBox(
                                            height: 8,
                                          ),
                                          Row(
                                            children: [
                                              Container(
                                                width: 100,
                                                child: Text(
                                                  "Monitor Lenovo G34W-30 34...",
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 8,
                                          ),
                                          Container(
                                            child: Text(
                                              "Rp 5.949.900",
                                              style: TextStyle(
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Container(
                                    height: 13,
                                    width: 25,
                                    color: merah1,
                                    child: Text(
                                      "44%",
                                      style:
                                          TextStyle(fontSize: 10, color: merah),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Container(
                                    child: Text(
                                      "Rp 1.090.000",
                                      style: TextStyle(
                                          fontSize: 10,
                                          color: Colors.grey,
                                          decoration:
                                              TextDecoration.lineThrough),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 7,
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Container(
                                      child: Image.asset(
                                          "assets/image/power.png")),
                                  Container(
                                    child: Text("Kota Depok"),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Container(
                                    child:
                                        Image.asset("assets/image/Vector.png"),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Container(
                                    child: Text(
                                      "5.0",
                                      style: TextStyle(
                                        fontSize: 10,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Container(
                                    child: Text(
                                      "|",
                                      style: TextStyle(
                                        fontSize: 10,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Container(
                                    child: Text(
                                      "Terjual 23",
                                      style: TextStyle(
                                        fontSize: 10,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 14,
                ),
                Wrap(
                  // spacing: 20,
                  // runSpacing: 20,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 188,
                          height: 350,
                          margin: EdgeInsets.only(
                            left: 40,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Image.asset("assets/image/myv.png"),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Row(
                                    children: [
                                      Column(
                                        children: [
                                          SizedBox(
                                            height: 8,
                                          ),
                                          Row(
                                            children: [
                                              Container(
                                                width: 100,
                                                child: Text(
                                                  "Myvo Steker T Multi Lampu Colokan ...",
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.normal),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 8,
                                          ),
                                          Container(
                                            child: Text(
                                              "Rp 3.750",
                                              style: TextStyle(
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Container(
                                    height: 13,
                                    width: 25,
                                    color: merah1,
                                    child: Text(
                                      "44%",
                                      style:
                                          TextStyle(fontSize: 10, color: merah),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Container(
                                    child: Text(
                                      "1.090.000",
                                      style: TextStyle(
                                          fontSize: 10,
                                          color: Colors.grey,
                                          decoration:
                                              TextDecoration.lineThrough),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 7,
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Container(
                                      child: Image.asset(
                                          "assets/image/power.png")),
                                  Container(
                                    child: Text("Kab.Tengerang"),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Container(
                                    child:
                                        Image.asset("assets/image/Vector.png"),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Container(
                                    child: Text(
                                      "5.0",
                                      style: TextStyle(
                                        fontSize: 10,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Container(
                                    child: Text(
                                      "|",
                                      style: TextStyle(
                                        fontSize: 10,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Container(
                                    child: Text(
                                      "Terjual 76",
                                      style: TextStyle(
                                        fontSize: 10,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: 188,
                          height: 350,
                          margin: EdgeInsets.only(left: 30),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Image.asset("assets/image/pro.png"),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Row(
                                    children: [
                                      Column(
                                        children: [
                                          SizedBox(
                                            height: 8,
                                          ),
                                          Row(
                                            children: [
                                              Container(
                                                width: 100,
                                                child: Text(
                                                  "Logitech G PRO X SUPERLIGHT ...",
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 8,
                                          ),
                                          Container(
                                            child: Text(
                                              "Rp 609.000",
                                              style: TextStyle(
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Container(
                                    height: 13,
                                    width: 25,
                                    color: merah1,
                                    child: Text(
                                      "44%",
                                      style:
                                          TextStyle(fontSize: 10, color: merah),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Container(
                                    child: Text(
                                      "Rp 1.090.000",
                                      style: TextStyle(
                                          fontSize: 10,
                                          color: Colors.grey,
                                          decoration:
                                              TextDecoration.lineThrough),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 7,
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Container(
                                      child: Image.asset(
                                          "assets/image/power.png")),
                                  Container(
                                    child: Text("Kab.Bandung"),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Container(
                                    child:
                                        Image.asset("assets/image/Vector.png"),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Container(
                                    child: Text(
                                      "5.0",
                                      style: TextStyle(
                                        fontSize: 10,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Container(
                                    child: Text(
                                      "|",
                                      style: TextStyle(
                                        fontSize: 10,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Container(
                                    child: Text(
                                      "Terjual 1rb",
                                      style: TextStyle(
                                        fontSize: 10,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                FutureBuilder<QuerySnapshot<Object?>>(
                    future: produkController.getProduk(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        var produkData = snapshot.data!.docs;
                        // print(produkData.);

                        print(
                            "=========================================================");
                        return Container(
                            margin: EdgeInsets.only(top: 10),
                            width: lebar,

                            // decoration: BoxDecoration(color: Colors.red),
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 15),
                              // margin: EdgeInsets.fromLTRB(5, 0, right, bottom),
                              // margin: EdgeInsets.fromLTRB(left, top, right, bottom),
                              child: Wrap(
                                spacing: 0,
                                runSpacing: 0,
                                children:
                                    List.generate(produkData.length, (index) {
                                  return produk(
                                    lebar,
                                    lebar * 0.35,
                                    tinggi,
                                    namaP: (produkData[index].data()
                                        as Map<String, dynamic>)["namaP"],
                                    descP: (produkData[index].data()
                                        as Map<String, dynamic>)["descP"],
                                    diskonP: (produkData[index].data()
                                            as Map<String, dynamic>)["diskonP"]
                                        .toString(),
                                    gambarP: (produkData[index].data()
                                        as Map<String, dynamic>)["gambarP"],
                                    hargaP: (produkData[index].data()
                                            as Map<String, dynamic>)["hargaP"]
                                        .toString(),
                                    hargaFix: (produkData[index].data()
                                            as Map<String, dynamic>)["hargaFix"]
                                        .toString(),
                                  );
                                }),
                              ),
                            ));
                      } else {
                        return CircularProgressIndicator();
                      }
                    }),
                Container(
                  width: 360,
                  height: tinggi * 0.08,
                  margin: EdgeInsets.only(bottom: 30),
                  color: Colors.white,
                  child: TextButton(
                      onPressed: () => Get.toNamed(Routes.DETAIL),
                      child: Text("Lihat Selebihnya",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.black, fontSize: 18))),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Widget CustomMenu({icon, text}) {
  return Container(
    width: 65,
    child: Column(
      children: [
        Container(
          child: Image.asset(icon),
        ),
        Container(
          margin: EdgeInsets.only(top: 7),
          child: Text(
            text,
            textAlign: TextAlign.center,
          ),
        )
      ],
    ),
  );
}

Widget pilihan(lebar, warna, warna2, judul, warna3) {
  return Container(
    width: lebar * 0.3,
    height: 66,
    padding: EdgeInsets.all(12),
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
        width: 25,
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

Widget produk(lebar, double lebar2, tinggi,
    {gambarP, hargaP, diskonP, hargaFix, namaP, descP}) {
  return InkWell(
      onTap: () => Get.toNamed(Routes.DETAIL),
      child: Container(
          height: tinggi * 0.36,
          width: lebar2,
          margin: EdgeInsets.fromLTRB(0, 15, 12, 15),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: shadow,
                blurRadius: 8,
                offset: Offset(0, 4),
              )
            ],
          ),
          child: Column(
            children: [
              Container(
                width: lebar,
                height: tinggi * 0.19,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                  ),
                  image: DecorationImage(
                      image: NetworkImage(
                        gambarP,
                      ),
                      fit: BoxFit.cover),
                ),
              ),
              Container(
                width: lebar,
                height: tinggi * 0.163,
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(12),
                    bottomRight: Radius.circular(12),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      hargaP,
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: tinggi * 0.006,
                    ),
                    Row(
                      children: [
                        Container(
                          width: 60,
                          height: 20,
                          margin: EdgeInsets.only(right: 6),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(1),
                            color: bgCashback,
                          ),
                          child: Text(
                            'Cashback',
                            style: TextStyle(
                              color: bgNav,
                              fontWeight: FontWeight.w600,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: tinggi * 0.006,
                    ),
                    SizedBox(
                      height: tinggi * 0.011,
                    ),
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 3),
                          child: Icon(
                            IconlyBold.star,
                            color: star,
                            size: 14,
                          ),
                        ),
                        Text(
                          '4.8 | Terjual 312',
                          style: TextStyle(color: search, fontSize: 13),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          )));
}

// ignore_for_file: dead_code

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:tokopedia/config/warna.dart';
// import '../../../controllers/auth_controller_controller.dart';
import '../../../controllers/product_controller.dart';
import '../../../routes/app_pages.dart';
import '../controllers/detail_controller.dart';

class DetailView extends GetView<DetailController> {
  final listData = Get.arguments;

  //   final authController = Get.put(AuthControllerController());
  // final detailController = Get.put(DetailController());
  @override
  Widget build(BuildContext context) {
    final rumus = listData['diskonP'] * (listData['hargaP'] / 100);
    // ignore: unused_local_variable
    final hargaFix = listData['hargaP'] - rumus;
    double lebar = MediaQuery.of(context).size.width;
    double tinggi = MediaQuery.of(context).size.height;
    final produkController = Get.put(ProdukController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          // padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
          child: Column(
            children: [
              Container(
                height: tinggi * 0.10,
                decoration: BoxDecoration(color: Colors.white),
                // padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(IconlyLight.arrow_left, size: 24),
                    Container(
                      margin: EdgeInsets.only(right: 10),
                      width: lebar * 0.43,
                      height: 40,
                      child: TextField(
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.search),
                              fillColor: Colors.white,
                              filled: true,
                              labelText: "Cari ‘Parfume’ di To...",
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(10)))),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 10),
                      width: lebar * 0.4,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              Icons.share_rounded,
                              color: Colors.black,
                              size: 25,
                            ),
                            Image.asset(
                              "assets/image/shopping-cart_1.png",
                              color: Colors.black,
                            ),
                            Image.asset(
                              "assets/image/menu_1.png",
                              color: Colors.black,
                            )
                          ]),
                    ),
                  ],
                ),
              ),
              Container(
                  height: 400,
                  width: lebar * 0.8,
                  color: Colors.white,
                  // margin: EdgeInsets.symmetric(vertical: 20),
                  child: Image.network(
                    listData["gambarP"],
                    fit: BoxFit.contain,
                  )),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 60),
                    child: Text(listData["hargaP"].toString(),
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 250),
                    child: Image.asset(
                      "assets/image/heart.png",
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Container(
                    // width: 3,
                    margin: EdgeInsets.only(left: 40),
                    child: Text(listData["descP"].toString(),
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.normal)),
                  ),
                ],
              ),

              SizedBox(
                height: 20,
              ),
              Container(
                width: lebar,
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 15),
                        child: Text('Terjual 250+'),
                      ),
                      Container(
                        width: lebar * 0.25,
                        height: 35,
                        margin: EdgeInsets.only(right: 5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(width: 1, color: shadow)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(
                              IconlyBold.star,
                              color: star,
                              size: 18,
                            ),
                            Text(
                              '4.9 (320)',
                              style: TextStyle(color: subjudul2),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: lebar * 0.35,
                        height: 35,
                        margin: EdgeInsets.only(right: 5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(width: 1, color: shadow)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              'Foto Pembeli (50)',
                              style: TextStyle(color: subjudul2),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: lebar * 0.25,
                        height: 35,
                        margin: EdgeInsets.only(right: 5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(width: 1, color: shadow)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              'Diskusi (25)',
                              style: TextStyle(color: subjudul2),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 60),
                    child: Text("Detail Produk",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 60),
                    child: Text("Berat Satuan",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.normal)),
                  ),
                  Container(
                      margin: EdgeInsets.only(left: 150), child: Text("200 g")),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: 380,
                height: 1,
                color: Colors.grey,
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 60),
                    child: Text("Etalase",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.normal)),
                  ),
                  Container(
                      margin: EdgeInsets.only(left: 150),
                      child: Text(
                        "Mine Private Collection",
                        style: TextStyle(color: atas),
                      )),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: 380,
                height: 1,
                color: Colors.grey,
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 60),
                    child: Text("Deskripsi Produk",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Container(
                    width: lebar * 0.8,
                    margin: EdgeInsets.only(left: 60),
                    child: Text(
                        "Mine. ETHEREAL Eau De Parfum 50mi glass perfumebottle in hard box packaging • ETHEREA•Withfacets that highlight a side...",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500)),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Container(
                      margin: EdgeInsets.only(left: 50),
                      child: Text(
                        "Baca Selengkapnya",
                        style: TextStyle(color: atas),
                      )),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: 440,
                height: 1,
                color: Colors.grey,
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset('assets/image/ellips.png'),
                        SizedBox(
                          width: lebar * 0.015,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Image.asset('assets/image/mantap.png',
                                    width: 18),
                                Text(
                                  ' Mine. Parfumery',
                                  style: TextStyle(
                                      color: judul1,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16),
                                )
                              ],
                            ),
                            SizedBox(
                              height: tinggi * 0.01,
                            ),
                            RichText(
                              text: TextSpan(children: [
                                TextSpan(
                                  text: 'Online',
                                  style: TextStyle(color: subjudul3),
                                ),
                                TextSpan(
                                  text: ' 23 Jam lalu',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: subjudul3),
                                ),
                              ]),
                            ),
                            SizedBox(
                              height: tinggi * 0.006,
                            ),
                            Text('Kota Tangerang'),
                          ],
                        ),
                      ],
                    ),
                    Container(
                      width: lebar * 0.2,
                      height: 37,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(width: 1, color: bgNav)),
                      child: Text(
                        'Follow',
                        style: TextStyle(
                            color: bgNav,
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: tinggi * 0.025,
              ),
              pembatas(lebar),
              SizedBox(
                height: tinggi * 0.02,
              ),
              heading2('Pilihan Promo Hari Ini'),
              SizedBox(
                height: tinggi * 0.02,
              ),
              SizedBox(
                height: 15,
              ),
              // Container(
              //     padding: EdgeInsets.symmetric(horizontal: 15),
              //     height: tinggi * 0.47,
              //     child: SingleChildScrollView(
              //         scrollDirection: Axis.horizontal,
              //         child: FutureBuilder(
              //             future: produkController.getData(),
              //             builder: (context, snapshot) {
              //               if (snapshot.connectionState ==
              //                   ConnectionState.done) {
              //                 var listData = snapshot.data!.docs;
              //                 print("========================");
              //                 print(listData);
              //                 print("========================");
              //                 return Row(
              //                   children: List.generate(
              //                       listData.length,
              //                       (index) => produk(
              //                           lebar,
              //                           lebar * 0.42,
              //                           tinggi,
              //                           listData[index],
              //                           produkController)),
              //                 );
              //               } else {
              //                 return Center(
              //                   child: CircularProgressIndicator(),
              //                 );
              //               }
              //             }))),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 40),
                    child: Text("Lainnya di toko ini",
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
                height: 15,
              ),
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
                            left: 2,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Image.asset("assets/image/pink.png"),
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
                                                  "Mine. Perfumery FLORAISON ...",
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
                                              "Rp 370.000",
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
                                    height: 18,
                                    width: 45,
                                    color: atas2,
                                    child: Text(
                                      "Cashback",
                                      style:
                                          TextStyle(fontSize: 10, color: atas),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
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
                                    child: Text("Kab.Tangerang"),
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
                              Image.asset("assets/image/hijau.png"),
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
                                                  "Mine. Perfumery TATMI - 50ml ...",
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
                                              "Rp 450.000",
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
                                    height: 18,
                                    width: 45,
                                    color: atas2,
                                    child: Text(
                                      "Cashback",
                                      style:
                                          TextStyle(fontSize: 10, color: atas),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
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
                                    child: Text("Kab.Tangerang"),
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
                          width: 168,
                          height: 300,
                          margin: EdgeInsets.only(left: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Image.asset("assets/image/putih.png"),
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
                                                  "Mine. Perfumery LUCID DREA...",
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
                                              "Rp 370.000",
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
                                    height: 18,
                                    width: 45,
                                    color: atas2,
                                    child: Text(
                                      "Cashback",
                                      style:
                                          TextStyle(fontSize: 10, color: atas),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
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
              SizedBox(
                height: tinggi * 0.025,
              ),
              pembatas(lebar),
              SizedBox(
                height: tinggi * 0.02,
              ),
              heading2('Ulasan Pembali'),
              SizedBox(
                height: tinggi * 0.02,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  children: [
                    Icon(
                      IconlyBold.star,
                      color: star,
                      size: 20,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 7),
                      child: Text(
                        '4.9',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w600),
                      ),
                    ),
                    Text(
                      '320 rating ∙ 102 ulasan',
                      style: TextStyle(color: subjudul3),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: tinggi * 0.02,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    review('assets/image/review.png', ''),
                    review('assets/image/review1.png', ''),
                    review('assets/image/review2.png', ''),
                    review('assets/image/review3.png', ''),
                    review('assets/image/review4.png', '+61'),
                  ],
                ),
              ),
              SizedBox(
                height: tinggi * 0.02,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Divider(
                  thickness: 1,
                  color: shadow,
                ),
              ),
              SizedBox(
                height: tinggi * 0.02,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 12),
                      child: Image.asset('assets/image/orang.png'),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Zain Ekstrom Bothman',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 7,
                        ),
                        Text(
                          '31 ulasan lengkap ∙ 17 terbantu',
                          style: TextStyle(color: subjudul3),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: tinggi * 0.01,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  children: [
                    Row(
                      children: [
                        Icon(
                          IconlyBold.star,
                          color: star,
                          size: 15,
                        ),
                        Icon(
                          IconlyBold.star,
                          color: star,
                          size: 15,
                        ),
                        Icon(
                          IconlyBold.star,
                          color: star,
                          size: 15,
                        ),
                        Icon(
                          IconlyBold.star,
                          color: star,
                          size: 15,
                        ),
                        Icon(
                          IconlyBold.star,
                          color: star,
                          size: 15,
                        ),
                      ],
                    ),
                    Container(
                        margin: EdgeInsets.only(left: 7),
                        child: Text(
                          '10 bulan lalu',
                          style: TextStyle(color: subjudul3),
                        ))
                  ],
                ),
              ),
              SizedBox(
                height: tinggi * 0.01,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  'saya selalu tertarik dengan produk lokal, buat saya aroma nomor 2 karena subyektif, Kemasan nomor selanjutnya, tapi yang perlu di',
                  style: TextStyle(fontSize: 15),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Text(
                      'Baca Selengkapnya',
                      style: TextStyle(
                        color: bgNav,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: tinggi * 0.02,
              ),
              pembatas(lebar),
              SizedBox(
                height: tinggi * 0.02,
              ),
              heading2('Diskusi'),
              SizedBox(
                height: tinggi * 0.02,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  children: [
                    Image.asset('assets/image/orang2.png'),
                    Container(
                      padding: EdgeInsets.only(left: 12),
                      child: Row(
                        children: [
                          Text(
                            'Rayna Stanton',
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: judul1,
                                fontSize: 15),
                          ),
                          Text(
                            ' ∙ Apr 2022',
                            style: TextStyle(color: subjudul3),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: tinggi * 0.01,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  'hai! kira-kira kapan restock lagi? thanks in advance',
                  style: TextStyle(fontSize: 15),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Image.asset('assets/image/ellips.png'),
                        Container(
                            width: 30,
                            height: 15,
                            margin: EdgeInsets.only(left: 12),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              color: bgCashback,
                            ),
                            child: Text(
                              'Penjual',
                              style: TextStyle(
                                  color: bgNav, fontWeight: FontWeight.w600),
                            )),
                        Text(
                          '∙ Apr 2022',
                          style: TextStyle(color: subjudul3),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Halo kak, maaf banget yak karena kamu jadi nunggu saat ini kita masih out of stock ya ...',
                      style: TextStyle(color: judul1, fontSize: 14.3),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: tinggi * 0.02,
              ),
              pembatas(lebar),
              SizedBox(
                height: tinggi * 0.02,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  children: [
                    Container(
                      width: 20,
                      height: 20,
                      margin: EdgeInsets.only(right: 14),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        border: Border.all(width: 2, color: judul1),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Text(
                        '!',
                        style: TextStyle(
                            fontWeight: FontWeight.w600, color: judul1),
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          'Produk bermasalah? ',
                          style: TextStyle(color: judul1),
                        ),
                        Text(
                          'Laporkan',
                          style: TextStyle(
                            color: bgNav,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: tinggi * 0.02,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget detailProduk2(lebar, judul, subJudul) {
  return Container(
    width: lebar,
    padding: EdgeInsets.symmetric(horizontal: 15),
    child: Row(
      children: [
        Container(
          margin: EdgeInsets.only(right: 108),
          child: Text(
            judul,
            style: TextStyle(color: subjudul3, fontSize: 16),
          ),
        ),
        Text(
          subJudul,
          style: TextStyle(
              fontSize: 16, color: bgNav, fontWeight: FontWeight.w600),
        ),
      ],
    ),
  );
}

Widget heading(judul) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 15),
    child: Text(
      judul,
      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
    ),
  );
}

Widget heading2(judul) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 15),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          judul,
          style: TextStyle(
            color: judul1,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          'Lihat Semua',
          style: TextStyle(color: bgNav, fontWeight: FontWeight.w600),
        ),
      ],
    ),
  );
}

Widget pembatas(lebar) {
  return Container(
    width: lebar,
    height: 8,
    color: kotak2,
  );
}

Widget review(gambar, judul) {
  return Container(
    width: 60,
    height: 60,
    alignment: Alignment.center,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8),
      image: DecorationImage(image: AssetImage(gambar)),
    ),
    child: Text(
      judul,
      style: TextStyle(
          color: Colors.white, fontWeight: FontWeight.w700, fontSize: 16),
    ),
  );
}

Widget produk(lebar, double lebar2, tinggi, data, controller) {
  final rumus = (data.data() as Map<String, dynamic>)['diskonP'] *
      ((data.data() as Map<String, dynamic>)['hargaP'] / 100);
  final hargaFix = (data.data() as Map<String, dynamic>)['hargaP'] - rumus;
  return InkWell(
    onTap: () => Get.toNamed(Routes.DETAIL),
    child: Container(
      height: tinggi * 0.41,
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
            height: tinggi * 0.2,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
                image: DecorationImage(
                    image: NetworkImage(
                      (data.data() as Map<String, dynamic>)["gambarP"],
                    ),
                    fit: BoxFit.cover)),
          ),
          Container(
            width: lebar,
            height: tinggi * 0.21,
            padding: EdgeInsets.only(top: 10, right: 8, left: 8, bottom: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(12),
                bottomRight: Radius.circular(12),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: lebar,
                  child: Text(
                    "${(data.data() as Map<String, dynamic>)['nama']}",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: judul1),
                  ),
                ),
                SizedBox(
                  height: tinggi * 0.01,
                ),
                Text(
                  "Rp${hargaFix}00 ",
                  style: TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w600, color: judul1),
                ),
                SizedBox(
                  height: tinggi * 0.006,
                ),
                Row(
                  children: [
                    Container(
                      width: 36,
                      height: 20,
                      margin: EdgeInsets.only(right: 6),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(1),
                        color: bgDiskon,
                      ),
                      child: Text(
                        "${(data.data() as Map<String, dynamic>)['diskonPercent'].toString()}%",
                        style: TextStyle(
                            color: diskon,
                            fontWeight: FontWeight.w600,
                            fontSize: 12),
                      ),
                    ),
                    Text(
                      "Rp${(data.data() as Map<String, dynamic>)['harga'].toString()}.000",
                      style: TextStyle(
                          decoration: TextDecoration.lineThrough,
                          fontSize: 12,
                          color: search),
                    )
                  ],
                ),
                SizedBox(
                  height: tinggi * 0.007,
                ),
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 2),
                      child: Image.network(
                        (data.data() as Map<String, dynamic>)['statusToko'],
                        width: 15,
                      ),
                    ),
                    Text(
                      (data.data() as Map<String, dynamic>)['asalToko'],
                      style: TextStyle(
                        color: search,
                        fontSize: 14,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: tinggi * 0.012,
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
                      "${(data.data() as Map<String, dynamic>)['rating'].toString()} | Terjual ${(data.data() as Map<String, dynamic>)['terjual'].toString()}",
                      style: TextStyle(color: search, fontSize: 13),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

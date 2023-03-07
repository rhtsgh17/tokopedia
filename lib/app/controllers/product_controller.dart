import 'dart:html';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
// ignore: unused_import
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart'; // ignore: unused_import
// ignore: unused_import
import 'package:tokopedia/app/modules/sliderData/views/slider_data_view.dart';
import 'package:file_picker/file_picker.dart';
// ignore: unused_import
import "package:firebase_storage/firebase_storage.dart";
import '../routes/app_pages.dart';

class ProdukController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseStorage storage = FirebaseStorage.instance;
  String urls = "";
  // File? path;
  addData(String namaP, String gambarP, int hargaP, int diskonP, int hargaFix,
      String descP) async {
    CollectionReference slider = firestore.collection("produk");
    final sliderData = {
      "namaP": namaP,
      "gambarP": gambarP,
      "hargaP": hargaP,
      "diskonP": diskonP,
      "hargaFix": hargaFix,
      "descP": descP
    };

// Add a new document with a generated ID
    try {
      await slider.add(sliderData).then((DocumentReference doc) =>
          Get.defaultDialog(
              title: "Berhasil", middleText: "Berhasil menambahkan data"));
    } catch (err) {
      Get.defaultDialog(title: "Alert", middleText: "Gagal menambahkan data");
    }
  }

  Future<QuerySnapshot<Object?>> getProduk() async {
    CollectionReference produk = firestore.collection("produk");
    try {
      await produk.get().then((Event) {
        for (var doc in Event.docs) {
          Get.defaultDialog(
              title: "Berhasil", middleText: "Berhasil menambahkan data");
        }
        return Event;
      });
    } catch (err) {}
    return await produk.get();
  }

  updateData(String id, String namaP, int hargaP, int diskonP, int hargaFix,
      String descP, String gambarP) async {
    try {
      final produkData = {
        "namaP": namaP,
        "gambarP": gambarP,
        "hargaP": hargaP,
        "diskonP": diskonP,
        "hargaFix": hargaFix,
        "descP": descP
      };
      DocumentReference slider = firestore.collection('produk').doc(id);
      await slider.update(produkData);
      Get.defaultDialog(
          title: "Data Updated :)", middleText: 'data update success');
    } catch (e) {
      print(e);
      Get.defaultDialog(title: "Error", middleText: 'Failed to update data');
    }
  }

  deleteData(String id) async {
    Get.defaultDialog(
        title: "Are You Sure!",
        middleText: "delete this data ?",
        confirm: ElevatedButton(
            onPressed: () async {
              DocumentReference Slider = firestore.collection("slider").doc(id);
              await Slider.delete();
              // await FirebaseAuth.instance.signOut();
              Get.offAllNamed(Routes.SLIDER_DATA);
            },
            child: Text("Yes")),
        cancel: ElevatedButton(
            // style: ElevatedButton.styleFrom(shadowColor: Color(Colors.red)),
            onPressed: () => Get.back(),
            child: Text("No")));
    // try {
    //   DocumentReference Slider = firebaseStore.collection("slider").doc(id);
    //   await Slider.delete();
    //   Get.defaultDialog(title: "alert", middleText: "Berhasil MengDelete Data");
    // } catch (err) {
    //   Get.defaultDialog(title: "alert", middleText: "Gagal MengDelete Data");
    // }
  }

  addPhoto() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      // File file = File(result.files.single.path!);
      String namaFile = result.files.first.name;
      urls = namaFile;
      // path = file;

      try {
        // await storage.ref("${namaFile}").putFile(file);
        final data = await storage.ref("${namaFile}").getDownloadURL();

        return data;
      } catch (e) {
        Get.defaultDialog(title: "alert", middleText: "Gagal Mengupload File");
      }
    } else {
      print("tidak mengirim");
    }
  }

  filterData() async {
    final result = await firestore
        .collection("produk")
        // .where('hargaP', isGreaterThan: 100.000)
        // .orderBy('harga', descending: true)
        // .limit(5)
        // .limitToLast(5)
        .where('flashSale', isEqualTo: true)
        .get();
    print(result.docs.length);
    print("****************************");

    if (result.docs.length > 0) {
      result.docs.forEach((element) {
        print(element.data());
      });
    } else {
      print("objek tidak ada");
    }
  }

  Future<QuerySnapshot<Object?>> getDataDiskon() async {
    Query<Map<String, dynamic>> produk =
        firestore.collection("produk")
        .where('flashSale', isEqualTo: true);

    return await produk.get();
  }

  getData() {}
}

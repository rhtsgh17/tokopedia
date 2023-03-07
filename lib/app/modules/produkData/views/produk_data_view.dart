import 'package:flutter/material.dart';

import 'package:get/get.dart';

// ignore: unused_import
// import '../../sliderData/controllers/slider_data_controller.dart';
import '../controllers/produk_data_controller.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:iconly/iconly.dart';
import 'package:tokopedia/app/controllers/slider_controller.dart';
import 'package:tokopedia/app/routes/app_pages.dart';



class ProdukDataView extends GetView<ProdukDataController> {
  final controller = Get.put(ProdukDataController());
  final controllerSlider = Get.put(SliderController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<QuerySnapshot<Object?>>(
          future: controllerSlider.getData(),
          builder: (context, Snapshot) {
            if (Snapshot.connectionState == ConnectionState.done) {
              var listData = Snapshot.data!.docs;
              return ListView.builder(
                itemCount: listData.length,
                itemBuilder: (context, index) => Container(
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.black54.withOpacity(0.2),
                  ),
                  child: ListTile(
                    style: ListTileStyle.drawer,
                    onTap: () =>
                        Get.toNamed(Routes.UPDATE, arguments: listData[index]),
                    leading: Text(
                      (listData[index].data()
                          as Map<String, dynamic>)["gambarSlider"],
                    ),
                    title: Text((listData[index].data()
                        as Map<String, dynamic>)["ketSlider"]),
                    subtitle: Text(
                      (listData[index].data()
                              as Map<String, dynamic>)['aktifSlider']
                          .toString(),
                      style: TextStyle(
                          color: (listData[index].data()
                                  as Map<String, dynamic>)['aktifSlider']
                              ? Colors.green
                              : Colors.red),
                    ),
                    trailing: InkWell(
                      onTap: () =>
                          controllerSlider.deleteData(listData[index].id),
                      child: Icon(
                        IconlyLight.delete,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () => controllerSlider.addData(true, "Instagram",
            "https://png.pngtree.com/png-vector/20221018/ourmid/pngtree-instagram-icon-png-image_6315974.png"),
        child: Icon(Icons.add),
      ),
    );
  }
}


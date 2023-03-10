import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:tokopedia/app/controllers/slider_controller.dart';
import 'package:tokopedia/app/routes/app_pages.dart';

import '../controllers/slider_data_controller.dart';

class SliderDataView extends GetView<SliderDataController> {
  final controller = Get.put(SliderDataController());
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
                    title: Text((listData[index].data()
                        as Map<String, dynamic>)["gambarSlider"]),
                    subtitle: Text((listData[index].data()
                        as Map<String, dynamic>)['ketSlider']),
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
              // return Text("data");
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
      floatingActionButton: FloatingActionButton(
          onPressed: () => Get.toNamed(Routes.UPDATE),
          child: Icon(
            Icons.add,
          )),
    );
  }
}

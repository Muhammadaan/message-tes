import 'package:apptes/controller/list_message_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListMessageScreen extends StatelessWidget {
  final c = Get.put(ListMessageController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pesan"),
      ),
      body: Obx(() => SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(15),
              child: Container(
                  child: c.loading.value
                      ? Container(
                          child: Center(
                              child: CircularProgressIndicator(
                          strokeWidth: 1,
                        )))
                      : Column(
                          children: [
                            Text(
                              "Pesan Gambar - Tidak Ada Judul",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Column(
                                children: c.dataMessaga
                                    .where((e) =>
                                        e['attachment'] == 'image' &&
                                        e['body'] == null)
                                    .map((element) {
                              return listData(element);
                            }).toList()),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Pesan Gambar - From A",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Column(
                                children: c.dataMessaga
                                    .where((e) =>
                                        e['attachment'] == 'image' &&
                                        e['from'] == 'A')
                                    .map((element) {
                              return listData(element);
                            }).toList()),
                            Text(
                              "Pesan Gambar - From B",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Column(
                                children: c.dataMessaga
                                    .where((e) =>
                                        e['attachment'] == 'image' &&
                                        e['from'] == 'B')
                                    .map((element) {
                              return listData(element);
                            }).toList()),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Pesan Kontak",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Column(
                                children: c.dataMessaga
                                    .where((e) => e['attachment'] == 'contact')
                                    .map((element) {
                              return listData(element);
                            }).toList()),
                          ],
                        )),
            ),
          )),
    );
  }

  Widget listData(element) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
          border: Border.all(), borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            element['body'] ?? '-',
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(
            height: 10,
          ),
          Text(c.formatTimeStamp(int.parse(element['timestamp']))),
          Text("From : ${element['from']}")
        ],
      ),
    );
  }
}

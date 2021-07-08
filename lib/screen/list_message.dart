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
                          children: c.dataMessaga.map((element) {
                          return Container(
                            alignment: element['from'] == "A"
                                ? Alignment.centerRight
                                : Alignment.centerLeft,
                            child: Container(
                              padding: EdgeInsets.all(10),
                              margin: EdgeInsets.symmetric(vertical: 5),
                              decoration: BoxDecoration(
                                  color: element['from'] == "A"
                                      ? Colors.blue[200]
                                      : Colors.grey[200],
                                  borderRadius: BorderRadius.circular(5)),
                              child: Column(
                                crossAxisAlignment: element['from'] == "A"
                                    ? CrossAxisAlignment.end
                                    : CrossAxisAlignment.start,
                                children: [
                                  Text(element['body'] ?? "-"),
                                  Text(c.readTimestamp(
                                      int.parse(element['timestamp'])))
                                ],
                              ),
                            ),
                          );
                        }).toList())),
            ),
          )),
    );
  }
}

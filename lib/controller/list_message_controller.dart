import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ListMessageController extends GetxController {
  RxBool loading = true.obs;
  RxList dataMessaga = [].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    readJson();
  }

  Future readJson() async {
    final String response = await rootBundle.loadString('assets/data.json');
    final data = await json.decode(response);
    dataMessaga.value = data['data'];

    loading.value = false;
  }

  String formatTimeStamp(int timestamp) {
    var date = DateTime.fromMillisecondsSinceEpoch(timestamp);
    var formattedDate = DateFormat('MM dd, hh:mm a').format(date);

    return formattedDate;
  }
}

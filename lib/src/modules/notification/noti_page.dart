import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'noti_controller.dart';

class NotiPage extends GetView<NotiController> {
  NotiPage({Key? key}) : super(key: key);

 @override
  Widget build(BuildContext context) {
    return Center(child: Text("This is Notification Page"));
  }
}
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prototype_sample/controller/home/bookmark_controller.dart';

class BookmarkPage extends StatelessWidget {
  BookmarkPage({Key? key}) : super(key: key);
  final BookmarkPageController con = Get.put(BookmarkPageController());

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Bookmark"),
    );
  }
}

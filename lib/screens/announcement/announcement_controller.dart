// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:my_app/models/announcement.dart';
import 'package:my_app/screens/announcement/announcement_service.dart';

class AnnouncementController extends ChangeNotifier {
  List<Announcement> announcements = [];

  AnnouncementController();

  Future initialize() async {
    //โหลดข้อมูลทั้งหมด
    announcements = await AnnouncementService().getList();
    notifyListeners();
  }

  Future delete(String id) async {
    try {
      //ลบข้อมูล
      await AnnouncementService().deleteAnnouncement(id: id);

      //โหลดข้อมูลทั้งหมดอีกครั้ง
      announcements = await AnnouncementService().getList();
      notifyListeners();
    } on Exception catch (_) {
      rethrow;
    }
  }
}

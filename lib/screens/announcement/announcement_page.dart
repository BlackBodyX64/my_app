import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'announcement_controller.dart';

class AnnouncementPage extends StatefulWidget {
  const AnnouncementPage({super.key});

  @override
  State<AnnouncementPage> createState() => _AnnouncementPageState();
}

class _AnnouncementPageState extends State<AnnouncementPage> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future loadData() async {
    await context.read<AnnouncementController>().initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Announcement'),
      ),
      body: Consumer<AnnouncementController>(
        builder: (context, controller, child) {
          return Column(
            children: [
              ...List.generate(controller.announcements.length, (index) {
                final anm = controller.announcements[index];
                return Card(
                  child: ListTile(
                    title: Text(anm.title),
                    trailing: InkWell(
                      onTap: () async {
                        try {
                          await controller.delete(anm.id);
                          if (!mounted) return;

                          //mounted = true
                          // !mounted = false
                          if (!mounted) return; //หน้านี้ไม่อยู่แล้วหรือปิดไปแล้ว จะจบฟังก์ชันเลย

                          //ถ้าหน้านี้ยังอยู่หรือไม่ถูกปิด จะทำในวงเล็บ
                          if (mounted) {
                            //แสดงข้อความ "สำเร็จ"
                          }
                        } on Exception catch (e) {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text('ผิดพลาด'),
                                content: Text(e.toString()),
                              );
                            },
                          );
                        }
                      },
                      child: Icon(Icons.delete),
                    ),
                  ),
                );
              })
            ],
          );
        },
      ),
    );
  }
}
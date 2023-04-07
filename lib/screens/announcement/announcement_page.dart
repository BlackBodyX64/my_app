// ignore_for_file: prefer_const_constructors, prefer_interpolation_to_compose_strings

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
                        } on Exception catch (e) {
                          showDialog(context: context, builder: (context) {
                            return AlertDialog(title: Text('ผิดพลาด'),content: Text(e.toString()),);
                          },);
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

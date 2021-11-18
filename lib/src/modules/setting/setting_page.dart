import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:settings_ui/settings_ui.dart';
import 'setting_controller.dart';

class SettingPage extends GetView<SettingController> {
  SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool _a = true;
    return Center(child: SettingsList(
        sections: [
          SettingsSection(
            title: 'Section',
            tiles: [
              SettingsTile(
                title: 'Language',
                subtitle: 'English',
                leading: const Icon(Icons.language),
                onPressed: (BuildContext context) {},
              ),
              SettingsTile.switchTile(
                title: 'Use fingerprint',
                leading: Icon(Icons.fingerprint),
                switchValue: _a,
                onToggle: (bool value) {
                  _a = !_a;
                },
              ),
            ],
          ),
        ],
      ));
  }

}
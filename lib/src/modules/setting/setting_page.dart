import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:mobile_app/src/data/providers/storage_provider.dart';
import 'package:mobile_app/src/modules/changepassword/changepassword_page.dart';
import 'package:mobile_app/src/modules/login/login_signup_page.dart';
import 'package:settings_ui/settings_ui.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  bool _a = true;


  AppBar? projectAppBar() {
    return AppBar(
      title: const Text('Settings'),
      automaticallyImplyLeading: false,
      actionsIconTheme:
      IconThemeData(size: 30.0, color: Colors.white, opacity: 10.0),
      leading: GestureDetector(
        onTap: () {/* Write listener code here */},
        child: Icon(
          Icons.menu, // add custom icons also
        ),
      ),
      actions: <Widget>[
        Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () {},
              child: Icon(
                Icons.search,
                size: 26.0,
              ),
            )),
      ],
      backgroundColor: const Color(0xff2d5f79),

    );

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: projectAppBar(),
        body: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(image: AssetImage("assets/images/girl.jpg"), fit: BoxFit.cover),

            ),
            child: SettingsList(
                backgroundColor: Color(0xff2d5f79),
                sections: [
          SettingsSection(
            title: 'Settings',
            tiles: [
              SettingsTile(
                title: 'Language',
                subtitle: 'English',
                leading: const Icon(Icons.language),
                onPressed: (BuildContext context) {},

              ),
              SettingsTile.switchTile(
                switchActiveColor: Color(0xff2d5f79),
                title: 'Allow Notifications',
                leading: const Icon(Icons.notifications),
                switchValue: _a,
                onToggle: (bool value) {
                  setState(() {
                    _a = value;
                  });
                },
              ),
              SettingsTile(
                title: 'App Info',
                leading: const Icon(Icons.info),
                onPressed: (BuildContext context) {},
              ),
              SettingsTile(
                title: 'Change Password',
                leading: const Icon(Icons.lock),
                onPressed: (BuildContext context) {
                  Get.to(ChangePasswordPage(),
                  fullscreenDialog: true,
                  transition: Transition.cupertino,
                  duration: const Duration(seconds: 1));

                },

              ),
              SettingsTile(
                title: 'Logout',
                leading: const Icon(Icons.logout),
                onPressed: (BuildContext context) {
                  cleanLocalStorage();
                  Get.offAll(const LoginScreen(),
                      fullscreenDialog: true,
                      transition: Transition.cupertino,
                      duration: const Duration(seconds: 1));
                },
              ),
            ],
          )
        ])));
  }
}

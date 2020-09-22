import 'package:email_launcher/email_launcher.dart';
import 'package:flutter/material.dart';

class Cekmece extends StatelessWidget {
  void sendEmail() async {
    await EmailLauncher.launch(
      Email(
        to: ['scafereren@gmail.com'],
        cc: ['oguznokta@gmail.com'],
        subject: 'Dijital Kitap uygulaması bug bildirimi',
        body:
            'Bulduğunuz hatayı detaylı bir şekilde açıklayınız. Gerektiği yerlerde lütfen ekran görüntüsü ekleyiniz',
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 5,
      child: ListView(
        children: [
          DrawerHeader(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Dijital Kitap', style: TextStyle(fontSize: 25)),
            ),
            decoration: BoxDecoration(color: Colors.teal),
          ),
          FlatButton(
            onPressed: () => sendEmail(),
            child: Row(
              children: [
                Icon(Icons.bug_report),
                SizedBox(width: 10),
                Text('Bug Bildir'),
              ],
            ),
          ),
          FlatButton(
            onPressed: () => showAboutDialog(
              context: context,
              applicationName: 'Dijital Kitap',
              applicationVersion: '0.0.3',
              applicationIcon: Icon(Icons.book),
            ),
            child: Row(
              children: [
                Icon(Icons.more_horiz),
                SizedBox(width: 10),
                Text('Hakkında'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

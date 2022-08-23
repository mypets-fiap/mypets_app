import 'package:flutter/material.dart';
import 'package:mypets/app/pages/login_page.dart';

import '../../util/authentication.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: const Text('Welcome'),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          AuthenticationHelper()
              .signOut()
              .then((_) => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (contex) => LoginPage()),
                  ));
        },
        tooltip: 'Logout',
        child: Icon(Icons.logout),
      ),
    );
  }
}

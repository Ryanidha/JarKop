import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:jarkop_app/Pages/Loginscreen/loginScreen.dart';

class accountPage extends StatefulWidget {
  const accountPage({super.key});

  @override
  State<accountPage> createState() => _accountPageState();
}

class _accountPageState extends State<accountPage> {
  // final user = FirebaseAuth.instance.currentUser;

  final useremail = FirebaseAuth.instance.currentUser!.email;

  _signOut() async {
    await FirebaseAuth.instance.signOut().then((value) => Navigator.of(context)
        .pushReplacement(
            MaterialPageRoute(builder: (context) => loginScreen())));
  }

  merchantDetail(context) {
    Get.offAll(loginScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            Container(
                color: Colors.white,
                child: ListTile(
                  leading: Icon(
                    Icons.account_circle,
                    size: 70,
                  ),
                  title: Text(
                    'Kang dagang',
                    style: TextStyle(
                        fontSize: 24,
                        fontFamily: 'Noto Sans',
                        fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    '+62 1234567890\n${useremail}',
                    style: TextStyle(fontFamily: 'NotoSans', fontSize: 16),
                  ),
                  trailing: IconButton(
                      onPressed: () {
                        merchantDetail(context);
                      },
                      icon: Icon(Icons.edit)),
                  isThreeLine: true,
                )),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(left: 18, top: 10),
                  child: Text(
                    "Account",
                    style: TextStyle(
                        fontFamily: 'NotoSans',
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
            ListTile(
              title: Text(
                "Rewards",
                style: TextStyle(fontFamily: 'NotoSans', fontSize: 20),
              ),
              trailing: IconButton(
                onPressed: (() {}),
                icon: Icon(Icons.arrow_forward_ios),
              ),
            ),
            ListTile(
              title: Text(
                "Business Profile",
                style: TextStyle(fontFamily: 'NotoSans', fontSize: 20),
              ),
              trailing: IconButton(
                onPressed: (() {}),
                icon: Icon(Icons.arrow_forward_ios),
              ),
            ),
            ListTile(
              title: Text(
                "Notification",
                style: TextStyle(fontFamily: 'NotoSans', fontSize: 20),
              ),
              trailing: IconButton(
                onPressed: (() {}),
                icon: Icon(Icons.arrow_forward_ios),
              ),
            ),
            ListTile(
              title: Text(
                "Settings",
                style: TextStyle(fontFamily: 'NotoSans', fontSize: 20),
              ),
              trailing: IconButton(
                onPressed: (() {}),
                icon: Icon(Icons.arrow_forward_ios),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(left: 18, top: 20),
                  child: Text(
                    "General",
                    style: TextStyle(
                        fontFamily: 'NotoSans',
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
            ListTile(
              title: Text(
                "Help Center",
                style: TextStyle(fontFamily: 'NotoSans', fontSize: 20),
              ),
              trailing: IconButton(
                onPressed: (() {}),
                icon: Icon(Icons.arrow_forward_ios),
              ),
            ),
            ListTile(
              title: Text(
                "Feedback",
                style: TextStyle(fontFamily: 'NotoSans', fontSize: 20),
              ),
              trailing: IconButton(
                onPressed: (() {}),
                icon: Icon(Icons.arrow_forward_ios),
              ),
            ),
            ListTile(
              title: Text(
                "Rating",
                style: TextStyle(fontFamily: 'NotoSans', fontSize: 20),
              ),
              trailing: IconButton(
                onPressed: (() {}),
                icon: Icon(Icons.arrow_forward_ios),
              ),
            ),
            ListTile(
              title: Text(
                "Rewards",
                style: TextStyle(fontFamily: 'NotoSans', fontSize: 20),
              ),
              trailing: IconButton(
                onPressed: (() {}),
                icon: Icon(Icons.arrow_forward_ios),
              ),
            ),
            SizedBox(height: 20),
            Container(
              height: 50,
              width: 100,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextButton(
                onPressed: () {
                  _signOut();
                },
                child: const Text(
                  "Logout",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'NotoSans'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

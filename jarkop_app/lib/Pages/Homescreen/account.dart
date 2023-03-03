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
  merchantDetail(context) {
    Get.offAll(loginScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
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
                  '',
                  style: TextStyle(
                      fontSize: 24,
                      fontFamily: 'Noto Sans',
                      fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  '+62 1234567890\ne-mail@mail.com',
                  style: TextStyle(fontFamily: 'Noto Sans', fontSize: 16),
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
                      fontFamily: 'Noto Sans',
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
          ListTile(
            title: Text(
              "Rewards",
              style: TextStyle(fontFamily: 'Noto Sans', fontSize: 20),
            ),
            trailing: IconButton(
              onPressed: (() {}),
              icon: Icon(Icons.arrow_forward_ios),
            ),
          ),
          ListTile(
            title: Text(
              "Rewards",
              style: TextStyle(fontFamily: 'Noto Sans', fontSize: 20),
            ),
            trailing: IconButton(
              onPressed: (() {}),
              icon: Icon(Icons.arrow_forward_ios),
            ),
          ),
          ListTile(
            title: Text(
              "Rewards",
              style: TextStyle(fontFamily: 'Noto Sans', fontSize: 20),
            ),
            trailing: IconButton(
              onPressed: (() {}),
              icon: Icon(Icons.arrow_forward_ios),
            ),
          ),
          ListTile(
            title: Text(
              "Rewards",
              style: TextStyle(fontFamily: 'Noto Sans', fontSize: 20),
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
                padding: EdgeInsets.only(left: 18, top: 10),
                child: Text(
                  "General",
                  style: TextStyle(
                      fontFamily: 'Noto Sans',
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
          ListTile(
            title: Text(
              "Rewards",
              style: TextStyle(fontFamily: 'Noto Sans', fontSize: 20),
            ),
            trailing: IconButton(
              onPressed: (() {}),
              icon: Icon(Icons.arrow_forward_ios),
            ),
          ),
          ListTile(
            title: Text(
              "Rewards",
              style: TextStyle(fontFamily: 'Noto Sans', fontSize: 20),
            ),
            trailing: IconButton(
              onPressed: (() {}),
              icon: Icon(Icons.arrow_forward_ios),
            ),
          ),
          ListTile(
            title: Text(
              "Rewards",
              style: TextStyle(fontFamily: 'Noto Sans', fontSize: 20),
            ),
            trailing: IconButton(
              onPressed: (() {}),
              icon: Icon(Icons.arrow_forward_ios),
            ),
          ),
          ListTile(
            title: Text(
              "Rewards",
              style: TextStyle(fontFamily: 'Noto Sans', fontSize: 20),
            ),
            trailing: IconButton(
              onPressed: (() {}),
              icon: Icon(Icons.arrow_forward_ios),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:use_of_sentiment_analysis_in_citizen_participation/loginPage.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Center(
            child: Container(
              child: CircleAvatar(
                radius: 60,
                backgroundColor: Colors.blueGrey,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          ListTile(
            leading: Text("Full Name"),
            trailing: Text(
              "${FirebaseAuth.instance.currentUser!.displayName}",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ),
          ListTile(
            leading: Text("Email"),
            trailing: Text(
              "${FirebaseAuth.instance.currentUser!.email}",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => LoginPage()),
                  (Route<dynamic> route) => false);
            },
            child: ListTile(
              leading: Text("LogOut"),
              trailing: Icon(Icons.logout),
            ),
          )
        ],
      ),
    );
  }
}

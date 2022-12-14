import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 76, 150, 115),
        title: Center(child: Text('My Profile',style: GoogleFonts.laila(),)),
      ),
      body: Column(children: [
        CircleAvatar(child: Image.asset('carparking'),),
        ListTile(leading: Icon(Icons.person),
        title: Text('Name',style: TextStyle(color: Color.fromARGB(255, 66, 65, 65)),),
        subtitle: Text('Hisham'),
        trailing: Icon(Icons.edit),)
      ],),
    );
  }
}
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
        title: Text(
          'My Profile',
          style: GoogleFonts.laila(),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              radius: 70,
              backgroundImage: AssetImage('Assets/images/hisham3.jpg'),
            ),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text(
              'Name',
              style: TextStyle(color: Color.fromARGB(255, 66, 65, 65)),
            ),
            subtitle: Text('Hisham'),
            trailing: Icon(Icons.edit),
          ),
          ListTile(
            leading: Icon(Icons.mail),
            title: Text(
              'Email',
              style: TextStyle(color: Color.fromARGB(255, 66, 65, 65)),
            ),
            subtitle: Text('hisham079@gmail.com'),
            trailing: Icon(Icons.edit),
          ),
          ListTile(
            leading: Icon(Icons.phone),
            title: Text(
              'Phone No',
              style: TextStyle(color: Color.fromARGB(255, 66, 65, 65)),
            ),
            subtitle: Text('7034404247'),
            trailing: Icon(Icons.edit),
          )
        ],
      ),
    );
  }
}

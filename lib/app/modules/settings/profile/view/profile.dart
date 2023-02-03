import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final userref = FirebaseFirestore.instance.collection('usersdetails');
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 31, 73, 107),
        title: Text(
          'My Profile',
          style: GoogleFonts.laila(),
        ),
      ),
      body: StreamBuilder(
        stream: userref.doc(auth.currentUser!.uid).snapshots(),
        builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasData) {
            final cUser = snapshot.data;
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    radius: 70.r,
                    backgroundImage:
                        AssetImage('Assets/images/defaultimage.jpg'),
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.person),
                  title: Text(
                    'Name',
                    style: TextStyle(color: Color.fromARGB(255, 66, 65, 65)),
                  ),
                  subtitle: Text(cUser!['fName'].toString()),
                  trailing: Icon(Icons.edit),
                ),
                ListTile(
                  leading: Icon(Icons.mail),
                  title: Text(
                    'Email',
                    style: TextStyle(color: Color.fromARGB(255, 66, 65, 65)),
                  ),
                  subtitle: Text(cUser['email'].toString()),
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
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
  // Future<void> getImage() async {
  //   final _imagePicker = ImagePicker();
  //   try {
  //     final image = await _imagePicker.pickImage(source: ImageSource.gallery);
  //     await updateProfile(image!);
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  // Future<void> updateProfile(XFile image) async {
  //   final reference =
  //       FirebaseStorage.instance.ref().child('profileImages').child(image.name);
  //   final file = File(image.path);
  //   await reference.putFile(file);
  //   final imageLink = await reference.getDownloadURL();
  //   await .doc(auth.currentUser!.uid).update({'profileImage': imageLink});

  //   print(imageLink);
  // }

}

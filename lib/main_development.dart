// Copyright (c) 2022, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:parking/app/app.dart';
import 'package:parking/bootstrap.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized(); //to connect
  await Firebase.initializeApp();
  bootstrap(() =>  App());
}

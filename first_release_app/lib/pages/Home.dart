import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_release_app/pages/EntireNumber.dart';
import 'package:first_release_app/pages/DeleteHome.dart';
import 'package:first_release_app/pages/SelectNumber.dart';
import 'package:first_release_app/pages/real_home.dart';
import 'package:flutter/material.dart';

import 'login.dart';

class Main extends StatelessWidget {
  const Main({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (_,AsyncSnapshot<User?> user){
          if(user.hasData){
            return const RealHome();
          }
          else {
            return const login();
          }
    }
    );
}}

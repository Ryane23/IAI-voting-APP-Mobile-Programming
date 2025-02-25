import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'principal.dart';
import 'auths/login.dart';
import 'auths/register.dart';
import 'welcome.dart';
import 'dashboard/index.dart';
import 'dashboard/create_candidate.dart';
import 'dashboard/view_candidate.dart';
import 'dart:io';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Future<bool> hasInternet() async{
    try{
      var result = await InternetAddress.lookup('google.com');
      if(result.isNotEmpty){
        return true;
      }else{return false;}
    }catch(e){return false;}

  }
  if(kIsWeb){
    // if(await hasInternet()){
      Firebase.initializeApp(options: const FirebaseOptions(
        apiKey: "AIzaSyCe97GZd5DI9A5h5zDKM249XFZMMhCmv6w",
        authDomain: "votingapp-15f72.firebaseapp.com",
        projectId: "votingapp-15f72",
        storageBucket: "votingapp-15f72.firebasestorage.app",
        messagingSenderId: "818970097765",
        appId: "1:818970097765:web:11636e557ce7b9815c6e8c",
        measurementId: "G-JJGZEEZ91B"));
    // }
  }else{
    // if(await hasInternet()) {
      await Firebase.initializeApp();
    // }
  }

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title:'IAI Student Committee President voting app',
      theme:ThemeData(fontFamily:'DejaVuSans' ),
      initialRoute: Welcome.id,
      routes:{
        Welcome.id:(context)=>Welcome(),
        Principal.id:(context)=>Principal(),
        // Authentication routes
        Login.id:(context)=>Login(),
        Register.id:(context)=>Register(),
        // Dashboard routes
        Index.id:(context)=>Index(),
        ViewCandidate.id:(context)=>ViewCandidate(),
        CreateCandidate.id:(context)=>CreateCandidate(),

      }
    )
  );
}



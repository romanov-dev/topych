import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyCINsoF4yNcOKRCwoalyJwRzXpaQ0eN43I",
            authDomain: "topic-romanov.firebaseapp.com",
            projectId: "topic-romanov",
            storageBucket: "topic-romanov.firebasestorage.app",
            messagingSenderId: "732669686611",
            appId: "1:732669686611:web:e27e3a1d02a03cc063e7a6"));
  } else {
    await Firebase.initializeApp();
  }
}

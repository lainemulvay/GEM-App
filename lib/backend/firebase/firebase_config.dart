import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyDEEKADYkXH5p0mJVOc7_6zK2wMyvfNDdE",
            authDomain: "gem-app-4bec5.firebaseapp.com",
            projectId: "gem-app-4bec5",
            storageBucket: "gem-app-4bec5.appspot.com",
            messagingSenderId: "392126538137",
            appId: "1:392126538137:web:94a1187697a0dcec3db308",
            measurementId: "G-B882LPNDF8"));
  } else {
    await Firebase.initializeApp();
  }
}

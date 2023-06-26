import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:bhaktiyoga_ios/ram/home/home.dart';
import 'package:bhaktiyoga_ios/ram/login/circular_progress.dart';
import 'package:bhaktiyoga_ios/ram/login/google_login.dart';
import 'package:bhaktiyoga_ios/ram/signup/signup.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class AuthService {
  handleAuthState() {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (BuildContext context, snapshot) {
        if (snapshot.hasData) {
          final User? user = FirebaseAuth.instance.currentUser;
          if (user != null) {
            return FutureBuilder(
              future: FirebaseFirestore.instance
                  .collection('Users')
                  .doc(user.email)
                  .get(),
              builder: (BuildContext context,
                  AsyncSnapshot<DocumentSnapshot> snapshot) {
                if (snapshot.hasData) {
                  final userData = snapshot.data;
                  if (userData != null && userData.exists) {
                    // If user data exists, show the HomeScreen
                    return HomeScreen();
                  } else {
                    // If user data does not exist, show the UserDetailsPage
                    return SignUp();
                  }
                } else {
                  // If snapshot does not have data, show a progress indicator
                  return CircularProgress();
                }
              },
            );
          }
        }
        // If there is no data, show the LoginPage
        return LoginPage();
      },
    );
  }

  signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser =
        await GoogleSignIn(scopes: <String>["email"]).signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  Future<UserCredential> signInWithApple() async {
    // Check if Sign in with Apple is available on the device
    final isAvailable = await SignInWithApple.isAvailable();

    if (!isAvailable) {
      throw FirebaseAuthException(
        code: 'ERROR_MISSING_SIGN_IN_WITH_APPLE',
        message: 'Sign in with Apple is not available on this device.',
      );
    }

    // Start the authentication flow
    final credentials = await SignInWithApple.getAppleIDCredential(
      scopes: [
        AppleIDAuthorizationScopes.email,
        AppleIDAuthorizationScopes.fullName,
      ],
    );

    // Create a new Firebase credential with the Apple ID credential
    final oauthCredential = OAuthProvider("apple.com").credential(
      idToken: String.fromCharCodes(credentials.identityToken as Iterable<int>),
      accessToken:
          String.fromCharCodes(credentials.authorizationCode as Iterable<int>),
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(oauthCredential);
  }

  signOut() {
    FirebaseAuth.instance.signOut();
  }
}

// for ios



// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:bhaktiyoga_ios/ram/home/home.dart';
// import 'package:bhaktiyoga_ios/ram/login/circular_progress.dart';
// import 'package:bhaktiyoga_ios/ram/login/google_login.dart';
// import 'package:bhaktiyoga_ios/ram/signup/signup.dart';
// import 'package:sign_in_with_apple/sign_in_with_apple.dart';

// class AuthService {
//   handleAuthState() {
//     return StreamBuilder(
//       stream: FirebaseAuth.instance.authStateChanges(),
//       builder: (BuildContext context, snapshot) {
//         if (snapshot.hasData) {
//           final User? user = FirebaseAuth.instance.currentUser;
//           if (user != null) {
//             return HomeScreen();
//           } else {
//             CircularProgressIndicator();
//           }
//         }
//         // If there is no data, show the LoginPage
//         return LoginPage();
//       },
//     );
//   }

//   signInWithGoogle() async {
//     // Trigger the authentication flow
//     final GoogleSignInAccount? googleUser =
//         await GoogleSignIn(scopes: <String>["email"]).signIn();

//     // Obtain the auth details from the request
//     final GoogleSignInAuthentication googleAuth =
//         await googleUser!.authentication;

//     // Create a new credential
//     final credential = GoogleAuthProvider.credential(
//       accessToken: googleAuth.accessToken,
//       idToken: googleAuth.idToken,
//     );

//     // Once signed in, return the UserCredential
//     return await FirebaseAuth.instance.signInWithCredential(credential);
//   }

//   Future<UserCredential> signInWithApple() async {
//     User? _user;
//     // Check if Sign in with Apple is available on the device
//     final isAvailable = await SignInWithApple.isAvailable();

//     if (!isAvailable) {
//       Fluttertoast.showToast(msg: "Sign in with Apple is not available.");
//       throw FirebaseAuthException(
//         code: 'ERROR_MISSING_SIGN_IN_WITH_APPLE',
//         message: 'Sign in with Apple is not available on this device.',
//       );
//     }

//     // Start the authentication flow
//     final appleResult = await SignInWithApple.getAppleIDCredential(
//       scopes: [
//         AppleIDAuthorizationScopes.email,
//         AppleIDAuthorizationScopes.fullName,
//       ],
//     );
//     print(AppleIDAuthorizationScopes.email);
//     // Create a new Firebase credential with the Apple ID credential

//     final AuthCredential credential = OAuthProvider('apple.com').credential(
//       accessToken:
//           String.fromCharCodes(appleResult.authorizationCode.codeUnits),
//       idToken: String.fromCharCodes(appleResult.identityToken!.codeUnits),
//     );

//     // Once signed in, return the UserCredential
//     return await FirebaseAuth.instance.signInWithCredential(credential);
//   }

//   signOut() {
//     FirebaseAuth.instance.signOut();
//   }
// }

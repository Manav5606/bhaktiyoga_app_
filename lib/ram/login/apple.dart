import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class SignInWithAppleScreen extends StatefulWidget {
  @override
  _SignInWithAppleScreenState createState() => _SignInWithAppleScreenState();
}

class _SignInWithAppleScreenState extends State<SignInWithAppleScreen> {
  bool _isBusy = false;

  Future<UserCredential> _signInWithApple() async {
    setState(() {
      _isBusy = true;
    });

    final credentials = await SignInWithApple.getAppleIDCredential(
      scopes: [
        AppleIDAuthorizationScopes.email,
        AppleIDAuthorizationScopes.fullName,
      ],
    );

    final oauthCredential = OAuthProvider("apple.com").credential(
      idToken: String.fromCharCodes(credentials.identityToken as Iterable<int>),
      accessToken: String.fromCharCodes(credentials.authorizationCode as Iterable<int>),
    );

    return await FirebaseAuth.instance.signInWithCredential(oauthCredential);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign In with Apple'),
      ),
      body: Center(
        child: _isBusy
            ? CircularProgressIndicator()
            : SignInButton(
                Buttons.AppleDark,
                onPressed: _signInWithApple,
                text: "Sign In with Apple",
              ),
      ),
    );
  }
}

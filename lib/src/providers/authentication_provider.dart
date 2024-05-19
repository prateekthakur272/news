import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:news/src/repositories/authentication_repository.dart';

class AuthenticationProvider extends ChangeNotifier{
  User? currentUser;
  UserCredential? credentials;
  final AuthenticationRepository _authenticationRepository;

  AuthenticationProvider(
      AuthenticationRepository authenticationRepository)
      : _authenticationRepository = authenticationRepository;

  void listenUser(){
    _authenticationRepository.userStream.listen((user) {
        currentUser = user;
        notifyListeners();
    });
  }

  Future<void> signIn(String email, String password) async {
    credentials = await _authenticationRepository.signIn(email, password);
    notifyListeners();
  }

  Future<void> signInWithGoogle() async {
    credentials = await _authenticationRepository.signInWithGoogle();
    notifyListeners();
  }

  Future<void> resetPassword(String email) async {
    await _authenticationRepository.resetPasswordByEmail(email);
  }

  Future<void> signUp(String email, String password) async {
    credentials = await _authenticationRepository.signUp(email, password);
  }

  Future<void> signOut() async {
    await _authenticationRepository.signOut();
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_crud/ui/screens/auth/auth.dart';

class RootScreen extends StatelessWidget {
  const RootScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: AuthScreen(),
    );
  }
}

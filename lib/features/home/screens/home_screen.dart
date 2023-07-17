import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../provider/user_provider.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/home';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    print(user.toJson());

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Text(
          'user data from db and jwt token from server \n\n "jwt_token: "  ${user.token}\n\n'
          ' "email"  : ${user.email}\n\n'
          '"name": ${user.name}',
          style: const TextStyle(fontSize: 22),
        ),
      ),
    );
  }
}

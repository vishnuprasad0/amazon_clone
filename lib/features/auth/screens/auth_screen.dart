import 'package:amazon_clone/common/widgets/custombotton.dart';
import 'package:amazon_clone/common/widgets/customtextfield.dart';
import 'package:amazon_clone/constants/global_variables.dart';
import 'package:flutter/material.dart';

enum Auth { signin, signup }

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});
  static const routeName = '/auth-screen';

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  Auth _auth = Auth.signup;
  final _signUpFormKey = GlobalKey<FormState>();
  final _signInFormKey = GlobalKey<FormState>();
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();
  final TextEditingController _namecontroller = TextEditingController();

  @override
  void dispose() {
    _emailcontroller.dispose();
    _passwordcontroller.dispose();
    _namecontroller.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: GlobalVariables.greyBackgroundColor,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  ' Welcome',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                ),
                ListTile(
                  tileColor: _auth == Auth.signup
                      ? GlobalVariables.backgroundColor
                      : GlobalVariables.greyBackgroundColor,
                  leading: Radio(
                    value: Auth.signup,
                    groupValue: _auth,
                    onChanged: (Auth? val) {
                      setState(() {
                        _auth = val!;
                      });
                    },
                  ),
                  title: const Text(
                    'Create Account',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  onTap: () {},
                ),
                if (_auth == Auth.signup)
                  Container(
                    color: Colors.white,
                    padding: const EdgeInsets.all(15),
                    child: Form(
                      key: _signUpFormKey,
                      child: Column(
                        children: [
                          CustomTextField(
                              controller: _namecontroller, hintText: 'Name'),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomTextField(
                              controller: _emailcontroller, hintText: 'Email'),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomTextField(
                              controller: _passwordcontroller,
                              hintText: 'Password'),
                          const SizedBox(height: 10),
                          CustomButton(
                            text: 'Sigh Up',
                            color: GlobalVariables.secondaryColor,
                            onTap: () {
                              if (_signUpFormKey.currentState!.validate()) {}
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ListTile(
                  tileColor: _auth == Auth.signin
                      ? GlobalVariables.backgroundColor
                      : GlobalVariables.greyBackgroundColor,
                  leading: Radio(
                    value: Auth.signin,
                    groupValue: _auth,
                    onChanged: (Auth? val) {
                      setState(() {
                        _auth = val!;
                      });
                    },
                  ),
                  title: const Text(
                    'Sign In',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  onTap: () {},
                ),
                if (_auth == Auth.signin)
                  Container(
                      padding: const EdgeInsets.all(8),
                      color: GlobalVariables.backgroundColor,
                      child: Form(
                          child: Column(
                        children: [
                          CustomTextField(
                              controller: _emailcontroller, hintText: 'Email'),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomTextField(
                              controller: _passwordcontroller,
                              hintText: 'Password'),
                          const SizedBox(height: 10),
                          CustomButton(
                            text: 'Sigh In',
                            color: GlobalVariables.secondaryColor,
                            onTap: () {
                              if (_signUpFormKey.currentState!.validate()) {}
                            },
                          ),
                        ],
                      )))
              ],
            ),
          ),
        ));
  }
}

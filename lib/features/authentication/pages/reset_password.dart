import 'package:flutter/material.dart';

import '../../../core/constants/contants.dart';
import '../../../core/themes/theme_colors.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({
    Key? key,
  }) : super(key: key);
  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final TextEditingController _email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: const Text('Password Reset'),
      ),
      body: ListView(
        children: <Widget>[
          const SizedBox(
            height: 100,
          ),
          Container(
            padding: const EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
            child: Column(
              children: <Widget>[
                const Text(
                  'Enter the email address associated with your account to reset your password',
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  // padding: EdgeInsets.symmetric(horizontal: 15),
                  decoration: BoxDecoration(
                    color: ThemeColors.whiteColor,
                    borderRadius: BorderRadius.circular(2.5),
                    boxShadow: const [
                      BoxShadow(
                        blurRadius: 7.5,
                        offset: Offset(0.0, 2.5),
                        color: ThemeColors.shadowColor,
                      )
                    ],
                  ),
                  width: double.infinity,
                  // width: double.infinity,
                  // height: 40.0,
                  child: TextFormField(
                    style: const TextStyle(fontSize: 20),
                    controller: _email,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    textInputAction: TextInputAction.newline,
                    obscureText: false,
                    keyboardType: TextInputType.emailAddress,
                    textCapitalization: TextCapitalization.none,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Email',
                      contentPadding: EdgeInsets.symmetric(horizontal: 10),
                    ),
                  ),
                ),
                const SizedBox(height: 40.0),
                SizedBox(
                  height: 40.0,
                  child: Material(
                    borderRadius: BorderRadius.circular(20.0),
                    shadowColor: Colors.pinkAccent,
                    color: Colors.pink,
                    elevation: 7.0,
                    child: GestureDetector(
                        onTap: () async {
                          if (validateEmail(_email.text)) {}
                        },
                        child: const Center(
                            child: Text(
                          'RESET PASSWORD',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white),
                        ))),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 15.0),
        ],
      ),
    );
  }
}

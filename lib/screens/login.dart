import 'package:cleaning_app/consts/colors.dart';
import 'package:cleaning_app/controllers/user_controller.dart';
import 'package:cleaning_app/screens/register.dart';
import 'package:cleaning_app/services/authentication.dart';
import 'package:cleaning_app/shared/input_decoration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String email = '';
  String password = '';
  String error = '';
  bool signIn = true;
  bool loading = false;
  final AuthService _auth = AuthService();
  final UserController userController = Get.put(UserController());
  final _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: loading
            ? const CircularProgressIndicator()
            : SizedBox(
                width: size.width * 0.8,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Form(
                      key: _key,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            'assets/app_logo.svg',
                            height: MediaQuery.of(context).size.height * 0.5,
                          ),
                          TextFormField(
                            decoration: textinputDecoration.copyWith(
                              prefixIcon: const Icon(
                                Icons.email_outlined,
                                color: primaryColor,
                              ),
                              hintText: 'Email',
                            ),
                            validator: (val) =>
                                val.isEmpty ? 'Please enter your email' : null,
                            onChanged: (val) => setState(() => email = val),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            obscureText: true,
                            decoration: textinputDecoration.copyWith(
                              prefixIcon: const Icon(
                                Icons.lock_outline,
                                color: primaryColor,
                              ),
                              hintText: 'Password',
                            ),
                            validator: (val) => val.length < 6
                                ? 'Please enter a password +6 char long'
                                : null,
                            onChanged: (val) => setState(() => password = val),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          ElevatedButton(
                              style: ButtonStyle(
                                  foregroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.white),
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          primaryColor),
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ))),
                              child: Container(
                                alignment: Alignment.center,
                                width: double.infinity,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                child: const Text(
                                  'Log in',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16),
                                ),
                              ),
                              onPressed: () async {
                                signIn = true;

                                if (_key.currentState.validate()) {
                                  setState(() {
                                    loading = true;
                                  });
                                  dynamic result =
                                      await _auth.signInWithEmailAndPassword(
                                          email, password);
                                  userController.chef.uid = _auth.uid;

                                  if (result == null) {
                                    setState(() {
                                      signIn = false;
                                      loading = false;
                                      error =
                                          'Please verify your information';
                                    });
                                  }
                                }
                              }),
                          signIn
                              ? const SizedBox()
                              : Column(
                                children: [
                                  const SizedBox(height: 20,),
                                  Text(
                                      error,
                                      style: const TextStyle(color: Colors.red),
                                    ),
                                ],
                              ),
                          const SizedBox(height: 20,),
                          GestureDetector(
                            onTap: (){
                              Get.to(()=>Register());
                            },
                            child: Center(
                              child: RichText(
                                  text: const TextSpan(children: [
                                TextSpan(
                                  text: 'Dont have an account ? ',style: TextStyle(color: Colors.black,fontSize: 16)
                                ),
                                TextSpan(
                                    text: 'Sign up',
                                    style: TextStyle(color: primaryColor,fontSize: 16)),
                              ])),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}

import 'package:cleaning_app/consts/colors.dart';
import 'package:cleaning_app/controllers/user_controller.dart';
import 'package:cleaning_app/screens/home.dart';
import 'package:cleaning_app/screens/intro.dart';
import 'package:cleaning_app/services/authentication.dart';
import 'package:cleaning_app/shared/input_decoration.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController firstName =  TextEditingController();
  TextEditingController lastName =  TextEditingController();
  TextEditingController email =  TextEditingController();
  TextEditingController password =  TextEditingController();
  TextEditingController password2 =  TextEditingController();
  TextEditingController phoneNumber =  TextEditingController();
  TextEditingController adress =  TextEditingController();
  bool loading = false;
  final _key = GlobalKey<FormState>();
  final AuthService _auth = AuthService();
  final UserController userController = Get.put(UserController());





  @override
  void dispose() {
    firstName.dispose();
    lastName.dispose();
    email.dispose();
    password.dispose();
    password2.dispose();
    phoneNumber.dispose();
    adress.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Register',
          style: TextStyle(color: primaryColor, fontSize: 22),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: primaryColor,
            size: 30,
          ),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Center(
          child: loading ? const CircularProgressIndicator() : SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            child: Form(
              key: _key,
              child: Column(
                children: [
                  const SizedBox(height: 20,),
                 // const Text('Please fill in the fields bellow',style: TextStyle(fontSize: 30),),
                  const SizedBox(height: 20,),
                  TextFormField(
                    controller: firstName,
                    decoration: textinputDecoration.copyWith(
                      labelText: 'First name',
                      labelStyle: const TextStyle(color: primaryColor),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                    ),
                    validator: (val) =>
                    val.isEmpty ? 'Please enter your first name' : null,
                  ),
                  const SizedBox(height: 20,),

                  TextFormField(
                    controller: lastName,
                    decoration: textinputDecoration.copyWith(
                      labelText: 'Last name',
                      labelStyle: const TextStyle(color: primaryColor),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                    ),
                    validator: (val) =>
                    val.isEmpty ? 'Please enter your last name' : null,
                  ),
                  const SizedBox(height: 20,),

                  TextFormField(
                    controller: email,
                    decoration: textinputDecoration.copyWith(
                      labelText: 'Email',
                      labelStyle: const TextStyle(color: primaryColor),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                    ),
                    validator: (val) =>
                        val.isEmpty ? 'Please enter your email' : null,
                  ),
                  const SizedBox(height: 20,),

                  TextFormField(
                    controller: password,
                    obscureText: true,
                    decoration: textinputDecoration.copyWith(
                      labelText: 'Password',
                      labelStyle: const TextStyle(color: primaryColor),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                    ),
                    validator: (val) =>
                    val.isEmpty ? 'Please enter your password' : null,
                  ),
                  const SizedBox(height: 20,),


                  TextFormField(
                    controller: password2,
                    obscureText: true,
                    decoration: textinputDecoration.copyWith(
                      labelText: 'Confirm your password',
                      labelStyle: const TextStyle(color: primaryColor),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                    ),
                    validator: (val) =>
                    password.text != password2.text ? 'Please confirm your password' : null,
                  ),
                  const SizedBox(height: 20,),


                  TextFormField(
                    controller: phoneNumber,
                    decoration: textinputDecoration.copyWith(
                      labelText: 'Phone number',
                      labelStyle: const TextStyle(color: primaryColor),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                    ),
                    validator: (val) =>
                    val.isEmpty ? 'Please enter your phone number' : null,
                  ),
                  const SizedBox(height: 20,),

                  TextFormField(
                    controller: adress,
                    decoration: textinputDecoration.copyWith(
                      labelText: 'Adress',
                      labelStyle: const TextStyle(color: primaryColor),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                    ),
                    validator: (val) =>
                    val.isEmpty ? 'Please enter your adress' : null,
                  ),
                  const SizedBox(height: 20,),

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
                          'Register',
                          style: TextStyle(
                              color: Colors.white, fontSize: 16),
                        ),
                      ),
                      onPressed: () async {

                        if (_key.currentState.validate()) {
                          setState(() {
                            loading = true;
                          });
                          dynamic result =
                          await _auth.registerWithEmailAndPassword(
                              email.text, password.text,firstName.text,lastName.text,phoneNumber.text,adress.text);
                          userController.chef.uid = _auth.uid;


                            setState(() {
                              loading = false;

                            });

                          Get.to(()=>Intro());
                        }
                      }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:cleaning_app/consts/colors.dart';
import 'package:cleaning_app/controllers/user_controller.dart';
import 'package:cleaning_app/models/user_data.dart';
import 'package:cleaning_app/screens/ordering_form.dart';
import 'package:cleaning_app/screens/service_descriptim/clean_floor.dart';
import 'package:cleaning_app/screens/service_descriptim/clean_window.dart';
import 'package:cleaning_app/screens/service_descriptim/wash_clothes.dart';
import 'package:cleaning_app/screens/type_descripton/home_description.dart';
import 'package:cleaning_app/screens/type_descripton/office_descripton.dart';
import 'package:cleaning_app/services/authentication.dart';
import 'package:cleaning_app/services/data_base.dart';
import 'package:cleaning_app/shared/drawer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'service_descriptim/clean_carpets.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final AuthService _auth = AuthService();
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  String uid;

  void getData() async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User user = auth.currentUser;
    uid = user.uid;
  }

  @override
  void initState() {
    getData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: StreamBuilder<UserData>(
          stream: DataBaseController(uid: uid).chefData,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Scaffold(
                backgroundColor: lightGrey,
                key: _key,
                drawer: MainDrawer(
                  firstName: snapshot.data.firstName,
                  lastName: snapshot.data.lastName,
                ),
                body: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                                onTap: () {
                                  _key.currentState.openDrawer();
                                },
                                child: Image.asset(
                                  'assets/menu (1).png',
                                  height: 40,
                                  width: 40,
                                )),
                            CircleAvatar(
                              radius: 30,
                              backgroundColor: Colors.transparent,
                              child: Center(
                                child: SvgPicture.asset(
                                  'assets/app_logo.svg',
                                ),
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            const Text(
                              'Hi ',
                              style: TextStyle(fontSize: 34),
                            ),
                            Text(
                              snapshot.data.firstName,
                              style: const TextStyle(
                                  fontSize: 34,
                                  color: primaryColor,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        const Text(
                          'What services do you need ?',
                          style: TextStyle(fontSize: 34),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: ElevatedButton(
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
                                  'Order now',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16),
                                ),
                              ),
                              onPressed: () {
                                Get.to(() => OrderingForm());
                              }),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          'Types',
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  Get.to(() => HomeDescription());
                                },
                                child: Container(
                                  padding: EdgeInsets.all(20),
                                  width:
                                      MediaQuery.of(context).size.width * 0.4,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      //  border: Border.all(color: primaryColor,width: 5),
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Column(
                                    children: [
                                      Image.asset(
                                        'assets/maison-web.png',
                                        height: 70,
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        'Home',
                                        style: TextStyle(fontSize: 20),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  Get.to(() => OfficeDescription());
                                },
                                child: Container(
                                  padding: EdgeInsets.all(20),
                                  width:
                                      MediaQuery.of(context).size.width * 0.4,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      //  border: Border.all(color: primaryColor,width: 5),
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Column(
                                    children: [
                                      Image.asset(
                                        'assets/office-desk.png',
                                        height: 70,
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        'Office',
                                        style: TextStyle(fontSize: 20),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          'Services',
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  Get.to(() => CleanFloorDescription());
                                },
                                child: Container(
                                  padding: EdgeInsets.all(20),
                                  height:
                                      MediaQuery.of(context).size.height * 0.25,
                                  width:
                                      MediaQuery.of(context).size.width * 0.4,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      //  border: Border.all(color: primaryColor,width: 5),
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Column(
                                    children: [
                                      Expanded(
                                          child: SvgPicture.asset(
                                              'assets/clean_floor.svg')),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Text(
                                        'Clean   floor',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(fontSize: 20),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  Get.to(() => CleanWindowDescription());
                                },
                                child: Container(
                                  padding: EdgeInsets.all(20),
                                  height:
                                      MediaQuery.of(context).size.height * 0.25,
                                  width:
                                      MediaQuery.of(context).size.width * 0.4,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      //  border: Border.all(color: primaryColor,width: 5),
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Column(
                                    children: [
                                      Expanded(
                                          child: SvgPicture.asset(
                                              'assets/clean_1.svg')),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Text(
                                        'Clean window',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(fontSize: 20),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  Get.to(() => WashClothes());
                                },
                                child: Container(
                                  padding: EdgeInsets.all(20),
                                  height:
                                      MediaQuery.of(context).size.height * 0.25,
                                  width:
                                      MediaQuery.of(context).size.width * 0.4,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      //  border: Border.all(color: primaryColor,width: 5),
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Column(
                                    children: [
                                      Expanded(
                                          child: SvgPicture.asset(
                                              'assets/wash_clothes.svg')),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Text(
                                        'Wash clothes',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(fontSize: 20),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  Get.to(() => CleanCarpetsDescription());
                                },
                                child: Container(
                                  padding: EdgeInsets.all(20),
                                  height:
                                      MediaQuery.of(context).size.height * 0.25,
                                  width:
                                      MediaQuery.of(context).size.width * 0.4,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      //  border: Border.all(color: primaryColor,width: 5),
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Column(
                                    children: [
                                      Expanded(
                                          child: SvgPicture.asset(
                                              'assets/clean_carpets.svg')),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Text(
                                        'Clean carpets',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(fontSize: 20),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              );
            } else {
              return const Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }
          }),
    );
  }
}

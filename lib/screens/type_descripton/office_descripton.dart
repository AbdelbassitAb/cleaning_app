import 'package:cleaning_app/consts/colors.dart';
import 'package:cleaning_app/screens/service_descriptim/clean_floor.dart';
import 'package:cleaning_app/screens/service_descriptim/clean_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';




class OfficeDescription extends StatefulWidget {
  @override
  _OfficeDescriptionState createState() => _OfficeDescriptionState();
}

class _OfficeDescriptionState extends State<OfficeDescription> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(

          body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          onPressed: () {
                            Get.back();
                          },
                          icon: const Icon(
                            Icons.arrow_back,
                            size: 30,
                            color: primaryColor,
                          )),
                      const SizedBox()
                    ],
                  ),
                  const Text(
                    'Office type',
                    style: TextStyle(fontSize: 34,fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(height: 20,),
                  Center(
                    child: Container(
                        height: MediaQuery.of(context).size.height * 0.3,
                        child: Image.asset('assets/office-desk.png')),
                  ),
                  const SizedBox(height: 20,),
                  Center(
                    child: SizedBox(
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
                          onPressed: () {}),
                    ),
                  ),
                  const SizedBox(height: 20,),
                  const Text(
                    'Available Services',
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
                          onTap: (){
                            Get.to(()=>CleanFloorDescription());
                          },
                          child: Container(
                            padding: EdgeInsets.all(20),
                            height:
                            MediaQuery.of(context).size.height * 0.25,
                            width: MediaQuery.of(context).size.width * 0.4,
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
                                  'Clean \nfloor',
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
                          onTap: (){
                            Get.to(()=>CleanWindowDescription());
                          },
                          child: Container(
                            padding: EdgeInsets.all(20),
                            height:
                            MediaQuery.of(context).size.height * 0.25,
                            width: MediaQuery.of(context).size.width * 0.4,
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


                ],
              ),
            ),
          ),
        ));
  }
}

import 'package:cleaning_app/consts/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CleanFloorDescription extends StatefulWidget {
  @override
  _CleanFloorDescriptionState createState() => _CleanFloorDescriptionState();
}

class _CleanFloorDescriptionState extends State<CleanFloorDescription> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
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
                'Cleaning floor service',
                style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: SvgPicture.asset(
                  'assets/clean_floor.svg',
                  height: MediaQuery.of(context).size.height * 0.3,
                  width: MediaQuery.of(context).size.width * 0.3,

                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: ElevatedButton(
                      style: ButtonStyle(
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                          backgroundColor:
                              MaterialStateProperty.all<Color>(primaryColor),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
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
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                      onPressed: () {}),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Available in',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      Image.asset('assets/maison-web.png',height: 30,width: 30,),
                      const SizedBox(width: 20,),
                      Image.asset('assets/office-desk.png',height: 30,width: 30,),
                      const SizedBox(width: 20,)
                    ],
                  ),

                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Pricing',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: const [
                   SizedBox(
                    width: 20,
                  ),
                  Text('1 Room',style: TextStyle(fontSize: 24,),),
                  Expanded(
                    child: SizedBox(

                    ),
                  ),
                  Text('10 \$',style: TextStyle(fontSize: 24,),),
                   SizedBox(
                    width: 20,
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: const [
                   SizedBox(
                    width: 20,
                  ),
                  Text('1 square meter',style: TextStyle(fontSize: 24,),),
                  Expanded(
                    child: SizedBox(

                    ),
                  ),
                  Text('2 \$',style: TextStyle(fontSize: 24,),),
                   SizedBox(
                    width: 20,
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

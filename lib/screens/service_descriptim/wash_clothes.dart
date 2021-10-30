import 'package:cleaning_app/consts/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class WashClothes extends StatefulWidget {
  @override
  _WashClothesState createState() => _WashClothesState();
}

class _WashClothesState extends State<WashClothes> {
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
                    'Washing clothes service',
                    style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: SvgPicture.asset(
                      'assets/wash_clothes.svg',
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
                      Text('1 t-shirt',style: TextStyle(fontSize: 24,),),
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
                  Row(
                    children: const [
                      SizedBox(
                        width: 20,
                      ),
                      Text('1 pants',style: TextStyle(fontSize: 24,),),
                      Expanded(
                        child: SizedBox(

                        ),
                      ),
                      Text('3 \$',style: TextStyle(fontSize: 24,),),
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
                      Text('1 shoe',style: TextStyle(fontSize: 24,),),
                      Expanded(
                        child: SizedBox(

                        ),
                      ),
                      Text('4 \$',style: TextStyle(fontSize: 24,),),
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

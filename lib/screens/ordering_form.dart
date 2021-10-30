import 'package:cleaning_app/consts/colors.dart';
import 'package:cleaning_app/screens/done_screen.dart';
import 'package:cleaning_app/shared/default_button.dart';
import 'package:cleaning_app/shared/default_radio_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum Types { home, office, test }
enum Services { cleanFloor, cleanWindows, cleanCarpets, washClothes, test }

class OrderingForm extends StatefulWidget {
  @override
  _OrderingFormState createState() => _OrderingFormState();
}

class _OrderingFormState extends State<OrderingForm> {
  Types type = Types.home;

  var services = List<Services>.filled(4, Services.test, growable: false);

  int index = 0;
  int nbrWindows = 0;
  int rooms = 0;
  int squareMeters = 0;
  int nbrCarpets = 0;
  int nbrTshirt = 0;
  int nbrPants = 0;
  int nbrShoes = 0;

  DateTime selectedDate = DateTime.now();
  _selectDate(BuildContext context, String errFormat, String errInvalid) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1930),
      lastDate: selectedDate,
      errorFormatText: errFormat,
      errorInvalidText: errInvalid,
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }


  @override
  Widget build(BuildContext context) {
    List<String> titles = [
      'Choose type of services',
      'Choose services',
      'Select Date',
    ];

    Widget chooseTypes() => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            defaultRadioCard(
                value: Types.home,
                onTap: () {
                  setState(() {
                    if (type == Types.home) {
                      type = Types.test;
                    } else {
                      type = Types.home;
                    }
                  });
                },
                text: 'Home',
                image: 'assets/maison-web.png',
                type: true,
                selected: type == Types.home),
            const SizedBox(
              height: 20,
            ),
            defaultRadioCard(
                value: Types.office,
                onTap: () {
                  setState(() {
                    if (type == Types.office) {
                      type = Types.test;
                    } else {
                      type = Types.office;
                    }
                  });
                },
                text: 'Office',
                image: 'assets/office-desk.png',
                type: true,
                selected: type == Types.office),
          ],
        );

    Widget chooseServices() => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            defaultRadioCard(
                value: Services.cleanFloor,
                onTap: () {
                  setState(() {
                    if (services[0] == Services.cleanFloor) {
                      services[0] = Services.test;
                    } else {
                      services[0] = Services.cleanFloor;
                    }
                  });
                },
                text: 'Clean\nfloor',
                image: 'assets/clean_floor.svg',
                type: false,
                selected: services[0] == Services.cleanFloor,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(
                          width: 20,
                        ),
                        const Text(
                          'Pricing',
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        const Expanded(child: SizedBox()),
                        Text(
                          '${rooms * 10 + squareMeters * 2} \$',
                          style: const TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        const SizedBox(
                          width: 20,
                        ),
                        Text(
                          '${rooms} Rooms',
                          style: const TextStyle(
                            fontSize: 24,
                          ),
                        ),
                        const Expanded(
                          child: SizedBox(),
                        ),
                        Row(
                          children: [
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    if (rooms > 0) rooms--;
                                  });
                                },
                                icon: Icon(Icons.arrow_left)),
                            Text(
                              '${rooms * 10} \$',
                              style: const TextStyle(
                                fontSize: 24,
                              ),
                            ),
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    rooms++;
                                  });
                                },
                                icon: Icon(Icons.arrow_right)),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        const SizedBox(
                          width: 20,
                        ),
                        Text(
                          '${squareMeters}  meters',
                          style: const TextStyle(
                            fontSize: 24,
                          ),
                        ),
                        const Expanded(
                          child: SizedBox(),
                        ),
                        Row(
                          children: [
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    if (squareMeters > 0) squareMeters--;
                                  });
                                },
                                icon: Icon(Icons.arrow_left)),
                            Text(
                              '${squareMeters * 2} \$',
                              style: const TextStyle(
                                fontSize: 24,
                              ),
                            ),
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    squareMeters++;
                                  });
                                },
                                icon: Icon(Icons.arrow_right)),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                )),
            const SizedBox(
              height: 20,
            ),
            if (type == Types.home)
              defaultRadioCard(
                  value: Services.cleanCarpets,
                  onTap: () {
                    setState(() {
                      if (services[1] == Services.cleanCarpets) {
                        services[1] = Services.test;
                      } else {
                        services[1] = Services.cleanCarpets;
                      }
                    });
                  },
                  text: 'Clean\ncarpets',
                  image: 'assets/clean_carpets.svg',
                  type: false,
                  selected: services[1] == Services.cleanCarpets,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const SizedBox(
                            width: 20,
                          ),
                          const Text(
                            'Pricing',
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                          const Expanded(child: SizedBox()),
                          Text(
                            '${nbrCarpets * 5} \$',
                            style: const TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          const SizedBox(
                            width: 20,
                          ),
                          Text(
                            '${nbrCarpets} Carpet',
                            style: const TextStyle(
                              fontSize: 24,
                            ),
                          ),
                          const Expanded(
                            child: SizedBox(),
                          ),
                          Row(
                            children: [
                              IconButton(
                                  onPressed: () {
                                    setState(() {
                                      if (nbrCarpets > 0) nbrCarpets--;
                                    });
                                  },
                                  icon: Icon(Icons.arrow_left)),
                              Text(
                                '${nbrCarpets * 5} \$',
                                style: const TextStyle(
                                  fontSize: 24,
                                ),
                              ),
                              IconButton(
                                  onPressed: () {
                                    setState(() {
                                      nbrCarpets++;
                                    });
                                  },
                                  icon: Icon(Icons.arrow_right)),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  )),
            const SizedBox(
              height: 20,
            ),
            defaultRadioCard(
                value: Services.cleanWindows,
                onTap: () {
                  setState(() {
                    if (services[2] == Services.cleanWindows) {
                      services[2] = Services.test;
                    } else {
                      services[2] = Services.cleanWindows;
                    }
                  });
                },
                text: 'Clean\nwindows',
                image: 'assets/clean_1.svg',
                type: false,
                selected: services[2] == Services.cleanWindows,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(
                          width: 20,
                        ),
                        const Text(
                          'Pricing',
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        const Expanded(child: SizedBox()),
                        Text(
                          '${nbrWindows * 5} \$',
                          style: const TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        const SizedBox(
                          width: 20,
                        ),
                        Text(
                          '${nbrWindows} Window',
                          style: const TextStyle(
                            fontSize: 24,
                          ),
                        ),
                        const Expanded(
                          child: SizedBox(),
                        ),
                        Row(
                          children: [
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    if (nbrWindows > 0) nbrWindows--;
                                  });
                                },
                                icon: Icon(Icons.arrow_left)),
                            Text(
                              '${nbrWindows * 5} \$',
                              style: const TextStyle(
                                fontSize: 24,
                              ),
                            ),
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    nbrWindows++;
                                  });
                                },
                                icon: Icon(Icons.arrow_right)),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                )),
            const SizedBox(
              height: 20,
            ),
            if (type == Types.home)
              defaultRadioCard(
                  value: Services.washClothes,
                  onTap: () {
                    setState(() {
                      if (services[3] == Services.washClothes) {
                        services[3] = Services.test;
                      } else {
                        services[3] = Services.washClothes;
                      }
                    });
                  },
                  text: 'Wash\nclothes',
                  image: 'assets/wash_clothes.svg',
                  type: false,
                  selected: services[3] == Services.washClothes,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const SizedBox(
                            width: 20,
                          ),
                          const Text(
                            'Pricing',
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                          const Expanded(child: SizedBox()),
                          Text(
                            '${nbrTshirt * 2 + nbrPants * 3 + nbrShoes * 4} \$',
                            style: const TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          const SizedBox(
                            width: 20,
                          ),
                          Text(
                            '${nbrTshirt} T-shirt',
                            style: const TextStyle(
                              fontSize: 24,
                            ),
                          ),
                          const Expanded(
                            child: SizedBox(),
                          ),
                          Row(
                            children: [
                              IconButton(
                                  onPressed: () {
                                    setState(() {
                                      if (nbrTshirt > 0) nbrTshirt--;
                                    });
                                  },
                                  icon: Icon(Icons.arrow_left)),
                              Text(
                                '${nbrTshirt * 2} \$',
                                style: const TextStyle(
                                  fontSize: 24,
                                ),
                              ),
                              IconButton(
                                  onPressed: () {
                                    setState(() {
                                      nbrTshirt++;
                                    });
                                  },
                                  icon: Icon(Icons.arrow_right)),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          const SizedBox(
                            width: 20,
                          ),
                          Text(
                            '${nbrPants} pants',
                            style: const TextStyle(
                              fontSize: 24,
                            ),
                          ),
                          const Expanded(
                            child: SizedBox(),
                          ),
                          Row(
                            children: [
                              IconButton(
                                  onPressed: () {
                                    setState(() {
                                      if (nbrPants > 0) nbrPants--;
                                    });
                                  },
                                  icon: Icon(Icons.arrow_left)),
                              Text(
                                '${nbrPants * 3} \$',
                                style: const TextStyle(
                                  fontSize: 24,
                                ),
                              ),
                              IconButton(
                                  onPressed: () {
                                    setState(() {
                                      nbrPants++;
                                    });
                                  },
                                  icon: Icon(Icons.arrow_right)),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          const SizedBox(
                            width: 20,
                          ),
                          Text(
                            '${nbrShoes} Shoes',
                            style: const TextStyle(
                              fontSize: 24,
                            ),
                          ),
                          const Expanded(
                            child: SizedBox(),
                          ),
                          Row(
                            children: [
                              IconButton(
                                  onPressed: () {
                                    setState(() {
                                      if (nbrShoes > 0) nbrShoes--;
                                    });
                                  },
                                  icon: Icon(Icons.arrow_left)),
                              Text(
                                '${nbrShoes * 4} \$',
                                style: const TextStyle(
                                  fontSize: 24,
                                ),
                              ),
                              IconButton(
                                  onPressed: () {
                                    setState(() {
                                      nbrShoes++;
                                    });
                                  },
                                  icon: Icon(Icons.arrow_right)),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  )),
            const SizedBox(
              height: 20,
            ),
          ],
        );

    Widget selectDate() => Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
          color: Colors.grey.shade500,
        ),
      ),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
              child: Text(
                "Select day : " +
                    "${selectedDate.toLocal()}".split(' ')[0],
                style: const TextStyle(
                    fontSize:
                    20),
              ),
            ),
            IconButton(
                onPressed: () => _selectDate(
                    context,
                    'error formated text',
                    'error invalid text'),
                icon: const Icon(Icons.calendar_today,
                    color: primaryColor)),
          ]),
      height: MediaQuery.of(context).size.height / 15,
    );

    List<Widget> corps = [
      chooseTypes(),
      chooseServices(),
      selectDate(),
    ];

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  titles[index],
                  style: const TextStyle(fontSize: 34),
                ),
                const SizedBox(
                  height: 20,
                ),
                corps[index],
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: defaultButton(
                        reversed: true,
                        onPressed: () {
                          setState(() {
                            if (index > 0) {
                              index--;
                            } else {
                              Get.back();
                            }
                          });
                        },
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      flex: 2,
                      child: defaultButton(
                          onPressed: () {
                            setState(() {
                              if (index < 2) {
                                index++;
                              } else {
                                Get.to(() => DoneScreen());
                              }
                            });
                          },
                          price:
                              '${rooms * 10 + squareMeters * 2 + nbrWindows * 5 + nbrShoes * 4 + nbrPants * 3 + nbrTshirt * 2 + nbrCarpets * 5} \$',
                          text: index == 2 ? 'Validate' : 'Next'),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

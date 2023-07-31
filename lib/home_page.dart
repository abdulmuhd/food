import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:food/about_page.dart';
import 'package:food/user_model.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final List<dynamic> result;

  Future<List<UserModel>> getProducts() async {
    const url = 'https://pastebin.com/raw/X9qwc0tJ';

    final response = await http.get(
      Uri.parse(url),
    );

    if (response.statusCode == 200) {
      final List<dynamic> result = json.decode(response.body);

      return result.map((e) => UserModel.fromJson(e)).toList();
    } else {
      throw Exception('failed to load data');
    }
  }

  var currentPosition = 0;
  List<dynamic> data = [
    "Airtime",
    "Data",
    "Betting",
    "TV",
    "Electricity",
    "Internet",
    "School",
    "More"
  ];
  List<dynamic> icons = [
    Icons.wifi,
    Icons.phone_iphone_outlined,
    Icons.sports_basketball,
    Icons.tv_sharp,
    Icons.electric_bolt,
    Icons.bar_chart,
    Icons.school,
    Icons.arrow_forward,
  ];

  Future<bool> _onBackedPresssed(BuildContext context) async {
    return await showDialog(
        context: context,
        builder: (builder) {
          return AlertDialog(
            title: const Text('warning'),
            content: const Text('Do you want to exit?'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
                child: const Text('Yes'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
                child: const Text('No'),
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => _onBackedPresssed(context),
      child: Scaffold(
        backgroundColor: const Color(0xffefebeb),
        body: Padding(
          padding: const EdgeInsets.all(2.0),
          child: ListView(
            physics: const AlwaysScrollableScrollPhysics(),
            children: [
              Container(
                margin: const EdgeInsets.all(10.0),
                padding: const EdgeInsets.all(10.0),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(15.0),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Musa Adam',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.lightGreen[200],
                          child: const Icon(Icons.record_voice_over),
                        ),
                        const SizedBox(width: 20),
                        CircleAvatar(
                          backgroundColor: Colors.lightGreen[200],
                          child: const Icon(Icons.notification_add),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Container(
                height: 150,
                margin: const EdgeInsets.all(10.0),
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: Colors.green[500],
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                ),
                child: Table(
                  children: [
                    const TableRow(children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Adamu Labaran',
                            style:
                                TextStyle(fontSize: 15.0, color: Colors.white),
                          )
                        ],
                      )
                    ]),
                    const TableRow(children: [SizedBox(height: 15.0)]),
                    const TableRow(children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Rolex Bank',
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      )
                    ]),
                    const TableRow(children: [SizedBox(height: 15.0)]),
                    TableRow(children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '\$345.0',
                            style: GoogleFonts.lato(
                              textStyle: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          ElevatedButton.icon(
                            onPressed: () {
                              Navigator.of(context)
                                  .push(MaterialPageRoute(builder: (context) {
                                return const AboutPage();
                              }));
                            },
                            icon: const Icon(
                              Icons.add,
                              color: Colors.green,
                            ),
                            label: const Text(
                              'Fund Wallet',
                              style: TextStyle(color: Colors.green),
                            ),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                elevation: 0,
                                shape: const StadiumBorder()),
                          )
                        ],
                      )
                    ])
                  ],
                ),
              ),
              //add banner here
              Container(
                margin: const EdgeInsets.all(10.0),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                ),
                child: Stack(
                  alignment: Alignment.centerLeft,
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.grey[200],
                        child: const Icon(Icons.card_giftcard_rounded),
                      ),
                      title: const Text(
                        'Earn \$300 Bonus',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: const Text('Get your Pay Me Acc collection'),
                    ),
                    Positioned(
                      top: 0,
                      right: 0,
                      child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 4, vertical: 1),
                          decoration: const BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10.0),
                            ),
                          ),
                          child: const Icon(Icons.close)),
                    )
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10.0),
                decoration: const BoxDecoration(
                  color: Color(0xffffffff),
                  borderRadius: BorderRadius.all(
                    Radius.circular(15.0),
                  ),
                ),
                child: GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4),
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(
                            backgroundColor:
                                Colors.greenAccent.withOpacity(0.5),
                            child: Icon(
                              icons[index],
                              color: Colors.green,
                            )),
                        const SizedBox(height: 10.0),
                        Text(
                          data[index] as String,
                          style: GoogleFonts.habibi(
                            textStyle: const TextStyle(fontSize: 12.0),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.all(10.0),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                ),
                child: ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return const ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Icon(Icons.phone_in_talk),
                        ),
                        title: Text(
                          'Refer & Earn',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text('Earn \$800 Cashback per referral'),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const Divider();
                    },
                    itemCount: 1),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

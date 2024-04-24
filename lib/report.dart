import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:report/transactioncards.dart';

class ReportWidget extends StatelessWidget {
  const ReportWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFB6BDC8),
      body: SafeArea(
        top: true,
        child: Align(
          alignment: Alignment.center,
          child: Container(
            width: MediaQuery.of(context).size.width * 0.9,
            height: MediaQuery.of(context).size.height * 0.9,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: const [
                BoxShadow(
                  blurRadius: 5,
                  color: Color(0xFF42E5CA),
                  offset: Offset(
                    0,
                    2,
                  ),
                )
              ],
              borderRadius: BorderRadius.circular(40),
            ),
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Icon(
                          Icons.arrow_back_rounded,
                          color: Color(0xFF57636C),
                          size: 30,
                        ),
                        Expanded(
                          child: Text(
                            'Report',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Icon(
                          Icons.keyboard_control,
                          color: Color(0xFF57636C),
                          size: 30,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 15),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.35,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/bkimg.jpg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Stack(
                        children: [
                          Center(
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width *
                                  0.6, // Adjusted width to center the PieChart
                              height: MediaQuery.of(context).size.height *
                                  0.35,
                              child: PieChart(
                                PieChartData(
                                  sections: [
                                    PieChartSectionData(
                                      color: const Color(0xFF42E5CA),
                                      value: 50,
                                      title: 'Inflow',
                                      titleStyle: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                      radius: 40,
                                    ),
                                    PieChartSectionData(
                                      color: const Color(0xFFFA7D0A),
                                      value: 20,
                                      title: 'Outflow',
                                      titleStyle: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                      radius: 40,
                                    ),
                                  ],
                                  centerSpaceRadius: 70,
                                  sectionsSpace: 0,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            top: MediaQuery.of(context).size.height *
                                0.35 /
                                2 -
                                30, // Adjusted top position to center vertically
                            left: 0,
                            right: 0,
                            child: Center(
                              // Centered horizontally within the parent container
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Balance',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 13,
                                    ),
                                  ),
                                  Text(
                                    '₹45896',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  Row(
                    children: [
                      Text(
                        'History',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                          color: Colors.black,
                        ),
                      ),
                      Spacer(),
                      Text(
                        'This Month',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w300,
                          color: Color(0xFF57636C),
                        ),
                      ),
                      SizedBox(width: 5),
                      Icon(
                        Icons.keyboard_arrow_down,
                        color: Color(0xFF57636C),
                        size: 25,
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  Expanded(
                    child: ListView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      itemCount: 20,
                      itemBuilder: (BuildContext context, int index) {
                        String title = 'Transaction ${index + 1}';
                        String description = 'Description ${index + 1}';
                        String amount =
                            '${Random().nextBool() ? '+' : '-'} ₹${Random().nextInt(100) + 1}';

                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5.0),
                          child: TransactionWidget(
                            title: title,
                            description: description,
                            amount: amount,
                            imageUrl:
                                'https://cdn.pixabay.com/photo/2024/04/13/04/56/rupee-8693195_1280.png',
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:movieapp/views/ticket/calender_day.dart';
import 'package:movieapp/views/ticket/seat.dart';
import 'package:movieapp/views/ticket/showtime.dart';

import 'const.dart';

class NewBooking extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.grey[900]!.withOpacity(0.5),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 15.0, left: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width * .12,
                      height: MediaQuery.of(context).size.width * .12,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white54, width: .5),
                          borderRadius: BorderRadius.circular(15.0)),
                      child: IconButton(
                          icon: Icon(
                            Icons.keyboard_arrow_left,
                            size: 28.0,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          }),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 21.0, left: 24, bottom: 11),
                child: Container(
                  height: 90,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          bottomLeft: Radius.circular(15))),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: <Widget>[
                        CalendarDay(
                          isActive: false,
                          dayAbbreviation: 'TH',
                          dayNumber: '9',
                        ),
                        CalendarDay(
                          isActive: false,
                          dayAbbreviation: 'FR',
                          dayNumber: '10',
                        ),
                        CalendarDay(
                          isActive: false,
                          dayAbbreviation: 'SA',
                          dayNumber: '12',
                        ),
                        CalendarDay(
                          isActive: true,
                          dayAbbreviation: 'SU',
                          dayNumber: '13',
                        ),
                        CalendarDay(
                          isActive: false,
                          dayAbbreviation: 'MO',
                          dayNumber: '14',
                        ),
                        CalendarDay(
                          isActive: false,
                          dayAbbreviation: 'TU',
                          dayNumber: '15',
                        ),
                        CalendarDay(
                          isActive: false,
                          dayAbbreviation: 'WE',
                          dayNumber: '16',
                        ),
                        CalendarDay(
                          isActive: false,
                          dayAbbreviation: 'TH',
                          dayNumber: '17',
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: <Widget>[
                    ShowTime(
                      time: '11:00',
                      price: 5,
                      isActive: false,
                    ),
                    ShowTime(
                      time: '12:30',
                      price: 10,
                      isActive: true,
                    ),
                    ShowTime(
                      time: '14:30',
                      price: 10,
                      isActive: false,
                    ),
                    ShowTime(
                      time: '15:30',
                      price: 10,
                      isActive: false,
                    ),
                    ShowTime(
                      time: '18:30',
                      price: 10,
                      isActive: false,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: SingleChildScrollView(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Icon(
                        Icons.live_tv,
                        color: kPimaryColor,
                        size: 18.0,
                      ),
                      SizedBox(width: 20.0),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text('S2 Cinimas Perambur',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold)),
                            Text('Chennai',
                                style: TextStyle(
                                  color: Colors.white30,
                                )),
                            SizedBox(height: 3.0),
                            Text('2D 3D',
                                style: TextStyle(
                                  color: Colors.white30,
                                )),
                            SizedBox(height: 6.0),
                          ],
                        ),
                      ),
                      SizedBox(width: 20.0),
                      Icon(
                        Icons.keyboard_arrow_right,
                        size: 30.0,
                        color: Colors.white38,
                      )
                    ],
                  ),
                ),
              ),
              Center(child: Image.asset('assets/screen.png')),
              Container(
                child: Padding(
                  padding: EdgeInsets.all(22),
                  child: Column(
                    children: <Widget>[
                      // First Seat Row
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(
                            width: (MediaQuery.of(context).size.width / 20),
                          ),
                          CienmaSeat(),
                          CienmaSeat(),
                          CienmaSeat(),
                          SizedBox(
                            width: (MediaQuery.of(context).size.width / 20) * 2,
                          ),
                          CienmaSeat(),
                          CienmaSeat(),
                          SizedBox(
                            width: (MediaQuery.of(context).size.width / 20),
                          ),
                        ],
                      ),
                      // Second Row
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          CienmaSeat(),
                          CienmaSeat(),
                          CienmaSeat(),
                          CienmaSeat(),
                          SizedBox(
                            width: (MediaQuery.of(context).size.width / 20) * 2,
                          ),
                          CienmaSeat(
                            isReserved: true,
                          ),
                          CienmaSeat(),
                          CienmaSeat(),
                        ],
                      ),
                      // Third  Row
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          CienmaSeat(),
                          CienmaSeat(),
                          CienmaSeat(),
                          CienmaSeat(),
                          SizedBox(
                            width: (MediaQuery.of(context).size.width / 20) * 2,
                          ),
                          CienmaSeat(),
                          CienmaSeat(
                            isReserved: true,
                          ),
                          CienmaSeat(
                            isReserved: true,
                          ),
                        ],
                      ),
                      // 4TH Row
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          CienmaSeat(),
                          CienmaSeat(),
                          CienmaSeat(),
                          CienmaSeat(),
                          SizedBox(
                            width: (MediaQuery.of(context).size.width / 20) * 2,
                          ),
                          CienmaSeat(
                            isReserved: true,
                          ),
                          CienmaSeat(),
                          CienmaSeat(),
                        ],
                      ),
                      // 5TH Row
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          CienmaSeat(),
                          CienmaSeat(),
                          CienmaSeat(),
                          CienmaSeat(),
                          SizedBox(
                            width: (MediaQuery.of(context).size.width / 20) * 2,
                          ),
                          CienmaSeat(),
                          CienmaSeat(),
                          CienmaSeat(),
                        ],
                      ),
                      // 6TH Row
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          CienmaSeat(),
                          CienmaSeat(),
                          CienmaSeat(),
                          CienmaSeat(),
                          SizedBox(
                            width: (MediaQuery.of(context).size.width / 20) * 2,
                          ),
                          CienmaSeat(),
                          CienmaSeat(),
                          CienmaSeat(),
                        ],
                      ),
                      // final Row
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(
                            width: (MediaQuery.of(context).size.width / 20),
                          ),
                          CienmaSeat(),
                          CienmaSeat(),
                          CienmaSeat(),
                          SizedBox(
                            width: (MediaQuery.of(context).size.width / 20) * 2,
                          ),
                          CienmaSeat(),
                          CienmaSeat(),
                          SizedBox(
                            width: (MediaQuery.of(context).size.width / 20),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.circle_outlined,
                    color: Colors.white,
                    size: 15,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    'Available',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(
                    width: 13,
                  ),
                  Icon(
                    Icons.circle_rounded,
                    color: Colors.white,
                    size: 15,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    'Reserved',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(
                    width: 13,
                  ),
                  Icon(
                    Icons.circle_rounded,
                    color: Colors.yellow[700],
                    size: 15,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    'Selected',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 29,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: Center(
                      child: Text(
                        '\$30.00',
                        style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ),
                  Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width * 0.5,
                    decoration: BoxDecoration(
                        color: Colors.redAccent[700],
                        borderRadius:
                            BorderRadius.only(topLeft: Radius.circular(25.0))),
                    child: InkWell(
                        child: Center(
                      child: Text('Pay',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold)),
                    )),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

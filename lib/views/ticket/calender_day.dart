import 'package:flutter/material.dart';

import 'const.dart';

class CalendarDay extends StatelessWidget {
  final String dayAbbreviation;
  final String dayNumber;
  final bool isActive;
  CalendarDay(
      {required this.dayNumber,
      required this.dayAbbreviation,
      this.isActive = false});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Container(
        width: 50.0,
        height: 65.0,
        decoration: BoxDecoration(
            color: isActive ? kPimaryColor : null,
            borderRadius: BorderRadius.circular(15.0)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(dayNumber,
                style: TextStyle(
                    color: isActive ? Colors.grey[800] : Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold)),
            Text(
              dayAbbreviation.toUpperCase(),
              style: TextStyle(
                color: isActive ? Colors.grey[800] : Colors.white12,
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

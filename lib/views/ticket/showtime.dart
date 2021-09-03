import 'package:flutter/material.dart';

import 'const.dart';

class ShowTime extends StatefulWidget {
  bool isActive;

  final int price;

  final String time;

  ShowTime({required this.time, required this.price, this.isActive = false});

  @override
  _ShowTimeState createState() => _ShowTimeState();
}

class _ShowTimeState extends State<ShowTime> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: () {
        setState(() {
          widget.isActive = !widget.isActive;
        });
      },
      child: Container(
        margin: const EdgeInsets.all(15.0),
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
        decoration: BoxDecoration(
            border: Border.all(
                color: widget.isActive ? kPimaryColor : Colors.white12),
            borderRadius: BorderRadius.circular(11.0)),
        child: Column(
          children: <Widget>[
            Text(
              widget.time,
              style: TextStyle(
                  color: widget.isActive ? kPimaryColor : Colors.white,
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold),
            ),
            Text('From \$${widget.price}',
                style: const TextStyle(color: Colors.white, fontSize: 12.0))
          ],
        ),
      ),
    );
  }
}

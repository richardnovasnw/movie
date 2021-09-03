import 'package:flutter/material.dart';

class BuyTicket extends StatefulWidget {
  @override
  _BuyTicketState createState() => _BuyTicketState();
}

class _BuyTicketState extends State<BuyTicket> {
  Set<int> seats = {};
  late String value;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black54,
          title: Text(
            'Book Ticket',
            style: TextStyle(color: Colors.white),
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Column(
          children: [
            Center(
              child: Text(
                'Screen',
                style: TextStyle(color: Colors.white, fontSize: 14),
              ),
            ),
            SizedBox(
              height: 35,
            ),
            GridView.count(
              crossAxisCount: 6,
              crossAxisSpacing: 25,
              mainAxisSpacing: 10,
              shrinkWrap: true,
              children: List.generate(36, (index) {
                value =
                    '${String.fromCharCode(65 + index ~/ 6).toUpperCase()}${(index % 6) + 1}';
                return InkWell(
                  onTap: () {
                    setState(() {
                      if (seats.contains(index)) {
                        seats.remove(index);
                      } else {
                        if (seats.length == 4) {
                          return;
                        }
                        seats.add(index);
                      }
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.greenAccent),
                      color: seats.contains(index)
                          ? Colors.greenAccent
                          : Colors.transparent,
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      '$value',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                );
              }),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    fixedSize: Size(MediaQuery.of(context).size.width, 40)),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Your tickets are booked ')),
                  );
                },
                child: Text(
                  'BOOK',
                  style: TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                ))
          ],
        ),
      ),
    );
  }
}

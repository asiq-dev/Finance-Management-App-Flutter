import 'package:finance_app/screens/add.dart';
import 'package:finance_app/screens/home.dart';
import 'package:finance_app/screens/statistics.dart';
import 'package:flutter/material.dart';

class Bottom extends StatefulWidget {
  const Bottom({ super.key });
  @override
  State<Bottom> createState() => _BottomState();
}

class _BottomState extends State<Bottom> {
  int indexColor = 0;
  List screen = [Home(), Statistics(), Home(), Statistics()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screen[indexColor],
      // add button
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => AddScreen()));
        },
        backgroundColor: Color(0xff368983),
        child: Icon(Icons.add, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Padding(
          padding: const EdgeInsets.only(top: 7.5, bottom: 7.5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              //home button
              GestureDetector(
                onTap: (){
                  setState(() {
                    indexColor = 0;
                  });
                },
                child: Icon(
                  Icons.home,
                  size: 30,
                  color: indexColor == 0 ? Color(0xff368983): Colors.grey,
                ),
              ),
          
              // SizedBox(width: 20),
              // bar chart outlined icon
              GestureDetector(
                onTap: (){
                  setState(() {
                    indexColor = 1;
                  });
                },
                child: Icon(
                  Icons.bar_chart_outlined,
                  size: 30,
                  color: indexColor == 1 ? Color(0xff368983): Colors.grey,
                ),
              ),
              
              // account balance icon
              GestureDetector(
                onTap: (){
                setState(() {
                    indexColor = 2;
                  });
                },
                child: Icon(
                  Icons.account_balance_outlined,
                  size: 30,
                  color: indexColor == 2 ? Color(0xff368983): Colors.grey,
                ),
              ),
          
              // person icon
              GestureDetector(
                onTap: (){
                setState(() {
                    indexColor = 3;
                  });
                },
                child: Icon(
                  Icons.person_outlined,
                  size: 30,
                  color: indexColor == 3 ? Color(0xff368983): Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
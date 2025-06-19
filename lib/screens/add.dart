import 'package:flutter/material.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({super.key});

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  DateTime date = DateTime.now();
  String? selectedItem;
  String? selectedItemI;

  FocusNode ex = FocusNode();
  final TextEditingController explainC = TextEditingController();

  FocusNode amount_ = FocusNode();
  final TextEditingController amountC = TextEditingController();

  final List<String> _item = [
    "food",
    "Transfer",
    "Transportation",
    "Education",
  ];

  final List<String> _itemi =[
    "Income",
    "Expense"
  ];

  @override
  void initState() {
    super.initState();
    ex.addListener(() {
      setState(() {});
    });

    amount_.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            backgroundContainer(context),
            Positioned(top: 120, child: mainContainer()),
          ],
        ),
      ),
    );
  }

  Container mainContainer() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      height: 550,
      width: 340,
      child: Column(
        children: [
          SizedBox(height: 50),
          name(),
          SizedBox(height: 30),
          explain(),
          SizedBox(height: 30),
          amount(),
          SizedBox(height: 30),
          how(),
          SizedBox(height: 30),
          dateTime(),
          Spacer(),
          save(),
          SizedBox(height: 15),
        ],
      ),
    );
  }

  GestureDetector save() {
    return GestureDetector(
          onTap: (){},
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Color(0xff368983)
            ),
            width: 120,
            height: 50,
            child: Text(
              'Save',
              style: TextStyle(
                fontFamily: 'f',
                fontWeight: FontWeight.w600,
                color: Colors.white,
                fontSize: 17
              ),
            ),
          ),
        );
  }

  Widget dateTime() {
    return Container(
          alignment: Alignment.bottomLeft,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(width: 2, color: Color(0xffc5c5c5))
          ),
          width: 300,
          child: TextButton(
            onPressed: () async {
              DateTime? newDate = await showDatePicker(context: context, initialDate: date, firstDate: DateTime(2020), lastDate: DateTime(2100));
              
              if (newDate == null) return;
              setState(() {
                date = newDate;
              });
            },
            child: Text(
              'Date: ${date.day}/${date.month}/${date.year}',
              style: TextStyle(
                fontSize: 15,
                color: Colors.black
              ),
            ),
          ),
        );
  }

  Padding how() {
    return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            width: 300,

            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(width: 2, color: Color(0xffc5c5c5)),
            ),

            child: DropdownButton<String>(
              value: selectedItemI,
              items: _itemi
                  .map(
                    (e) => DropdownMenuItem(
                      value: e,
                      child: Row(
                        children: [
                          Text(e, style: TextStyle(fontSize: 18)),
                        ],
                      ),
                    ),
                  )
                  .toList(),

              selectedItemBuilder: (BuildContext context) => _itemi
                  .map(
                    (e) => Row(
                      children: [
                        Text(e),
                      ],
                    ),
                  )
                  .toList(),

              hint: Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Text(
                  'How',
                  style: TextStyle(color: Colors.grey)
                ),
              ),
              dropdownColor: Colors.white,
              isExpanded: true,
              underline: Container(),

              onChanged: ((value) {
                setState(() {
                  selectedItemI = value!;
                });
              }),
            ),
          ),
        );
  }

  Padding amount() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        keyboardType: TextInputType.number,
        focusNode: amount_,
        controller: amountC,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          labelText: 'Amount',
          labelStyle: TextStyle(fontSize: 17, color: Colors.grey.shade500),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(width: 2, color: Color(0xffc5c5c5)),
          ),

          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(width: 2, color: Color(0xff368983)),
          ),
        ),
      ),
    );
  }

  // for explain field
  Padding explain() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        focusNode: ex,
        controller: explainC,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          labelText: 'Explain',
          labelStyle: TextStyle(fontSize: 17, color: Colors.grey.shade500),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(width: 2, color: Color(0xffc5c5c5)),
          ),

          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(width: 2, color: Color(0xff368983)),
          ),
        ),
      ),
    );
  }

  // for name field
  Padding name() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        width: 300,

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 2, color: Color(0xffc5c5c5)),
        ),

        child: DropdownButton<String>(
          value: selectedItem,

          items: _item
              .map(
                (e) => DropdownMenuItem(
                  value: e,
                  child: Row(
                    children: [
                      SizedBox(width: 40, child: Image.asset('images/$e.png')),
                      SizedBox(width: 10),
                      Text(e, style: TextStyle(fontSize: 18)),
                    ],
                  ),
                ),
              )
              .toList(),

          selectedItemBuilder: (BuildContext context) => _item
              .map(
                (e) => Row(
                  children: [
                    SizedBox(width: 42, child: Image.asset('images/$e.png')),
                    SizedBox(width: 10),
                    Text(e, style: TextStyle(fontSize: 18)),
                  ],
                ),
              )
              .toList(),

          hint: Text('Name', style: TextStyle(color: Colors.grey)),
          dropdownColor: Colors.white,
          isExpanded: true,
          underline: Container(),

          onChanged: ((value) {
            setState(() {
              selectedItem = value!;
            });
          }),
        ),
      ),
    );
  }

  Column backgroundContainer(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 240,
          decoration: BoxDecoration(
            color: Color(0xff368983),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
          child: Column(
            children: [
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Icon(Icons.arrow_back, color: Colors.white),
                    ),
                    Text(
                      'Adding',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    Icon(Icons.attach_file_outlined, color: Colors.white),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

import 'package:finance_app/data/model/add_data.dart';
import 'package:hive_flutter/hive_flutter.dart';

int total = 0;

final box = Hive.box<AddData>('data');


// total amount calculation
int totals() {
  var histories = box.values.toList();
  List a = [0, 0];

  for (var i = 0; i < histories.length; i++) {
    a.add(histories[i].type == "Income"? int.parse(histories[i].amount) : 
    int.parse(histories[i].amount) * -1);
  }
  total = a.reduce((value, element) => value+element);
  return total;
}

// total income calculation
int income() {
  var histories = box.values.toList();
  List a = [0, 0];

  for (var i = 0; i < histories.length; i++) {
    a.add(histories[i].type == "Income"? int.parse(histories[i].amount) : 0);
  }
  total = a.reduce((value, element) => value+element);
  return total;
}

// total expense calculation
int expenses() {
  var histories = box.values.toList();
  List a = [0, 0];

  for (var i = 0; i < histories.length; i++) {
    a.add(histories[i].type == "Income"? 0 : int.parse(histories[i].amount) * -1);
  }
  total = a.reduce((value, element) => value+element);
  return total;
}


// daily total calculation
List<AddData> today() {
  List<AddData> a = [];
  var histories = box.values.toList();
  DateTime date = DateTime.now();
  for (var i=0; i < histories.length; i++){
    if (histories[i].datetime.day == date.day) {
      a.add(histories[i]);
    }
  }
  return a;
}

// weekly total calculation
List<AddData> week() {
  List<AddData> a = [];
  var histories = box.values.toList();
  DateTime date = DateTime.now();
  for (var i=0; i < histories.length; i++){
    if (date.day - 7 <= histories[i].datetime.day &&
    histories[i].datetime.day <= date.day) {
      a.add(histories[i]);
    }
  }
  return a;
}


// monthly total calculation
List<AddData> month() {
  List<AddData> a = [];
  var histories = box.values.toList();
  DateTime date = DateTime.now();
  for (var i=0; i < histories.length; i++){
    if (histories[i].datetime.month == date.month) {
      a.add(histories[i]);
    }
  }
  return a;
}

// yearly total calculation
List<AddData> year() {
  List<AddData> a = [];
  var histories = box.values.toList();
  DateTime date = DateTime.now();
  for (var i=0; i < histories.length; i++){
    if (histories[i].datetime.year == date.year) {
      a.add(histories[i]);
    }
  }
  return a;
}
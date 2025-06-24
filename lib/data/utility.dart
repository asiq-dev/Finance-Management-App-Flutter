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



import 'package:finance_app/data/one.dart';

List<Money> geterTop() {
  Money snapFood = Money();
  snapFood.time = 'jan 30 2025';
  snapFood.name = 'Snap food';
  snapFood.image = 'star.png';
  snapFood.fee = '- \$ 100';
  snapFood.buy = true;

  Money snap = Money();
  snap.name = 'Transfer';
  snap.image = 'Transfer.png';
  snap.time = 'today';
  snap.buy = true;
  snap.fee = '- \$ 60';

  return [snapFood, snap];
}
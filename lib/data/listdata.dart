import 'package:finance_app/data/one.dart';


List<Money> geter() {
  Money upwork = Money();
  upwork.name =  'upwork';
  upwork.fee = '320';
  upwork.time = 'today';
  upwork.image = 'up.png';
  upwork.buy = false;

  Money starbucks = Money();
  starbucks.name = 'Starbucks Coffe';
  starbucks.fee = '120';
  starbucks.time = 'Yesterday';
  starbucks.image = 'star.png';
  starbucks.buy = true;

  Money transfer = Money();
  transfer.name = 'Transfer for food';
  transfer.fee = '180';
  transfer.time = 'today';
  transfer.image = 'Transfer.png';
  transfer.buy = true;
  
  return [
    upwork, starbucks, transfer
  ];
}
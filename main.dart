import 'dart:io';

import 'terminal.dart';

void main() {
  Terminal terminal = Terminal();
  while (true) {
    print('Wellcome');
    menu();

    String? input = stdin.readLineSync();
    while (input == '') {
      print('The value entered is not valid');
      input = stdin.readLineSync();
    }
    if (input == '1') {
      terminal.CreateBus();
    } else if (input == '2') {
      terminal.CreateTrip();
    } else if (input == '3') {
      terminal.showTrip();
    } else if (input == '4') {
      terminal.reserve();
    } else if (input == '5') {
      terminal.buy();
    } else if (input == '6') {
      terminal.cancel();
    } else if (input == '7') {
      terminal.information();
    } else if (input == '8') {
      print('Goodbye..!');
      exit(0);
    }
  }
}

void menu() {
  print('1)Create bus');
  print('2)Create trip');
  print('3)Show trip');
  print('4)Book tickets');
  print('5)Buy tickets');
  print('6)Cancle tickets');
  print('7)Travel information');
  print('8)Exit');
  print('-----------------------------');
  print('Enter your option');
}

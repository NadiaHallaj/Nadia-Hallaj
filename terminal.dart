import 'dart:io';

class Bus {
  String name;
  String type;
  List seats;
  Bus({required this.name, required this.type, required this.seats});
}

class NormalBus extends Bus {
  NormalBus({required super.name, required super.seats})
      : super(type: 'normal');
}

class VipBus extends Bus {
  VipBus({required super.name, required super.seats}) : super(type: 'vip');
}

class Trip {
  String origin;
  String destination;
  double price;
  double totalProfit;
  int countCancelreserve;
  int countCancelBuy;
  Bus bus;
  Trip(
      {required this.origin,
        required this.destination,
        required this.price,
        required this.bus})
      : totalProfit = 0,
        countCancelBuy = 0,
        countCancelreserve = 0;
}

class Terminal {
  List<Bus> normalBuses = [];
  List<Bus> vipBuses = [];
  List<Trip> trips = [];

//---------------- Create Bus ---------------------
  void CreateBus() {
    print('Bus name :');
    String? name = stdin.readLineSync();
    while (name == '') {
      print('The value entered is not valid');
      name = stdin.readLineSync();
    }
    print('Select the type of bus');
    print('1)normal');
    print('2)vip');
    String? type = stdin.readLineSync();
    while (type == '') {
      print('The value entered is not valid');
      type = stdin.readLineSync();
    }
    while (type != '1' && type != '2') {
      print('The value entered is not valid');
      type = stdin.readLineSync();
    }
    if (type == '1') {
      normalBuses.add(NormalBus(name: name!, seats: createNormalSeats()));
    } else if (type == '2') {
      vipBuses.add(VipBus(name: name!, seats: createSeatVip()));
    }
    print('The bus was successfully built...');
    print('-----------------------------------');
  }

//---------------- Create Trip --------------------
  void CreateTrip() {
    print('Choose your bus type');
    print('1)normal');
    print('2)vip');
    String? type = stdin.readLineSync();
    while (type == '') {
      print('The value entered is not valid');
      type = stdin.readLineSync();
    }
    while (type != '1' && type != '2') {
      print('The value entered is not valid');
      type = stdin.readLineSync();
    }
    if (type == '1') {
      if (normalBuses.isEmpty) {
        print('List is empty..');
      } else {
        for (int x = 0; x < normalBuses.length; x++) {
          print('${x + 1}) ${normalBuses[x].name}');
        }
        print('Choose your bus');
        String? input = stdin.readLineSync();
        while (input == '') {
          print('The value entered is not valid');
          input = stdin.readLineSync();
        }
        int countIndex = normalBuses.length;
        int index = int.parse(input!);
        while (index.toInt() < 1 || index.toInt() > countIndex) {
          print('The value entered is not valid');
          index = int.parse(stdin.readLineSync()!);
        }
        print('Enter your origin');
        String? origin = stdin.readLineSync();
        while (origin == '') {
          print('The value entered is not valid');
          origin = stdin.readLineSync();
        }
        print('Enter your destination');
        String? destination = stdin.readLineSync();
        while (destination == '') {
          print('The value entered is not valid');
          destination = stdin.readLineSync();
        }
        print('Enter your price');
        String? price = stdin.readLineSync();
        while (price == '') {
          print('The value entered is not valid');
          price = stdin.readLineSync();
        }
        double? tripPrice = double.tryParse(price!);
        trips.add(Trip(
            origin: origin!,
            destination: destination!,
            price: tripPrice!,
            bus: normalBuses[index - 1]));
      }
    } else if (type == '2') {
      if (vipBuses.isEmpty) {
        print('List is empty..');
      } else {
        for (int x = 0; x < vipBuses.length; x++) {
          print('${x + 1}) ${vipBuses[x].name}');
        }
        print('Choose your bus');
        String? input = stdin.readLineSync();
        while (input == '') {
          print('The value entered is not valid');
          input = stdin.readLineSync();
        }
        int countIndex = vipBuses.length;
        int index = int.parse(input!);
        while (index.toInt() < 1 || index.toInt() > countIndex) {
          print('The value entered is not valid');
          index = int.parse(stdin.readLineSync()!);
        }
        print('Enter your origin');
        String? origin = stdin.readLineSync();
        while (origin == '') {
          print('The value entered is not valid');
          origin = stdin.readLineSync();
        }
        print('Enter your destination');
        String? destination = stdin.readLineSync();
        while (destination == '') {
          print('The value entered is not valid');
          destination = stdin.readLineSync();
        }
        print('Enter your price');
        String? price = stdin.readLineSync();
        while (price == '') {
          print('The value entered is not valid');
          price = stdin.readLineSync();
        }
        double? tripPrice = double.tryParse(price!);
        trips.add(Trip(
            origin: origin!,
            destination: destination!,
            price: tripPrice!,
            bus: vipBuses[index - 1]));
      }
    }
    print('The trip was successfully made...!');
  }

//---------------- show Trips ---------------------
  void showTrip() {
    for (int x = 0; x < trips.length; x++) {
      print(
          '${x + 1})${trips[x].bus.name}   ${trips[x].bus.type}   ${trips[x].origin}    ${trips[x].destination}    ${trips[x].price}');
    }
  }

//---------------- reserve ticket -----------------
  void reserve() {
    showTrip();
    print('----------------------------------------');
    print('Choose your trip');
    String? input = stdin.readLineSync();
    while (input == '') {
      print('The value entered is not valid');
      input = stdin.readLineSync();
    }
    int countIndex = trips.length;
    int index = int.parse(input!);
    while (index.toInt() < 1 || index.toInt() > countIndex) {
      print('The value entered is not valid');
      index = int.parse(stdin.readLineSync()!);
    }
    showSeat(trips[index - 1].bus.seats);
    print('enter the seat number you want to reserve :');
    String? seat = stdin.readLineSync();
    while (seat == '') {
      print('The value entered is not valid');
      seat = stdin.readLineSync();
    }
    int numSeat = int.tryParse(seat!)!;
    while (numSeat < 1 || numSeat > trips[index - 1].bus.seats.length) {
      print('The value entered is not valid');
      numSeat = int.parse(stdin.readLineSync()!);
    }
    while (trips[index - 1].bus.seats[numSeat - 1] == 'rr' ||
        trips[index - 1].bus.seats[numSeat - 1] == 'bb') {
      print('This seat is reserved');
      numSeat = int.parse(stdin.readLineSync()!);
    }
    int? seatNumber = numSeat;
    trips[index - 1].bus.seats[seatNumber - 1] = 'rr';
    print('Pay ${trips[index - 1].price * 30 / 100} to reserve a seat');
    String? pay = stdin.readLineSync();
    while (pay == '') {
      print('The value entered is not valid');
      pay = stdin.readLineSync();
    }
    double? payPrice = double.tryParse(pay!);
    while (payPrice != trips[index - 1].price * 30 / 100) {
      print('Enter the amount correctly');
      payPrice = double.tryParse(stdin.readLineSync()!);
    }
    print('The seat is reserved');
  }

//---------------- buy ticket ---------------------
  void buy() {
    showTrip();
    print('----------------------------------------');
    print('Choose your trip');
    String? input = stdin.readLineSync();
    while (input == '') {
      print('The value entered is not valid');
      input = stdin.readLineSync();
    }
    int countIndex = trips.length;
    int index = int.parse(input!);
    while (index.toInt() < 1 || index.toInt() > countIndex) {
      print('The value entered is not valid');
      index = int.parse(stdin.readLineSync()!);
    }
    showSeat(trips[index - 1].bus.seats);
    print('enter the seat number you want to buy :');
    String? seat = stdin.readLineSync();
    while (seat == '') {
      print('The value entered is not valid');
      seat = stdin.readLineSync();
    }
    int numSeat = int.tryParse(seat!)!;
    while (numSeat < 1 || numSeat > trips[index - 1].bus.seats.length) {
      print('The value entered is not valid');
      numSeat = int.parse(stdin.readLineSync()!);
    }
    while (trips[index - 1].bus.seats[numSeat - 1] == 'rr' ||
        trips[index - 1].bus.seats[numSeat - 1] == 'bb') {
      print('This seat is buyed');
      numSeat = int.parse(stdin.readLineSync()!);
    }
    int? seatNumber = numSeat;
    trips[index - 1].bus.seats[seatNumber - 1] = 'bb';
    print('Pay ${trips[index - 1].price} to buy a seat');
    String? pay = stdin.readLineSync();
    while (pay == '') {
      print('The value entered is not valid');
      pay = stdin.readLineSync();
    }
    double? payPrice = double.tryParse(pay!);
    while (payPrice != trips[index - 1].price) {
      print('Enter the amount correctly');
      payPrice = double.tryParse(stdin.readLineSync()!);
    }
    print('The seat is buyed');
  }

//---------------- cancel ticket ------------------
  void cancel() {
    showTrip();
    print('----------------------------------------');
    print('Choose your trip');
    String? input = stdin.readLineSync();
    while (input == '') {
      print('The value entered is not valid');
      input = stdin.readLineSync();
    }
    int countIndex = trips.length;
    int index = int.parse(input!);
    while (index.toInt() < 1 || index.toInt() > countIndex) {
      print('The value entered is not valid');
      index = int.parse(stdin.readLineSync()!);
    }
    showSeat(trips[index - 1].bus.seats);
    print('enter the seat number you want to cancel :');
    String? seat = stdin.readLineSync();
    while (seat == '') {
      print('The value entered is not valid');
      seat = stdin.readLineSync();
    }
    int numSeat = int.tryParse(seat!)!;
    while (numSeat < 1 || numSeat > trips[index - 1].bus.seats.length) {
      print('The value entered is not valid');
      numSeat = int.parse(stdin.readLineSync()!);
    }
    while (trips[index - 1].bus.seats[numSeat - 1] == numSeat - 1) {
      print('This seat is empty');
      numSeat = int.parse(stdin.readLineSync()!);
    }
    int? seatNumber = numSeat;
    if (trips[index - 1].bus.seats[seatNumber - 1] == 'rr') {
      trips[index - 1].countCancelreserve++;
      trips[index - 1].totalProfit +=
          (trips[index - 1].price * 30 / 100) * 20 / 100;
    } else if (trips[index - 1].bus.seats[seatNumber - 1] == 'bb') {
      trips[index - 1].countCancelBuy++;
      trips[index - 1].totalProfit += (trips[index - 1].price) * 10 / 100;
    }
    trips[index - 1].bus.seats[seatNumber - 1] = seatNumber;
    print(trips[index - 1].totalProfit);
    print('The seat is cancel');
  }

//---------------- information --------------------
  void information() {
    showTrip();
    print('----------------------------------------');
    print('Choose your trip');
    String? input = stdin.readLineSync();
    while (input == '') {
      print('The value entered is not valid');
      input = stdin.readLineSync();
    }
    int countIndex = trips.length;
    int index = int.parse(input!);
    while (index.toInt() < 1 || index.toInt() > countIndex) {
      print('The value entered is not valid');
      index = int.parse(stdin.readLineSync()!);
    }
    int? inp = index;
    int emptySeat = 0;
    for (int x = 0; x < trips[inp - 1].bus.seats.length; x++) {
      if (trips[inp - 1].bus.seats[x] == x + 1) {
        emptySeat++;
      }
    }
    double? totalProfit;
    if (trips[inp - 1].bus.seats.length == 44) {
      totalProfit =
          trips[inp - 1].totalProfit + (44 - emptySeat) * trips[inp - 1].price;
    } else if (trips[inp - 1].bus.seats.length == 30) {
      totalProfit =
          trips[inp - 1].totalProfit + (30 - emptySeat) * trips[inp - 1].price;
    }
    print('Total profit : $totalProfit');
    print('Empty seat : $emptySeat');
    print('Cancel reserve : ${trips[inp - 1].countCancelreserve}');
    print('Cancel buy : ${trips[inp - 1].countCancelBuy}');
  }
}

List createNormalSeats() {
  List seats = [];
  for (int i = 1; i <= 44; i++) {
    seats.add(i);
  }
  return seats;
}

List createSeatVip() {
  List seat = [];
  for (var i = 1; i <= 30; i++) {
    seat.add(i);
  }
  return seat;
}

void showSeat(List seat) {
  var x = 0;
  for (var i in seat) {
    if (x < 9) {
      if (x % 2 != 0) {
        stdout.write('$i   ');
        stdout.write('     ');
      } else {
        stdout.write('$i   ');
      }
      x++;
      if (x % 4 == 0) {
        print('\n');
      }
    } else {
      if (x % 2 != 0) {
        stdout.write('$i  ');
        stdout.write('     ');
      } else {
        stdout.write('$i  ');
      }
      x++;
      if (x % 4 == 0) {
        print('\n');
      }
    }
  }
  print('\n');
}

import 'dart:io';


class Products {
  late List<String> ProductsName;
  late List<int> ProductsPrice;
  late List<int> ProductCount;

  List<String> get newProductsName => ProductsName;

  List<int> get newProductsPrice => ProductsPrice;

  List<int> get newProductCount => ProductCount;


  set newProductsName(List<String> newProductsName) {
    ProductsName = newProductsName;
  }

  set newProductsPrice(List<int> newProductsPrice) {
    ProductsPrice = newProductsPrice;
  }

  set newProductCount(List<int> newProductCount) {
    ProductCount = newProductCount;
  }

  void Add() {
    print('Enter the product name :( 0 -> Cancel)');
    String? names = stdin.readLineSync();
    if (names != '0') {
      while(newProductsName.contains(names)){
        print("mahsool shoma az ghabl vojood darad!dobare name mahsool ra vared konid :");
        names = stdin.readLineSync();

      }
      newProductsName.add(names!);

      print('Enter the price of the product : ');
      String? prices = stdin.readLineSync();
      while( (int.tryParse(prices.toString()) == null)  )
      {
        print('The price is wrong, please re_enter :');

        prices = stdin.readLineSync();
      }

      newProductsPrice.add(prices as int);


      print('Enter the product count:');
      String? counts = stdin.readLineSync();
      int count = int.parse(counts!);
      newProductCount.add(count);

      print("The product has been successfully registered");
    }
  }

  void PrintDisplay(int a, int n) {
    stdout.write("${a + 1}-${newProductsName[a]} ${newProductsPrice[a]}tooman tedad : ${newProductCount[a]} \n");
  }

  void Display() {
    for (int a = 0; a < newProductsName.length; a++) {
      stdout.write("${a + 1}-${newProductsName[a]} ${newProductsPrice[a]}tooman tedad : ${newProductCount[a]}\n");

    }
  }
  void Remove(){
    int n = newProductsName.length;
    print('Enter the number of the product you want to delete:');
    String? userInput = stdin.readLineSync();
    int number = int.parse(userInput!);

    while(number < 0 || number > n ){
      print('The entered number is incorrect, please enter again');
      String? numbers = stdin.readLineSync();

      number = int.parse(numbers!);
    }
    newProductsName.removeAt(number - 1);
    newProductsPrice.removeAt(number - 1);
    newProductCount.removeAt(number - 1);
    print("\n The product has been removed");

  }

  void Edit() {
    int n = newProductsName.length;
    print("adade mahsoole morede nazar ra jahate virayesh entekhab konid ");
    String? userInput = stdin.readLineSync();
    int number = int.parse(userInput!);
    while(number < 0 || number > n ){
      print('The entered number is incorrect, please enter again');
      String? numbers = stdin.readLineSync();

      number = int.parse(numbers!);
    }
    print('Enter the new product name:');
    String? input = stdin.readLineSync();
    newProductsName[number - 1] = input!;

    print('Enter the new price of the product:');
    String? input1 = stdin.readLineSync();
    int user = int.parse(input1!);
    newProductsPrice[number - 1] = user;


    print('Enter the new number of the product:');
    String? input2 = stdin.readLineSync();
    int user2 = int.parse(input2!);
    newProductCount[number - 1] = user2;

    print(" \n The product was edited");
  }

}
void main() {
  Products product = Products();
  while (true) {
    stdout.write(
        '1-Product registration \n 2-View list  \n 3-Remove the product '
            ' \n 4-Product editing \n 5- Show list\n 6-Exit');
    print('Select the desired option :');
    String? input = stdin.readLineSync();
    int number = int.parse(input!);
    switch (number) {
      case 1:
        product.Add();
        break;
      case 2:
        product.Display();
        break;
      case 3:
        product.Remove();
        break;
      case 4:
        product.Edit();
        break;
      case 5:
        product.PrintDisplay();

        break;
      case 6:
        exit(0);
      default:
        print('You cannot enter');
    }
  }
}

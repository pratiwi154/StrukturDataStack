import 'dart:io';

class Stack<T> {
  final List<T> _items = [];

  void push(T item) {
    _items.add(item);
  }

  T pop() {
    if (_items.isEmpty) {
      throw Exception('Stack is empty');
    }
    return _items.removeLast();
  }

  bool get isEmpty => _items.isEmpty;
}

String decimalToBase(int decimal, int base) {
  if (decimal == 0) return '0';
  
  Stack<String> stack = Stack<String>();
  int temp = decimal;
  
  while (temp > 0) {
    int remainder = temp % base;
    String digit;
    
    if (remainder < 10) {
      digit = remainder.toString();
    } else {
      // For hexadecimal: 10 = A, 11 = B, etc.
      digit = String.fromCharCode('A'.codeUnitAt(0) + remainder - 10);
    }
    
    stack.push(digit);
    temp = temp ~/ base;
  }
  
  String result = '';
  while (!stack.isEmpty) {
    result += stack.pop();
  }
  
  return result;
}

void main() {
  print('Program Konversi Nilai Desimal (Menggunakan Stack)');
  print('=================================================');
  
  stdout.write('Masukkan nilai desimal = ');
  String? input = stdin.readLineSync();
  
  if (input != null && input.isNotEmpty) {
    try {
      int decimal = int.parse(input);
      
      // Konversi ke biner (base 2)
      String binary = decimalToBase(decimal, 2);
      
      // Konversi ke oktal (base 8)
      String octal = decimalToBase(decimal, 8);
      
      // Konversi ke heksadesimal (base 16)
      String hexadecimal = decimalToBase(decimal, 16);
      
      print('Hasil nilai biner = $binary');
      print('Hasil nilai oktal = $octal');
      print('Hasil nilai heksadesimal = $hexadecimal');
    } catch (e) {
      print('Input tidak valid. Masukkan angka desimal yang benar.');
    }
  } else {
    print('Input tidak boleh kosong.');
  }
}
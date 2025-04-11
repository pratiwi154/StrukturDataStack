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

String reverseString(String input) {
  Stack<String> stack = Stack<String>();
  
  // Push each character onto the stack
  for (int i = 0; i < input.length; i++) {
    stack.push(input[i]);
  }
  
  // Pop characters from stack to get reversed string
  String reversed = '';
  while (!stack.isEmpty) {
    reversed += stack.pop();
  }
  
  return reversed;
}

bool isPalindrome(String original, String reversed) {
  // Remove spaces for palindrome checking
  String originalNoSpaces = original.replaceAll(' ', '').toLowerCase();
  String reversedNoSpaces = reversed.replaceAll(' ', '').toLowerCase();
  
  return originalNoSpaces == reversedNoSpaces;
}

void main() {
  print('Program Pembalik Kalimat dan Pengecekan Palindrom');
  print('================================================');
  
  stdout.write('Masukkan kalimat : ');
  String? input = stdin.readLineSync();
  
  if (input != null && input.isNotEmpty) {
    String reversed = reverseString(input);
    
    print('Hasil = $reversed');
    
    if (isPalindrome(input, reversed)) {
      print('Palindrom');
    } else {
      print('Bukan palindrom');
    }
  } else {
    print('Input tidak boleh kosong.');
  }
}
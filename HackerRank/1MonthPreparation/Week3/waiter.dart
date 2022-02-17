import 'dart:io';

class Solution {
  void init() {
    final dishes = int.parse(stdin.readLineSync()!);
    print(_waiter(
        List.from(stdin.readLineSync()!.split(' ').map((e) => int.parse(e))),
        dishes));
  }

  List<int> _waiter(List<int> dishes, int q) {
    List<int> primes = _getPrimes(q);
    List<int> a = [];
    List<int> b = [];
    List<int> answers = [];

    for (var j = 0; j < q; j++) {
      int prime = primes[j];

      for (var i = dishes.length - 1; i >= 0; i--) {
        int dish = dishes[i];
        if (dish % prime == 0) {
          b.add(dish);
        } else {
          a.add(dish);
        }
      }

      answers.addAll(b.reversed);
      b.clear();    
      dishes = [...a]; 
      a.clear();
    }

    answers.addAll(dishes.reversed);

    return answers;
  }

  List<int> _getPrimes(int q) {
    List<int> primes = [];
    late bool isPrime;

    if (q < 2) {
      primes.add(2);
    } else {
      for (int i=2; primes.length<=q; i++) {
        isPrime = true;
        for (int j = 2; j < i; j++) {
          if (i % j == 0) {
            isPrime = false;
            break;
          }
        }
        if (isPrime) primes.add(i);
      }
    }

    return primes;
  }
}

main(List<String> args) {
  final solution = Solution();
  solution.init();
}


/* public static List<Integer> waiter(List<Integer> dishes, int q) {
  List<Integer> primes = getPrimes(q);
  List<Integer> a = new ArrayList<>();
  List<Integer> b = new ArrayList<>();
  List<Integer> answers = new ArrayList<>();
  for (int j = 0; j < q; j++) {
    int prime = primes.get(j);
    for (int i = dishes.size() - 1; i >= 0; i--) {
      int dish = dishes.get(i);
      if (dish % prime == 0) {
        b.add(dish);
      } else {
        a.add(dish);
      }
    }
    Collections.reverse(b);
    answers.addAll(b);
    b.clear();    
    dishes.clear();
    dishes.addAll(a); 
    a.clear();
  }

  Collections.reverse(dishes);
  answers.addAll(dishes);
  return answers;
}
    
public static List<Integer> getPrimes(int q) {
  List<Integer> primes = new ArrayList<Integer>();
  boolean isPrime;
  if (q < 2) {
    primes.add(2);
  } else {
    for (int i = 2; primes.size() < q; i++) {
      isPrime = true;
      for (int j = 2; j <= Math.sqrt(i); j++) {
        if (i % j == 0) {
          isPrime = false;
          break;
        }
      }
      if (isPrime) primes.add(i);
    }
  }
  return primes;
} */

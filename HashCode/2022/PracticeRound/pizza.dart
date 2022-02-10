import 'dart:io';

/**
   * RESULTADOS
   * 
   *        makePizza()  makePizzaV2() >  makePizzaV2() >=  makePizzaV3()
   * A        2               2               2                 1
   * B        5               5               5                 5
   * C        1               4               3                 2
   * D        1420            1697            1708              1406
   * E        412             799             1004              747
   * Total    1840            2507            2722              2161
*/

class Solution {
  void init() async {
    final directory = 'input_data';
    final examples = [
      'a_an_example.in.txt',
      'b_basic.in.txt',
      'c_coarse.in.txt',
      'd_difficult.in.txt',
      'e_elaborate.in.txt'
    ];

    final data =
        await readFile('${Directory.current.path}/$directory/${examples[4]}');

    final result = makePizzaV3(data);

    print(result);
    writeFile(result, '${Directory.current.path}/$directory/result5.txt');
  }

  String makePizza(List<String> data) {
    List<String> likes = [];
    List<String> dislikes = [];

    for (var i = 1; i <= int.parse(data[0]) * 2 +1; i++) {
      if (i % 2 != 0) {
        likes.addAll(List.from(data[i].split(' ').sublist(1)));
      } else {
        dislikes.addAll(List.from(data[i].split(' ').sublist(1)));
      }
    }

    likes = likes.toSet().toList();
    dislikes = dislikes.toSet().toList();

    String pizza = '';

    likes.removeWhere((element) => dislikes.contains(element));

    pizza = '${likes.length.toString()}';

    likes.forEach((element) {
      pizza += ' $element';
    });

    return pizza;
  }

  String makePizzaV2(List<String> data) {
    Map<String, int> likes = {};
    Map<String, int> dislikes = {};
    List<String> temp = [];

    for (var i = 1; i <= int.parse(data[0]) * 2; i++) {
      temp = List.from(data[i].split(' ').sublist(1));
      temp.forEach((ingredient) {
        if (i % 2 != 0) {
          likes[ingredient] =
              likes[ingredient] == null ? 1 : likes[ingredient]! + 1;
        } else {
          dislikes[ingredient] =
              dislikes[ingredient] == null ? 1 : dislikes[ingredient]! + 1;
        }
      });
    }

    String pizza = '';
    int total = 0;

    likes.forEach((ingredient, acum) {
      if (dislikes[ingredient] != null) {
        if (acum - dislikes[ingredient]! >= 0) {
          pizza += ' $ingredient';
          total++;
        }
      } else {
        pizza += ' $ingredient';
        total++;
      }
    });

    return '$total$pizza';
  }

  String makePizzaV3(List<String> data){
    String pizza = '';
    int total = 0;
    List<String> temp = [];
    for (var i = 2; i <= int.parse(data[0]) * 2; i+=2) {
      if(!data[i].startsWith('0')) continue;

      temp = List.from(data[i-1].split(' ').sublist(1));
      temp.forEach((element) {
        if(pizza.contains(element)) return;
        pizza+=' $element';
        total++;
      });
    }

    return '$total$pizza';
  }

  Future<List<String>> readFile(String path) async {
    File file = new File(path);

    return file.readAsLines();
  }

  void writeFile(String result, String path) {
    File file = new File(path);
    file.writeAsString(result);
  }
}

void main() {
  final solution = Solution();
  solution.init();
}

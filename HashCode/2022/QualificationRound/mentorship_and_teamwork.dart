import 'dart:io';

class Solution{
  void init(){
    final directory = 'input_data';
    final examples = [
      'a_an_example.in.txt',
      'b_better_start_small.in.txt',
      'c_collaboration.in.txt',
      'd_dense_schedule.in.txt',
      'e_exceptional_skills.in.txt',
      'f_find_great_mentors.in.txt'
    ];
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

class Skill{
  String name;
  int level;

  Skill(this.name,this.level);
}

class Project{
  String name;
  int days;
  int score;
  int bestDay;
  List<Skill> roles;

  Project(this.name,
  this.days,
  this.score,
  this.bestDay,
  this.roles);
}

class Contributors{
  String name;
  List<Skill> skill;

  Contributors(this.name,this.skill);
}
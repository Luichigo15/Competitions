import 'dart:io';

class Solution{
  void init() async{
    final directory = 'input_data';
    final examples = [
      'a_an_example.in.txt',
      'b_better_start_small.in.txt',
      'c_collaboration.in.txt',
      'd_dense_schedule.in.txt',
      'e_exceptional_skills.in.txt',
      'f_find_great_mentors.in.txt'
    ];

    final data =
        await readFile('${Directory.current.path}/$directory/${examples[0]}');

    List<Contributors> contributors = [];
    List<Project> projects = [];

    final totalData = data[0].split(' ');

    for (var i = 1; i < int.parse(totalData[0]); i++) {
      final dataCont = data[i].split(' ');
      List<Skill> skills = [];
      for (var j = i+1; j < int.parse(dataCont[1]); j++) {
        final dataSkill = data[j].split(' ');
        skills.add(Skill(dataSkill[0], int.parse(dataSkill[1])));
      }
      contributors.add(Contributors(dataCont[0], skills));
    }

    for (var i = 0; i < count; i++) {
      
    }
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

  String toString() {
    return {
      'name':this.name,
      'level':this.level
    }.toString();
  }
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
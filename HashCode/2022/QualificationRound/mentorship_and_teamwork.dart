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
    int line = 1;

    for (var i = 0; i < int.parse(totalData[0]); i++) {
      final dataCont = data[line].split(' ');
      line++;
      List<Skill> skills = [];
      for (var j = 0; j < int.parse(dataCont[1]); j++) {
        final dataSkill = data[line].split(' ');
        skills.add(Skill(dataSkill[0], int.parse(dataSkill[1])));
        line++;
      }
      contributors.add(Contributors(dataCont[0], skills));
    }

    for (var i = 0; i < int.parse(totalData[1]); i++) {
      final dataCont = data[line].split(' ');
      line++;
      List<Skill> skills = [];
      for (var j = 0; j < int.parse(dataCont[4]); j++) {
        final dataSkill = data[line].split(' ');
        skills.add(Skill(dataSkill[0], int.parse(dataSkill[1])));
        line++;
      }
      projects.add(
        Project(
          dataCont[0],
          int.parse(dataCont[1]),
          int.parse(dataCont[2]),
          int.parse(dataCont[3]),
          skills,
        ));
    }

    print(contributors);
    print(projects);
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

  String toString() {
      return {
        'name':this.name,
        'days':this.days,
        'score':this.score,
        'bestDay':this.bestDay,
        'roles':this.roles.toString(),
      }.toString();
    }
}

class Contributors{
  String name;
  List<Skill> skill;

  Contributors(this.name,this.skill);

  String toString() {     
     
      return {
        'name':this.name,
        'skills':this.skill.toString()
      }.toString();
    }
}
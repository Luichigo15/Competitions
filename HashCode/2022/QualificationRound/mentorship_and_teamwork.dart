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
        await readFile('${Directory.current.path}/$directory/${examples[1]}');

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

    projects.sort((element1,element2)=>element1.roles.length.compareTo(element2.roles.length));

    final resultData = calculateData(contributors, projects);
    print(resultData);
    writeFile(resultData, '${Directory.current.path}/$directory/result1.txt');
  }

  String calculateData(List<Contributors> cont,List<Project> projects){
    int k = 0;
    List<Project> projectsFinal = [];
    while(projects.where((element) => !element.isFullRoles).length>0){
      if(k>=projects.length) k=0;
      final project = projects[k];
      for (var i = 0; i < project.roles.length; i++) {
        final list = cont.where(
          (contri) => contri.skill.where(
            (skill) => skill.name == project.roles[i].name && skill.level >= project.roles[i].level).length>0).toList();

        if(list.length==0) continue;

        for (var j = 0; j < list.length; j++) {
          if(project.contributors.contains(list[j])) continue;
          project.contributors.add(list[j]);
          break;
        }
      }

      if(project.contributors.length==project.roles.length){
        project.isFullRoles = true;
        project.contributors.forEach((element) {
          cont[cont.indexOf(element)].skill.forEach((skill) {skill.level++; });
        });
        projectsFinal.add(project);
      }
      k++;
    }

    String result = '${projectsFinal.length}\n';
    for (var i = 0; i < projectsFinal.length; i++) {
      final element = projectsFinal[i];
      result+='${element.name}\n';
      String names = '';
      element.contributors.forEach((contri) {
        if(names.isEmpty){
          names+= '${contri.name}';
        }else{
          names+= ' ${contri.name}';
        }
        
      });

      if(i==projectsFinal.length-1){
        result+='$names';
      }else{
        result+='$names\n';
      }
      
    }

    return result;
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
  List<Contributors> contributors = [];
  bool isFullRoles = false;

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
        'contributors':this.contributors.toString()
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
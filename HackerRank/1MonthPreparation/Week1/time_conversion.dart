import 'dart:io';

main(List<String> args) {
  String hour = stdin.readLineSync()!;

  if((hour.endsWith('PM') && int.parse(hour.substring(0,2))<12)
    || (hour.endsWith('AM') && int.parse(hour.substring(0,2))==12)){
    final splittedHour = hour.split(':');
    hour="${splittedHour[0]=='12'?'00':int.parse(splittedHour[0])+12}:${splittedHour[1]}:${splittedHour[2]}";
  }

  hour = hour.replaceAll(RegExp(r'[AP]M'), '');

  print(hour);
  
}
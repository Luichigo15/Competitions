import 'dart:io';

class Reader {
  Future readFile(String path) async {
    File file = new File(path);

    return file.readAsString();
  }
}

import 'dart:convert';
import 'dart:io';

import 'package:process_run/shell.dart';

void main(List<String> args) async {
  var env;
  var platform;

  try {
    env = args[args.indexOf("-env") + 1];
    platform = args[args.indexOf("-platform") + 1];
  } catch (e) {
    print(e);
  }

  if (env == null || !["staging", "prod", "dev"].contains(env)) {
    print("Invalid args missing -env");
    exit(0);
    return;
  }

  await File("pubspec_${env}.yaml").copy("pubspec.yaml");

  final List<List<String>> env_variables = [];

  await File("config/${env}/env/properties.env")
      .openRead()
      .map(utf8.decode)
      .transform(new LineSplitter())
      .forEach((l) => env_variables.add(l.split("=")));

  final env_variables_string = env_variables.fold("", (acc, List<String> env) {
    return acc + " --dart-define=${env.first}=${env.last}";
  });

  var shell = Shell();

  await shell.run("flutter run $env_variables_string");

  exit(0);
}

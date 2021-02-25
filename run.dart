import 'dart:convert';
import 'dart:io';

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
  }

  await File("pubspec_$env.yaml").copy("pubspec.yaml");

  final List<List<String>> envVariables = [];

  await File("config/$env/.env")
      .openRead()
      .map(utf8.decode)
      .transform(new LineSplitter())
      .forEach((l) => envVariables.add(l.split("=")));

  final envVariablesString = envVariables.fold("", (acc, List<String> env) {
    return acc + " --dart-define=${env.first}=${env.last}";
  });

  stdout.writeln(envVariablesString);
}

@TestOn("vm")
library process_run.dartfmt_test;

import 'dart:convert';
import 'dart:io';

import 'package:test/test.dart';
import 'package:process_run/cmd_run.dart';

void main() => defineTests();

void defineTests() {
  group('webdev', () {
    setUp(() async {
      var lines = LineSplitter.split(
          (await runCmd(PubCmd(['global', 'list']))).stdout as String);
      for (var line in lines) {
        if (line.split(' ')[0] == 'webdev') {
          return;
        }
      }
      await runCmd(PubCmd(['global', 'activate', 'webdev']));
    });
    test('help', () async {
      ProcessResult result = await runCmd(WebDevCmd(['--help']));
      expect(result.exitCode, 0);
      expect(result.stdout, contains("Usage: webdev"));

      /*
      this does not work when ran from IDE
      // The raw version is displayed
      result = await runCmd(WebDevCmd(['--version'])..runInShell = true);
      var version = Version.parse((result.stdout as String).trim());
      expect(version, greaterThan(Version(1, 0, 0)));
      expect(result.exitCode, 0);
      */
    });
  });
}

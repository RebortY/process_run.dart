@TestOn("vm")
library command.test.process_run_in_test_;

import 'dart:io';
import 'package:dev_test/test.dart';
import 'package:process_run/dartbin.dart';
import 'package:process_run/process_run.dart';
import 'process_run_test_common.dart';

void main() {
  test('connect_stdin', () async {
    print('Please enter "hi"');
    ProcessResult result = await run(
        dartExecutable, [echoScriptPath, '--stdin'],
        connectStdin: true);
    expect(result.stdout, "hi");
  });
}
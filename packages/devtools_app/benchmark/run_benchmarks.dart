// Copyright 2023 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:convert' show JsonEncoder;
import 'dart:io';

import 'package:web_benchmarks/server.dart';

import 'test_infra/common.dart';
import 'test_infra/project_root_directory.dart';

/// Runs the DevTools web benchmarks and reports the benchmark data.
Future<void> main() async {
  stdout.writeln('Starting web benchmark tests ...');

  final taskResult = await serveWebBenchmark(
    benchmarkAppDirectory: projectRootDirectory(),
    entryPoint: 'benchmark/test_infra/client.dart',
    useCanvasKit: true,
    treeShakeIcons: false,
    initialPage: benchmarkInitialPage,
  );

  stdout
    ..writeln('Web benchmark tests finished.')
    ..writeln('==== Results ====')
    ..writeln(const JsonEncoder.withIndent('  ').convert(taskResult.toJson()))
    ..writeln('==== End of results ====');
}

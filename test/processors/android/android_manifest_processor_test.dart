/*
 * Copyright (c) 2020 MyLittleSuite
 *
 * Permission is hereby granted, free of charge, to any person
 * obtaining a copy of this software and associated documentation
 * files (the "Software"), to deal in the Software without
 * restriction, including without limitation the rights to use,
 * copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the
 * Software is furnished to do so, subject to the following
 * conditions:
 *
 * The above copyright notice and this permission notice shall be
 * included in all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
 * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
 * OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
 * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
 * HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
 * WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
 * OTHER DEALINGS IN THE SOFTWARE.
 */

import 'dart:io';

import 'package:flutter_flavorizr/processors/android/android_manifest_processor.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Test AndroidManifestProcessor', () {
    String content =
        File('../test_resources/android/android_manifest_processor_test/AndroidManifest.xml')
            .readAsStringSync();
    String matcher = File(
            '../test_resources/android/android_manifest_processor_test/AndroidManifest_expected.xml')
        .readAsStringSync();

    AndroidManifestProcessor processor = AndroidManifestProcessor(input: content);
    String actual = processor.execute();

    expect(actual, matcher);
  });

  test('Test malformed AndroidManifestProcessor', () {
    AndroidManifestProcessor processor = AndroidManifestProcessor(input: '');
    expect(() => processor.execute(), throwsException);
  });
}

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:qr_bar_code_scanner_dialog/qr_bar_code_scanner_dialog_method_channel.dart';

void main() {
  MethodChannelQrBarCodeScannerDialog platform = MethodChannelQrBarCodeScannerDialog();
  const MethodChannel channel = MethodChannel('qr_bar_code_scanner_dialog');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(
      channel,
      (call) async {
        return '42';
      },
    );
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(
      channel,
      null,
    );
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
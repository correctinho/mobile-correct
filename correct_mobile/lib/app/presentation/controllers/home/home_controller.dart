import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:mobx/mobx.dart';
part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  @observable
  String qrValue = '';

  @action
  readQRCode() async {
    String code = await FlutterBarcodeScanner.scanBarcode(
        "#FCFCFC", 'Cancel', true, ScanMode.QR);

    qrValue = code != '-1' ? code : 'Not validated';
  }
}

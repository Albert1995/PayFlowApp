import 'package:camera/camera.dart';

class BarcodeScannerStatus {
  final bool isCameraAvailable;
  final String error;
  final String barcode;

  CameraController? cameraController;

  BarcodeScannerStatus({
    this.isCameraAvailable = false,
    this.cameraController,
    this.error = "",
    this.barcode = "",
  });

  factory BarcodeScannerStatus.available(CameraController cameraController) =>
      BarcodeScannerStatus(
        isCameraAvailable: true,
        cameraController: cameraController,
      );

  factory BarcodeScannerStatus.error(String message) =>
      BarcodeScannerStatus(error: message);

  factory BarcodeScannerStatus.barcode(String message) =>
      BarcodeScannerStatus(barcode: message);

  bool get showCamera => isCameraAvailable && error.isEmpty;

  bool get hasErrors => error.isNotEmpty;

  bool get hasBarcode => barcode.isNotEmpty;
}

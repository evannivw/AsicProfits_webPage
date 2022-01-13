import 'dart:html';

import 'dart:typed_data';

class ImagePicker {
  static void pick(Function(Uint8List) callback) {
    FileUploadInputElement uploadInput = FileUploadInputElement();
    uploadInput.click();

    uploadInput.onChange.listen((e) {
      // read file content as dataURL
      final files = uploadInput.files;
      if (files == null) {
        return;
      }
      if (files.length == 1) {
        final file = files[0];
        FileReader reader = FileReader();

        reader.onLoadEnd.listen((e) {
          callback(reader.result as Uint8List);
        });

        reader.onError.listen((fileEvent) {});

        reader.readAsArrayBuffer(file);
      }
    });
  }
}

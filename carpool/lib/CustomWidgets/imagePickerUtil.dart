import 'dart:io';

import '../exportlinks.dart';

class ImagePickerUtil {
  bool camImg = false;
  static Future<FileImage?> pickImage(BuildContext context) async {
    final ImagePicker _picker = ImagePicker();
    XFile? pickedImage;

    await showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Container(
            child: Wrap(
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.camera),
                  title: Text('Take a picture'),
                  onTap: () async {
                    Navigator.pop(context);
                    pickedImage =
                        await _picker.pickImage(source: ImageSource.camera);
                  },
                ),
                ListTile(
                  leading: Icon(Icons.photo_library),
                  title: Text('Choose from gallery'),
                  onTap: () async {
                    Navigator.pop(context);
                    pickedImage =
                        await _picker.pickImage(source: ImageSource.gallery);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );

    if (pickedImage != null) {
      return FileImage(File(pickedImage!.path));
    }

    return null;
  }
}

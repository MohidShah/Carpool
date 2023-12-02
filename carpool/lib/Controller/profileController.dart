import 'package:carpool/exportlinks.dart';

class ProfileController extends GetxController {
  ShowDialog(BuildContext context,
      {title, content, buttonText, onpress}) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: title != null ? Text(title) : Text(''),
          content: content != null ? Text(content) : Text(''),
          actions: <Widget>[
            buttonText != null
                ? TextButton(child: Text(buttonText), onPressed: onpress)
                : SizedBox(),
          ],
        );
      },
    );
  }

  void showPopupMenu(BuildContext context) {
    final RenderBox overlay =
        Overlay.of(context).context.findRenderObject() as RenderBox;

    // Show the popup menu
    showMenu(
      context: context,
      position: RelativeRect.fromRect(
        Rect.fromPoints(
          overlay.localToGlobal(Offset.zero),
          overlay.localToGlobal(overlay.size.bottomRight(Offset.zero)),
        ),
        Offset.zero & overlay.size,
      ),
      items: [
        PopupMenuItem(
          child: InkWell(
            onTap: () {
              // Handle the message option
              Navigator.pop(context); // Close the popup
              // Add your logic to handle the "Message" option
            },
            child: Row(
              children: [
                Icon(Icons.message),
                SizedBox(width: 8.0),
                Text('Message'),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:universal_html/html.dart";
import 'package:http/http.dart' as http;

class ShareTile extends StatelessWidget {
  final Icon icon;
  final String toolTip;
  final String url;

  const ShareTile(this.icon, this.toolTip, this.url, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: IconButton(
        tooltip: toolTip,
        onPressed: () async {
          if (icon.icon == Icons.copy) {
            Clipboard.setData(
              ClipboardData(
                text: window.location.href,
              ),
            ).then((_) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  duration: Duration(
                    seconds: 2,
                    milliseconds: 500,
                  ),
                  content: Text(
                    "Image Url copied to clipboard!",
                  ),
                ),
              );
            });
          }
          if (icon.icon == Icons.save_alt) {
            http.Response response = await http.get(Uri.parse(url));
            if (response.statusCode == 200) {
              Uint8List bytes = response.bodyBytes;

              final blob = Blob([bytes]);
              final blobUrl = Url.createObjectUrlFromBlob(blob);

              final anchorElement = AnchorElement(href: blobUrl);
              anchorElement.download = "Textatize Media.png";

              document.body?.append(anchorElement);
              anchorElement.click();

              anchorElement.remove();
              Url.revokeObjectUrl(blobUrl);
            } else {
              throw Exception("Failed to download file");
            }
          }
        },
        icon: icon,
      ),
    );
  }
}

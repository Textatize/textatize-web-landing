import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:universal_html/html.dart";

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
                text: url,
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
            final anchor = AnchorElement(href: url);
            anchor.download = url.substring(url.lastIndexOf("/") + 1);
            anchor.click();
          }
        },
        icon: icon,
      ),
    );
  }
}

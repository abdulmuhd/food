import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  final controller = WebViewController();
  bool isVisible = false;

  @override
  void initState() {
    controller.loadRequest(Uri.parse('https://'));
    controller.setJavaScriptMode(JavaScriptMode.unrestricted);
    controller.runJavaScript("document.getElementById('button').color=blue");
    controller.setNavigationDelegate(
      NavigationDelegate(
        onProgress: (progress) {},
        onPageStarted: (url) {
          isVisible = false;
          showDialog(
              context: context,
              builder: (builder) {
                return AlertDialog(
                  title: const Text('Warning'),
                  content: const Text('No network available'),
                  actions: [
                    TextButton(
                      onPressed: () {},
                      child: const Text('Cancel'),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text('Try again'),
                    )
                  ],
                );
              });
        },
        onPageFinished: (url) {
          isVisible = true;
        },
        onWebResourceError: (error) {
          showDialog(
              context: context,
              builder: (builder) {
                return const AlertDialog(
                  title: Text('Warning'),
                  content: Text('No network available'),
                );
              });
        },
      ),
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          Visibility(
              visible: isVisible, child: const LinearProgressIndicator()),
          Expanded(child: WebViewWidget(controller: controller)),
        ],
      ),
    ));
  }
}

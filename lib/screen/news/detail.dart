import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:test_tony/theme/style.dart' as Theme;

class DetailScreen extends StatefulWidget {
  const DetailScreen({ Key? key, required this.url }) : super(key: key);
  final String url;

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  bool isLoading = true;
  final key = UniqueKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail Berita", style: TextStyle(color: Theme.Colors.font1)),
        backgroundColor: Theme.Colors.body,
        iconTheme: IconThemeData(
          color: Theme.Colors.font1
        ),
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: WebView(
              key: key,
              initialUrl: widget.url,
              gestureNavigationEnabled: true,
              javascriptMode: JavascriptMode.unrestricted,
              onPageFinished: (finish){
                setState(() {
                  isLoading = false;
                });
              },
            ),
          ),

          isLoading ? Center( child: CircularProgressIndicator()) : Stack(),
        ],
      ),
    );
  }
}
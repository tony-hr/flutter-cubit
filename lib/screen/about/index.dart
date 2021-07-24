import 'package:flutter/material.dart';
import 'package:test_tony/theme/style.dart' as Theme;
import 'package:test_tony/theme/typography.dart';
import 'package:test_tony/widget/boxInfo.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.Colors.body2,
      appBar: AppBar(
        title: Text("Tentang", style: TextStyle(fontSize: 23.0)),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BoxInfo(
              margin: const EdgeInsets.only(top: 0.0, bottom: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("TECHNICAL TEST #5", style: TextStyles.infoTitle),
                  Text("Frontend (Mobile) Developer", style: TextStyles.label),
                ]
              )
            ),

            TitleBoxInfo(title: "Powered by"),
            BoxInfo(
              margin: const EdgeInsets.all(0.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  LabelValue(title: "Nama", value: "Tony HR"),
                  LabelValue(title: "Email", value: "tony.hr10@gmail.com"),

                  SizedBox(height: 30),

                  RichText(
                    text: TextSpan(
                      text: 'Source code aplikasi ini berupa open source dan dapat dilihat di',
                      style: TextStyle(color: Theme.Colors.font3),
                      children: <TextSpan>[
                        TextSpan(
                          text: ' GitHub',
                          style: TextStyle(color: Colors.blue)
                        )
                      ],
                    ),
                  ),

                  SizedBox(height: 10),
                ]
              )
            )
          ]
        )
      )
    );
  }

  // void _launchURL() async => await canLaunch(_url) ? await launch(_url) : throw 'Could not launch $_url';
}
import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Us'),
      ),
      body: SafeArea(
          child: Padding(
            padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                child:
                  Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: RichText(
                      textAlign: TextAlign.justify,
                      text: TextSpan(
                        text:
                      """   ShopLister is a mobile application that lets users create their shopping lists using their smartphones and draft their groceries and expenses based on what they set out of the app.

  Published since 2022, we aim to help users with more convenient shopping.

  We developers create ShopLister since there are still threats of covid variants and we want a safe way to let users do their grocery shopping with more convenience because of these threats.\n
""",
                  style: DefaultTextStyle.of(context).style,
                  children: const <TextSpan>[
                    TextSpan(
                        text: '\nDevelopers\n',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(text: 
  """\n     Alipin, Raven C - Computer Engineer
      raven.alipin@cvsu.edu.ph

    Carsocho, Jhon Heron P. - Computer Engineer
      jhonheron.carsocho@cvsu.edu.ph

    Cruzada, Christian Simon E. - Computer Engineer
      christiansimon.cruzada@cvsu.edu.ph

    Gatdula, Hanznyl Vission T. - Computer Engineer
      hanznylvission.gatdula@cvsu.edu.ph

    Miranda, Edrick Louis R. - Computer Engineer
      edricklouis.miranda@cvsu.edu.ph"""),
                  ],
                ),
              )),
              ),
              ),
    );
  }
}

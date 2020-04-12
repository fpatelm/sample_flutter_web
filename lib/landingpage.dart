import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  LandingPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= 800) {
          return LandingPageDesktop();
        } else {
          return LandingPageMobile();
        }
      },
    );
  }
}

class LandingPageDesktop extends StatelessWidget {
  LandingPageDesktop({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: landingDesktopChildren(),
      ),
    );
  }
}

class LandingPageMobile extends StatelessWidget {
  LandingPageMobile({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: landingMobileChildren(),
      ),
    );
  }
}

List<Widget> landingDesktopChildren() {
  return [
    FeatureText(),
    Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: FeatureImage(),
    )
  ];
}

List<Widget> landingMobileChildren() {
  return [
    Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: FeatureImage(),
    ),
    Padding(
        padding: EdgeInsets.symmetric(vertical: 20.0), child: FeatureText()),
  ];
}

class FeatureImage extends StatelessWidget {
  FeatureImage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      child: Image.network(
        "https://www.salesforce.org/wp-content/uploads/2019/06/Astro-lightning-fireboots-300x300.png",
        fit: BoxFit.cover,
      ),
    );
  }
}

class FeatureText extends StatelessWidget {
  FeatureText({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Developers",
            style: TextStyle(
                fontSize: 50, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20.0),
            child: Text(
              "We have taken each and every project handed over to us as a challenge ...",
              style: TextStyle(color: Colors.white),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20.0),
            child: MaterialButton(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(30.0),
                ),
              ),
              child: Padding(
                  padding: EdgeInsets.all(15),
                  child: Text("Our Projetcs",
                      style: TextStyle(color: Colors.red))),
              onPressed: () {},
            ),
          )
        ],
      ),
    );
  }
}

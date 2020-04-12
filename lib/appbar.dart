import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MyyAppBar extends StatelessWidget {
  MyyAppBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= 1200) {
          return DesktopTabBar();
        } else if (constraints.maxWidth > 1000 &&
            constraints.maxWidth <= 1200) {
          return DesktopTabBar();
        } else {
          return MobileAppBar();
        }
      },
    );
  }
}

class DesktopTabBar extends StatelessWidget {
  DesktopTabBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(30),
      child: Container(
        constraints: BoxConstraints(maxWidth: double.maxFinite),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Logo(
              label: "FP",
            ),
            MenuList(
              menuItems: [
                MenuText(label: "Home", url: ""),
                MenuText(label: "Blog", url: ""),
                MenuText(label: "About", url: ""),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class MobileAppBar extends StatelessWidget {
  MobileAppBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(30),
      child: Container(
        width: double.maxFinite,
        child: Column(
          children: <Widget>[
            Logo(
              label: "FP",
            ),
            MenuListMobile(
              menuItems: [
                MenuText(label: "Home", url: ""),
                MenuText(label: "Blog", url: ""),
                MenuText(label: "About", url: "")
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Logo extends StatelessWidget {
  String label;
  Logo({this.label, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(shape: BoxShape.rectangle, color: Colors.black),
      child: Padding(
        padding: EdgeInsets.all(13),
        child: Text(
          this.label,
          style: TextStyle(color: Colors.white, fontSize: 30),
        ),
      ),
    );
  }
}

class MenuText extends StatelessWidget {
  String label;
  String url;
  MenuText({this.label, this.url, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) => InkWell(
        hoverColor: Colors.pink,
        onTap: () {
          return launch(this.url);
        },
        child: Text(
          this.label,
          style: TextStyle(color: Colors.white),
        ),
      );
}

class MenuList extends StatelessWidget {
  List<MenuText> menuItems;
  MenuList({this.menuItems, Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: generateMenuList(this.menuItems),
    );
  }
}

List<Widget> generateMenuList(List<MenuText> menuItems) {
  List<Widget> list = new List<Widget>();
  for (Widget it in menuItems) {
    if (menuItems.indexOf(it) != menuItems.length - 1) {
      list.add(it);
      list.add(SizedBox(width: 30));
    } else {
      list.add(it);
    }
  }
  return list;
}

class MenuListMobile extends StatelessWidget {
  List<MenuText> menuItems;
  MenuListMobile({this.menuItems, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: generateMenuList(this.menuItems),
      ),
    );
  }
}

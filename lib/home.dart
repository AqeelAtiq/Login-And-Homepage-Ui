import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SizedBox(
        height: 100,
        child: BottomAppBar(
          shape: CircularNotchedRectangle(),
          notchMargin: 10.0,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              BottomNavBar("Home", Icons.home),
              BottomNavBar("Search", Icons.search),
              SizedBox(width: 48.0),
              BottomNavBar("Calendar", Icons.calendar_today),
              BottomNavBar("Roles", Icons.badge_outlined),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        height: 80,
        width: 80,
        child: FloatingActionButton(
          backgroundColor: Colors.deepOrangeAccent,
          child: Icon(Icons.message),
          onPressed: () {},
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        title: Text(
          "Profile",
          style: TextStyle(
            color: Colors.black,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Icon(
            Icons.notifications,
            color: Colors.black,
          )
        ],
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 30),
            child: Center(
              child: CircleAvatar(
                backgroundImage: AssetImage(
                  "image/person.png",
                ),
                backgroundColor: Colors.deepOrange[50],
                radius: 80,
                child: Padding(
                  padding: EdgeInsets.only(left: 100, top: 110),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: GestureDetector(
                      onTap: () {},
                      child: CircleAvatar(
                        backgroundColor: Colors.deepOrangeAccent,
                        child: Icon(
                          Icons.camera_alt,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Text(
            "Hi Muhammad",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          InfoCard(Icons.person, "Personal details"),
          InfoCard(Icons.attach_money_rounded, "Payment details"),
          InfoCard(Icons.settings, "Setting"),
          InfoCard(Icons.logout, "Log Out"),
        ],
      ),
    );
  }
}

//info Card
class InfoCard extends StatelessWidget {
  InfoCard(this.circleIcon, this.text);
  IconData circleIcon;
  String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      height: 80,
      width: double.infinity,
      child: Card(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                child: Icon(
                  circleIcon,
                  color: Colors.deepOrangeAccent,
                  size: 40,
                ),
                radius: 30,
                backgroundColor: Colors.grey.shade300,
              ),
              Text(
                text,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Icon(Icons.arrow_forward_ios)
            ],
          ),
        ),
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}

class BottomNavBar extends StatelessWidget {
  BottomNavBar(this.text, this.icon);
  String text;
  IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10),
      child: Column(
        children: [
          IconButton(
            icon: Icon(
              icon,
              size: 40,
              color: Colors.black54,
            ),
            onPressed: () {},
          ),
          SizedBox(
            height: 5,
          ),
          Text(text)
        ],
      ),
    );
  }
}

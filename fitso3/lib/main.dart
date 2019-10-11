import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './custom.dart';
import 'nextpage.dart';

void main() {
  runApp(MaterialApp(
    title: 'Login App',
    home: HomeScreen(),
    debugShowCheckedModeBanner: false,
  ));
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.black,
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.bottomRight,
              widthFactor: 0.6,
              heightFactor: 0.6,
              child: Material(
                borderRadius: BorderRadius.all(Radius.circular(200)),
                color: Color.fromRGBO(255, 255, 255, 0.4),
                child: Container(
                  width: 350,
                  height: 350,
                ),
              ),
            ),

            Center(
              child: Container(
                width: 400,
                height: 400,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Material(
                      elevation: 10.0,
                      color: Colors.grey,
                      borderRadius: BorderRadius.all(Radius.circular(100.0)),
                      child: getImageAsset(),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),

                    CustomInputField(
                        Icon(Icons.person, color: Colors.white), 'Username'),
                    CustomInputField(
                        Icon(Icons.lock, color: Colors.white), 'Password'),
                    Container(
                      width: 150,
                      child: RaisedButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Home()));
                        },
                        color: Colors.pink,
                        textColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0))),
                        child: Text(
                          'Login',
                          style: TextStyle(
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
Widget getImageAsset() {
  AssetImage assetImage = AssetImage('assets/imageedit_2_2269612997.png');
  Image image = Image(
    image: assetImage,
    width: 90.0,
    height: 90.0,
  );
  return Container(
    child: image,
    margin: EdgeInsets.all(20.0),
  );
}
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hello_world/pages/curves_design/details_page.dart';

class CurveDesign extends StatelessWidget {
  const CurveDesign({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Color(0xFF21BFBD),
        body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              _buildNavigationHeader(),
              SizedBox(height: 25),
              _buildTitle(),
              SizedBox(height: 40),
              _buildMainContainer(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavigationHeader() {
    return Padding(
      padding: EdgeInsets.only(top: 5, left: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.arrow_back_ios),
            color: Colors.white,
            onPressed: () {},
          ),
          Container(
            width: 125,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.filter_list),
                  color: Colors.white,
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.menu),
                  color: Colors.white,
                  onPressed: () {},
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildTitle() {
    return Padding(
      padding: EdgeInsets.only(left: 40),
      child: Row(
        children: <Widget>[
          Text(
            'Healthy',
            style: TextStyle(
                fontFamily: 'Montserrat',
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 25),
          ),
          SizedBox(width: 10),
          Text(
            'Food',
            style: TextStyle(
                fontFamily: 'Montserrat', color: Colors.white, fontSize: 25),
          ),
        ],
      ),
    );
  }

  Widget _buildMainContainer(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(75)),
        ),
        child: Padding(
          padding: EdgeInsets.only(top: 40, left: 25, right: 20),
          child: ListView(
            children: <Widget>[
              Column(
                children: <Widget>[
                  _buildFoodItem(context, 'assets/curve_design/plate1.png',
                      'Salmon bowl', '\$24.00'),
                  _buildFoodItem(context, 'assets/curve_design/plate2.png',
                      'Spring bowl', '\$22.00'),
                  _buildFoodItem(context, 'assets/curve_design/plate6.png',
                      'Avocado bowl', '\$26.00'),
                  _buildFoodItem(context, 'assets/curve_design/plate5.png',
                      'Berry bowl', '\$24.00'),
                  _buildFoodItem(context, 'assets/curve_design/plate3.png',
                      'Berry bowl', '\$24.00'),
                  _buildFoodItem(context, 'assets/curve_design/plate4.png',
                      'Berry bowl', '\$24.00'),
                ],
              ),
              SizedBox(height: 40),
              _buildNavButtons(),
              SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFoodItem(
      BuildContext context, String imgPath, String foodName, String price) {
    return Container(
      child: Padding(
        padding: EdgeInsets.only(left: 10, right: 10, top: 10),
        child: InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => DetailsPage(
                    heroTag: imgPath, foodName: foodName, foodPrice: price)));
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                child: Row(
                  children: <Widget>[
                    Hero(
                      tag: imgPath,
                      child: Image(
                        image: AssetImage(imgPath),
                        fit: BoxFit.cover,
                        height: 75,
                        width: 75,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          foodName,
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              fontSize: 17),
                        ),
                        Text(
                          price,
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              color: Colors.grey,
                              fontSize: 15),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              IconButton(
                icon: Icon(Icons.add),
                color: Colors.black,
                onPressed: () {},
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey,
              style: BorderStyle.solid,
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Center(
            child: Icon(
              Icons.search,
              color: Colors.black,
            ),
          ),
        ),
        Container(
          height: 50.0,
          width: 50.0,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey,
              style: BorderStyle.solid,
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Center(
            child: Icon(
              Icons.shopping_basket,
              color: Colors.black,
            ),
          ),
        ),
        Container(
          height: 50.0,
          width: 120.0,
          decoration: BoxDecoration(
              border: Border.all(
                  color: Colors.grey, style: BorderStyle.solid, width: 1.0),
              borderRadius: BorderRadius.circular(10.0),
              color: Color(0xFF1C1428)),
          child: Center(
            child: Text(
              'Checkout',
              style: TextStyle(
                fontFamily: 'Montserrat',
                color: Colors.white,
                fontSize: 15.0,
              ),
            ),
          ),
        )
      ],
    );
  }
}

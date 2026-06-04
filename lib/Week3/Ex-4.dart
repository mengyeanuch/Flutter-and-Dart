import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          toolbarHeight: 80,
          title: Text("Welcome!", style: TextStyle(color: Colors.pink)),

          centerTitle: true,
          backgroundColor: Colors.pink[100],
        ),
        body: Container(
          padding: EdgeInsets.all(30),
          margin: EdgeInsets.all(10),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.blue[100],
                  borderRadius: BorderRadius.all(Radius.circular(40)),
                ),
                margin: EdgeInsets.only(bottom: 30),
                height: 100,
                child: Center(
                  child: Text(
                    "My favorite fruits",
                    style: TextStyle(
                      color: Colors.blue[700],
                      decoration: TextDecoration.none,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(40)),
                        color: Colors.pink[50],
                      ),
                      margin: EdgeInsets.all(20),
                      width: 200,
                      height: 150,
                      child: Center(
                        child: Text(
                          "Banana",
                          style: TextStyle(fontSize: 20, color: Colors.pink),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(40)),
                        color: Colors.pink[100],
                      ),
                      margin: EdgeInsets.all(20),
                      width: 200,
                      height: 150,
                      child: Center(
                        child: Text(
                          "Strawberry",
                          style: TextStyle(fontSize: 20, color: Colors.pink),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(40)),
                        color: Colors.blue[100],
                      ),
                      margin: EdgeInsets.all(20),
                      width: 200,
                      height: 150,
                      child: Center(
                        child: Text(
                          "Watermelon",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.blue[700],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(40)),
                        color: Colors.blue[200],
                      ),
                      margin: EdgeInsets.all(20),
                      width: 200,
                      height: 150,
                      child: Center(
                        child: Text(
                          "Grape",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.blue[700],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          height: 80,
          color: Colors.pink[100],
          child: Center(
            child: Container(
              height: 80.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.pink,
              ),
              child: Center(
                child: Text("Pick", style: TextStyle(color: Colors.white)),
              ),
            ),
          ),
        ),
      ),
    ),
  );
}

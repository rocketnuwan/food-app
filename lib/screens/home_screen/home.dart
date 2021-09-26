import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Flash(
          infinite: true,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 60),
                color: Colors.purpleAccent,
                child: Center(
                  child: Roulette(
                    infinite: true,
                    child: Container(
                      color: Colors.amber,
                      height: 150,
                      width: 150,
                      child: Container(
                        margin: EdgeInsets.all(50),
                        color: Colors.cyanAccent,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 60),
                color: Colors.purpleAccent,
                child: Center(
                  child: Pulse(
                    infinite: true,
                    child: Container(
                      color: Colors.amber,
                      height: 150,
                      width: 150,
                      child: Container(
                        margin: EdgeInsets.all(50),
                        color: Colors.cyanAccent,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 60),
                color: Colors.purpleAccent,
                child: Center(
                  child: SpinPerfect(
                    infinite: true,
                    child: Container(
                      color: Colors.amber,
                      height: 150,
                      width: 150,
                      child: Container(
                        margin: EdgeInsets.all(50),
                        color: Colors.cyanAccent,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 60),
                color: Colors.purpleAccent,
                child: Center(
                  child: Pulse(
                    infinite: true,
                    child: Container(
                      color: Colors.amber,
                      height: 150,
                      width: 150,
                      child: Container(
                        margin: EdgeInsets.all(50),
                        color: Colors.cyanAccent,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

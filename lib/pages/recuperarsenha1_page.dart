import 'package:flutter/material.dart';

class RecuperarPage extends StatefulWidget {
  const RecuperarPage({super.key, required this.title});

  final String title;

  @override
  State<RecuperarPage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<RecuperarPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 100,
                  children: [
                    Text(
                      "Qual é o seu e-mail?",
                      style: TextStyle(fontSize: 30),
                    ),

                    Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: MediaQuery.of(context).size.height * 0.07,
                      margin: EdgeInsets.only(bottom: 10.0),
                      decoration: BoxDecoration(
                        color: Colors.grey[400],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 15,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Text(
                              "Email:",
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.height * 0.08,
                padding: EdgeInsets.only(left: 20.0),
                decoration: BoxDecoration(
                  color: Colors.cyan[700],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  spacing: 15,
                  children: [
                    Text(
                      "Continuar",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),

                    Icon(
                      Icons.arrow_right_outlined,
                      color: Colors.white,
                      size: 50,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

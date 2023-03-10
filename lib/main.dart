import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green.shade300,
          title: Text("ποΈlist 0f fruits"),
          centerTitle: true,
        ),
        body: Center(
          child: RichText(
            text: TextSpan(
              children: [
              TextSpan(
              text: "π apple\n\n",
              style: TextStyle(
                color: (Colors.red),
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
          ),
                TextSpan(
                  text: "π Greps\n\n",
                  style: TextStyle(
                    color: (Colors.purple),
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: "π Cherry\n\n",
                  style: TextStyle(
                    color: (Colors.deepPurple),
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: "π Strawberry\n\n",
                  style: TextStyle(
                    color: (Colors.redAccent),
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: "π₯­ Mango\n\n",
                  style: TextStyle(
                    color: (Colors.yellow),
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: "π Pineapple\n\n",
                  style: TextStyle(
                    color: (Colors.green),
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: "π Lemon\n\n",
                  style: TextStyle(
                    color: (Colors.yellow.shade700),
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: "π Watermelon\n\n",
                  style: TextStyle(
                    color: (Colors.green.shade500),
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: "π₯₯ Coconut\n\n",
                  style: TextStyle(
                    color: (Colors.brown),
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
            ],
        ),
      ),
    ),
    ),
  ),
  );
}

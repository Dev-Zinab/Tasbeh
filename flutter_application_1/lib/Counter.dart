import 'package:flutter/material.dart';

class Counter extends StatefulWidget {
  const Counter({super.key});

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  // TODO: implement widget
  int count = 0;

  void Counting() {
    setState(() {
      //يقول في شي تغير حدث الشاشة
      count++;
    });
  }

  void reset() {
    setState(() {
      count = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 182, 112, 14),
        title: Text(
          "فَقُلْتُ اسْتَغْفِرُوا رَبَّكُمْ إِنَّهُ كَانَ غَفَّارًا",
          style: TextStyle(
              fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    width: MediaQuery.of(context).size.width / 1.50,
                    height: MediaQuery.of(context).size.width / 1.50,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 182, 112, 14),
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(1, 9),
                          blurRadius: 20,
                        ),
                      ],
                    ),
                    child: Center(
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 40, vertical: 30),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white),
                        child: Text(
                          count.toString(),
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                      ),
                    )),
                SizedBox(
                  height: 30,
                ),
                Transform.translate(
                  offset: Offset(1, 9),
                  child: Container(
                    width: 190,
                    height: 190,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 182, 112, 14),
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(50),
                            bottomRight: Radius.circular(50)),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(1, 9),
                            blurRadius: 20,
                            color: Color.fromARGB(255, 169, 149, 122),
                          ),
                        ]),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () => Counting(),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.green,
                              shape: BoxShape.circle,
                            ),
                            padding: EdgeInsets.all(20),
                          ),
                          style: ElevatedButton.styleFrom(
                              maximumSize: Size(80, 80)),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              onPressed: () => reset(),
                              child: Icon(Icons.wifi_protected_setup),
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.red,
                                padding: EdgeInsets.all(20),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_application_1/Counter.dart';
import 'users.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Fluter Demo",
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: const HomePage());
  }
}

bool isSecured = true;
Map<String, User> users = {
  "someone@gmail.com": User(email: "someone@gmail.com", password: "1221"),
  "someone1@gmail.com": User(email: "someone1@gmail.com", password: "1222")
};

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 182, 112, 14),
          centerTitle: true,
          title: const Text(
            "Login Screen",
            style: TextStyle(fontSize: 25, color: Colors.white),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                "assets/login.jpg",
                height: 350,
                width: 350,
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: emailController,
                        decoration: const InputDecoration(
                          label: Text("Enter Email"),
                          prefixIcon: Icon(Icons.person),
                          border: OutlineInputBorder(borderSide: BorderSide()),
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      TextFormField(
                        controller: passController,
                        obscureText:
                            isSecured, // تعديل هنا لإضافة خاصية إخفاء النص
                        decoration: InputDecoration(
                          label: const Text("Enter Password"),
                          prefixIcon: const Icon(Icons.lock),
                          suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  isSecured =
                                      !isSecured; // تعديل هنا لتغيير حالة الإخفاء
                                });
                              },
                              icon: const Icon(Icons
                                  .remove_red_eye)), // تعديل هنا لإضافة أيقونة الإخفاء
                          border: const OutlineInputBorder(
                              borderSide:
                                  BorderSide()), // تعديل هنا لإضافة حدود للنص
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      InkWell(
                          onTap: () {
                            User user = users[emailController.text]!;

                            if (user.email == emailController.text &&
                                user.password == passController.text) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Counter()),
                              );
                            } else {
                              print("mail or password is wrong");
                            }
                          },
                          child: Container(
                              padding: EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 182, 112, 14)),
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.login, color: Colors.white),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "Log in",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),
                                  )
                                ],
                              )))
                    ],
                  ))
            ],
          ),
        ));
  }
}

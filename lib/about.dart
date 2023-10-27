import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  @override
 @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
            width: double.maxFinite,
            height: double.maxFinite,
            child: Stack(children: [
              Positioned(
                  left: 0,
                  right: 0,
                child: Container(
              width: double.maxFinite,
              height: 300,
              decoration: const BoxDecoration(
                image: DecorationImage(
                   image: AssetImage('assets/images/yo.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
              Positioned(
                  top: 280,
                  child: Container(
                      padding: const EdgeInsets.all(30),
                      width: MediaQuery.of(context).size.width,
                      height: 500,
                      decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 251, 246, 246),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30))),
                      child: const SingleChildScrollView(
                        padding: EdgeInsets.only(bottom: 100),
                        child: Column(children: [
                          Row(children: [
                            Text('Hamashia Sosa',
                                style: TextStyle(
                                    fontSize: 30,
                                    decoration: TextDecoration.none,
                                    color: Color.fromARGB(244, 217, 101, 136),
                                    fontWeight: FontWeight.bold)),
                          ]),
                          Padding(
                              padding: EdgeInsets.only(top: 25),
                              child: Column(
                                children: [
                                  Row(children: [
                                    Icon(
                                      Icons.person_3,
                                      size: 20,
                                      color: Color.fromARGB(244, 217, 101, 136),
                                    ),
                                    Text('   19 Años',
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.normal,
                                            decoration: TextDecoration.none,
                                            color: Color.fromARGB(
                                               255, 147, 147, 147)))
                                  ]),
                                 SizedBox(height: 10),
                                  Row(children: [
                                    Icon(
                                      Icons.phone_android,
                                      size: 20,
                                      color: Color.fromARGB(244, 217, 101, 136),
                                    ),
                                    Text('   849-000-000',
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.normal,
                                            decoration: TextDecoration.none,
                                            color: Color.fromARGB(
                                                255, 147, 147, 147)))
                                  ]),
                                  SizedBox(height: 10),
                                  Row(children: [
                                    Icon(
                                      Icons.mouse,
                                      size: 20,
                                      color: Color.fromARGB(244, 217, 101, 136),
                                    ),
                                    Text('   Programadora',
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.normal,
                                            decoration: TextDecoration.none,
                                            color: Color.fromARGB(
                                                255, 147, 147, 147)))
                                  ]),
                                   SizedBox(height: 10),
                                  Row(children: [
                                    Icon(
                                      Icons.email_outlined,
                                      size: 20,
                                      color: Color.fromARGB(244, 217, 101, 136),
                                    ),
                                    Text('   hamashiasosa47@gmail.com',
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.normal,
                                            decoration: TextDecoration.none,
                                            color: Color.fromARGB(
                                                255, 147, 147, 147)))
                                  ]),
                                  SizedBox(height: 10),
                                  Row(children: [
                                    Icon(
                                      Icons.portrait,
                                      size: 20,
                                      color: Color.fromARGB(244, 217, 101, 136),
                                    ),
                                    Text('   https://github.com/hamashiasosa',
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.normal,
                                            decoration: TextDecoration.none,
                                            color: Color.fromARGB(
                                                255, 147, 147, 147)))
                                  ]),
                                 
                                ],
                              )),
                        ]),
                      ))),
            ])));
  }
}

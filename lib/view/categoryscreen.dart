import 'package:flutter/material.dart';
import 'package:quizapp/view/dummydb.dart';
import 'package:quizapp/view/homescreen/homescreen.dart';

class Categoryscreen extends StatelessWidget {
  const Categoryscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff16325B),
        centerTitle: true,
        title: const Text('Quizz App'),
        titleTextStyle: const TextStyle(color: Colors.white, fontSize: 28),
      ),
      backgroundColor: Color(0xff16325B),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 18,
            ),

            //title(Lets Play)
            const Text(
              "Let's Play",
              style: TextStyle(
                color: Colors.white,
                fontSize: 26,
              ),
            ),
            const SizedBox(
              height: 20,
            ),

            Divider(
              color: Colors.white,
            ),

            const SizedBox(
              height: 30,
            ),

            //categories

            Expanded(
              child: GridView.builder(
                itemCount: DummyDb.categoreies.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 5,
                    mainAxisExtent: 254,
                    crossAxisCount: 2),
                itemBuilder: (context, index) => SizedBox(
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomeScreen(
                              passindex: index,
                            ),
                          ));
                    },
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(bottom: 30, left: 15),
                          height: 200,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Color(0xff227B94),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(DummyDb.categoreies[index]['CategoryName'],
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                  )),
                              Text(DummyDb.categoreies[index]['QuestionNo'],
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                  )),
                            ],
                          ),
                        ),
                        Positioned(
                          bottom: 150,
                          child: Image.asset(
                              height: 100,
                              DummyDb.categoreies[index]['imageurl']),
                        ),
                        Text('data'),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

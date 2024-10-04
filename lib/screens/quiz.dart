import 'package:flutter/material.dart';
import 'package:guess_app/controllers/question_controller.dart';
import 'package:guess_app/provider/question_provider.dart';
import 'package:guess_app/widgets/main_drawer.dart';
import 'package:guess_app/widgets/quiz_body.dart';
import 'package:provider/provider.dart';

class QuizScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final controller = QuestionController();
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => QuestionProvider()),
        StreamProvider(create: (context) => controller.getQuesions()),
      ],
      child: Scaffold(
        backgroundColor: Colors.purple,
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/img/Logo.png', fit: BoxFit.cover, height: 60.0,),
              Container(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Guess The Word',
                  style: TextStyle(
                    fontFamily: 'Righteous',
                    fontSize: 20.0
                  ),
                ),
              )
            ],
          ),
        ),
        drawer: MainDrawer(),
        body: QuizBody(),
      ),
    );
  }
}
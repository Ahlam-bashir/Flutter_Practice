import 'package:flutter/material.dart';
import 'package:flutter_application_2/input_page.dart';
import 'dart:math';
import 'question.dart';
import 'questionBank.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() {
  runApp(BMICalculator());
}

class BMICalculator extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return MaterialApp(
    home:InputPage(),
    theme:ThemeData.dark().copyWith(
    primaryColor: Color(0xFF0A0E21),
    scaffoldBackgroundColor:  Color(0xFF0A0E21),
    ),
   );
   
  }
}

class Quizzler extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold( backgroundColor: Colors.grey.shade900,
      appBar: AppBar(
        title: Text("Quiz",style: TextStyle(color: Colors.amberAccent,fontSize: 30.0),),
        backgroundColor: Colors.blue,
        ),
      body: SafeArea(
        child: Padding(padding:const EdgeInsets.symmetric(horizontal: 10.0),
        child: QuizPage())))

    );  
  }
}

class QuizPage extends StatefulWidget{
   @override
   _QuizStatePage createState() => _QuizStatePage();
}
class _QuizStatePage extends State<QuizPage>
 with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  Animation<double>? _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller!);
    // Start the animation
    _controller!.forward();
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }
        var  questions = QuestionBank();
         int index=0;
         int score=0;
          var alertStyle = AlertStyle(
      animationType: AnimationType.fromTop,
      isCloseButton: false,
      isButtonVisible: false,
      isOverlayTapDismiss: true,
      descStyle: TextStyle(fontWeight: FontWeight.bold),
      descTextAlign: TextAlign.center,
      animationDuration: Duration(milliseconds: 400),
      alertBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0.0),
        side: BorderSide(
          color: Colors.grey,
        ),
      ),
      titleStyle: TextStyle(
        color: Colors.red,
      ),
      alertAlignment: Alignment.center,
    );
     void onClick(correct){
       if(!questions.isCorrect(correct)){
             Alert(
      context: context,
      style: alertStyle,
      type: AlertType.error,
      title: "Oops! You got it wrong!",
    ).show();
       }else{
            setState(() {
              score+=10;
            });
       }
        setState(() {
              int scoree= questions.nextQuestion();
              print(scoree);
                if(scoree>=0){
        Alert(
      context: context,
      style: alertStyle,
      type: AlertType.success,
      title: "Congratulations!",
      desc: "You have Secured $score Marks").show();


                }
                 }); 
     
  }

  @override 
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
           flex: 5,
          child:Padding(
        padding:EdgeInsets.all(10.0),
         child:Center(
          child: AnimatedBuilder(
            animation: _animation as Animation<double>,
            builder: (context, child) {
            return Opacity(
              opacity: _animation!.value,
              child: Text(questions.getQuestion().toString(),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
            );
              
              
            },
            
          ),
        ),
        )
        ),
         Expanded(child: 
         Padding(
        padding: EdgeInsets.all(15.0),
        child: TextButton(
          
          onPressed: () { 
           
             onClick(true);
             
         
          },
          style:TextButton.styleFrom(backgroundColor: Colors.green),
          child: Text("True",style: TextStyle(color: Colors.white,fontSize: 20.0),)
          ),
        )
        ),
         Expanded(child: Padding(

        padding: EdgeInsets.all(15.0),
        child: TextButton(

           onPressed: () { 
            onClick(false);
          },
          style: TextButton.styleFrom(backgroundColor: Colors.red),
          child: Text("False",
          style: TextStyle(color: Colors.white,fontSize: 20.0),)),
        )
        ),
        
        ],

    );

  }

} 
class BallPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return
    Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      body: Ball(),
      appBar: AppBar(
        title: Text("Ask  me Anything"),
        backgroundColor: Colors.blue,
      ),
    );
  
  }
  
}
class Ball extends StatefulWidget{
     @override 
    _BallPageState createState() =>_BallPageState();
}
class _BallPageState extends State<Ball>{
   int ballNumber=1;
    @override Widget build(BuildContext context) {
    return  
    Center(
      child: Container(
         child: TextButton(
          onPressed: () {
           setState(() {
             ballNumber=Random().nextInt(5)+1;
           });
          },
          child: Image.asset('images/ball$ballNumber.png')),
          
        ),
    );
   
  }
}
class DicePage extends StatefulWidget {
   @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  var leftDiceNumber=1;
  void changeDiceNumber(){
 setState(() {
leftDiceNumber=Random().nextInt(6)+1;
});
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          Expanded(
            child: TextButton(
              onPressed: () {
             changeDiceNumber();
                // Add onPressed logic here
              },
              child: Image.asset('images/dice$leftDiceNumber.png'),
            ),
          ),
          Expanded(
            child: TextButton(
               onPressed: () {
                // Add onPressed logic here
              },
              child: Image.asset('images/dice$leftDiceNumber.png'),
            ),
          ),
        ],
      ),
    );
  }
}
// class DicePage extends StatelessWidget {
 
// }

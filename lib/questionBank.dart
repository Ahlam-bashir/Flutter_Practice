import 'question.dart';

class QuestionBank{
     int index=0;
     int score=0;

     List<Questions> _questions=[
      Questions(q:"Is Dart dynamically typed Language?",a:false),
      Questions(q:'Is Flutter developed by Google?',a:true),
      Questions(q:"Is Statefull widget mutable?",a:false),
      Questions(q: "Is Dart an interpreted language?", a: false),
      Questions(q: "Does Flutter support hot reload functionality?", a: true),
      Questions(q: "Is Dart single-threaded by default?", a: true),
      Questions(q: "Does Flutter use native components for rendering UI?", a: false),
      Questions(q: "Can Flutter apps be developed using only the Dart programming language?", a: true),
      Questions(q: "Is Dart a compiled language?", a: true),
      Questions(q: "Does Flutter use a virtual DOM for rendering UI?", a: false),
      Questions(q: "Can Flutter apps run on Windows and macOS platforms?", a: true),
      Questions(q: "Is the Flutter framework written in Java?", a: false),
      Questions(q: "Can Dart be used for both frontend and backend development?", a: true)
    ];

      String? getQuestion(){
       return _questions[index].questionText;  
     }

     int nextQuestion(){
        if(index<_questions.length-1){
          index++; 
         return -1;
        }else{
          return score;
        
        }
     }
    
     bool isCorrect(answer){
        if(_questions[index].answer==answer){
          score+=10;
          return true;
        }else {
          return false;
        }


     }

    

  

}
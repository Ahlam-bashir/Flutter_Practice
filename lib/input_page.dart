import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const bottomContainerHeight=80.0;
const activeCardColor=Color(0xFF1D1E33);
const bottomContainerColor=Color(0xFFEB1555);
class InputPage extends StatefulWidget{
  @override 
  _InputPageState createState() => _InputPageState();
}
class _InputPageState extends State<InputPage>{
  @override 
  Widget build(BuildContext context) {
   return Scaffold(
    appBar: AppBar(title:const Text("BMI Calculator")),
    body:Column(children: 
    [
        Expanded(child: Row(children: [
        Expanded(child:ReusableCard(colour:activeCardColor,
        cardChild: 
        Body(),
        )
        ),
        Expanded(child: ReusableCard(colour:activeCardColor,cardChild: 
        Body()
        )),
    ],)),
         Expanded(child: ReusableCard(colour:activeCardColor,cardChild: 
         Body()
        ),),

         Expanded(child: Row(children: [
        Expanded(child: ReusableCard(colour:activeCardColor,cardChild: 
         Body(),),
        ),
        Expanded(child:ReusableCard(colour:activeCardColor,cardChild: 
         Body(),),
        ),

    ],)),
    Container(
      color: bottomContainerColor,
      margin: EdgeInsets.only(top: 10.0),
      width: double.infinity,
      height: bottomContainerHeight,
      child: Center(child: Text("Calculate"),),
    )

    ]
    
    ,)
   
   );
  }

}

class Body extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
    Icon(FontAwesomeIcons.mars,size: 80.0),
    SizedBox(height: 15.0,),
    Text('MALE',style: TextStyle(fontSize: 18.0,color: Color(0xFF8D8E98)),)
    ]
    );
  }
}

class ReusableCard extends StatelessWidget {
  
  ReusableCard({required this.colour,required this.cardChild});
  final Color colour;
  final Widget cardChild;

  @override
  Widget build(BuildContext context) {
    return Container(
         
           decoration: BoxDecoration(
           color: colour,
           borderRadius: BorderRadius.circular(10),
          ),
          margin: EdgeInsets.all(15.0),
            child: cardChild,
          
        );
  }
}


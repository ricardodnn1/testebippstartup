

import 'package:flutter/material.dart';
import 'package:testebippstartup/app/views/home/componet/trainingListView.dart';

class HomeView extends StatelessWidget {
  
  final TrainingListView trainingListView = TrainingListView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(MediaQuery.of(context).size.height*0.32),
        child: ClipRRect(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15.0), bottomRight: Radius.circular(15.0)),
          child: Container(
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.6),
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: Colors.black54,
                    blurRadius: 15.0,
                    offset: Offset(0.0, 0.75)
                )
              ],
              image: DecorationImage(
                  image: AssetImage('assets/images/bg-home.png'),
                  fit: BoxFit.cover,
              ),
            ),
            child: Column(
              children: [
                AppBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  actions: [
                     Container(
                       width: MediaQuery.of(context).size.width,
                       child: Row(
                         mainAxisSize: MainAxisSize.max,
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                           RaisedButton(
                             padding: EdgeInsets.all(0),
                             elevation: 8,
                             color: Colors.transparent,
                               onPressed: (){

                               },
                               child: Image.asset('assets/images/main_icon.png', filterQuality: FilterQuality.high, height: 36),
                           ),
                           RaisedButton(
                             padding: EdgeInsets.all(0),
                             elevation: 0,
                             color: Colors.transparent,
                             onPressed: (){

                             },
                             child: Image.asset('assets/images/menu.png', filterQuality: FilterQuality.high, height: 30),
                           )
                         ],
                       ),
                     )
                  ],
                ),
                Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                        Divider(height: MediaQuery.of(context).size.height*0.08, color: Colors.transparent,),
                        Text('Cursos e treinamentos'.toUpperCase(), style: TextStyle(fontSize: 26, fontWeight: FontWeight.w900, color: Colors.deepOrange)),
                        Divider(height: 8, color: Colors.transparent,),
                        Text('Selecione o curso ou treinamento\nque deseja', textAlign: TextAlign.center, softWrap: true, maxLines: 2, style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: Colors.white))
                    ],
                  ),
                )
              ],
            )
          ),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Color(0xFFEEEEEE),
        child: PageView(
            physics: NeverScrollableScrollPhysics(),
            children: [

                SingleChildScrollView(
                  child: trainingListView.trainingList(context)
                )

            ],
        ),
      ),
    );
  }
}

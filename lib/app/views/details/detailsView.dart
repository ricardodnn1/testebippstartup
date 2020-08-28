import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:testebippstartup/app/views/home/homeView.dart';

class DetailsView extends StatefulWidget {

  final int id;
  final String name;
  DetailsView({Key key, @required this.id, @required this.name}) : super(key: key);

  @override
  _DetailsViewState createState() => _DetailsViewState();
}

class _DetailsViewState extends State<DetailsView> {
  List data;

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
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => HomeView()),
                                  );
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
                          Divider(height: MediaQuery.of(context).size.height*0.01, color: Colors.transparent,),
                          Container(
                            width: 36,
                            child: Center(
                              child: RaisedButton(
                                  padding: EdgeInsets.all(0),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                      side: BorderSide(color: Colors.white)
                                  ),
                                  color: Colors.transparent,
                                  onPressed: (){
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => HomeView()),
                                    );
                                  },
                                  child: Icon(Icons.arrow_back_ios,size: 22, color: Colors.white),
                               ),
                            ),
                          ),
                          Divider(height: 18, color: Colors.transparent,),
                          Text('${widget.name}'.toUpperCase(), textAlign: TextAlign.center, softWrap: true, style: TextStyle(fontSize: 26, fontWeight: FontWeight.w900, color: Colors.deepOrange)),
                          Divider(height: 8, color: Colors.transparent,),
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
              FutureBuilder(
                  future: DefaultAssetBundle.of(context).loadString('assets/database/database.json'),
                  builder: (context, snapshot) {
                      var listData = json.decode(snapshot.data.toString());
                      var list = [];

                      for(var i in listData[widget.id - 1]['images']) {
                        list.add(i['image']);
                      }

                      return Container(
                        height: MediaQuery.of(context).size.height,
                        margin: EdgeInsets.only(top: 30.0, left: 14.0, right: 14.0),
                        padding: EdgeInsets.all(18),
                        color: Color(0xFFFFFFFF),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(listData[widget.id - 1]['description'], softWrap: true, style: TextStyle(fontSize: 14, color: Colors.black)),
                              Divider(height: 10, color: Colors.transparent),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Container(
                                        width: MediaQuery.of(context).size.width*0.40,
                                        child: Image.asset(list[0])
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Container(
                                        width: MediaQuery.of(context).size.width*0.40,
                                        child: Image.asset(list[1])
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      );
              }),

            ],
          ),
        ),
      );
    }
}

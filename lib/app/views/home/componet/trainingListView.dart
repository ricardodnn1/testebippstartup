import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:testebippstartup/app/views/details/detailsView.dart';

class TrainingListView {
  List data;

  Widget trainingList(BuildContext context) {
      return Container(
        height: MediaQuery.of(context).size.height,
        margin: EdgeInsets.only(top: 30.0, left: 14.0, right: 14.0),
        color: Color(0xFFFFFFFF),
        child: FutureBuilder(
            future: DefaultAssetBundle.of(context).loadString('assets/database/database.json'),
            builder: (context, snapshot) {
              var listData = json.decode(snapshot.data.toString());
              return ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetailsView(id: int.parse(listData[index]['id']), name: listData[index]['training'],)),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border(bottom: BorderSide(color: Colors.grey.withOpacity(0.2), width: 1)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Center(
                              child: Container(
                                width: MediaQuery.of(context).size.width*0.55,
                                child: Text(listData[index]['training'], softWrap: true, maxLines: 4, style: TextStyle(fontSize: 17, color: Colors.black, fontWeight: FontWeight.w600)),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width*0.30,
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.asset(listData[index]['images'][0]['image'])),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
                itemCount: listData == null ? 0 : listData.length,
              );
            }),
        );
      }

}
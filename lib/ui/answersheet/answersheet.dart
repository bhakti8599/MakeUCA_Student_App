
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:untitled1/viewmodel/assignmentviewmodel.dart';

AssignmentViewModel assignmentViewModel=AssignmentViewModel();

class AnswerSheetUI extends StatefulWidget {
  @override
  _AnswerSheetUIState createState() => _AnswerSheetUIState();
}

class _AnswerSheetUIState extends State<AnswerSheetUI> {
  @override
  void initState() {
    // TODO: implement initState
    assignmentViewModel.getAssignment();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            title: Row(
              children: [
                SizedBox(
                  width: 55,
                ),
                Text(
                  'Answer Sheets',
                  style: Theme.of(context).textTheme.subtitle1!.copyWith(
                      color: Color(0XFF000000), fontWeight: FontWeight.bold),
                ),
              ],
            ),
            leading: InkWell(
              onTap: (){
                setState(() {
                  Navigator.pop(context);
                });
              },
              child: Icon(
                Icons.arrow_back,
                color: Color(0XFF000000),
                size: 32,
              ),
            ),
          ),
          body: Container(
              child: Observer(
                builder: (_) =>
                    Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Center(
                                child: Text(
                                  'Download Sample Answer Sheets',
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle2!
                                      .copyWith(
                                      color: Color(0XFF000000),
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 14,
                          ),

                          if (!assignmentViewModel.isLoading) Expanded(

                            child: Container(
                              height: MediaQuery.of(context).size.height,
                              child: ListView.builder(
                                  itemCount: 6,

                                  itemBuilder: (ctx, position) {
                                    return Container(
                                      color: Colors.white,
                                      padding: EdgeInsets.all(16),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            width: 60,
                                            height: 60,
                                            //color: Colors.white,
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                  color: Color(0XFF000000),
                                                ),
                                                borderRadius:
                                                BorderRadius.all(Radius.circular(10))),
                                            child: Center(
                                              child: Image.asset(
                                                "assets/images/answer_light.png",
                                                height: 40,
                                                width: 40,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 20,
                                          ),
                                          Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text('Test ${position+1}',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .subtitle1!
                                                      .copyWith(color: Color(0XFF000000))),
                                            ],
                                          ),
                                          new Spacer(),
                                          Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Image.asset(
                                                "assets/images/11.png",
                                                height: 30,
                                                width: 30,
                                                color: Color(0XFF000000),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),

                                    );
                                  }

                              ),
                            ),


                          ) else SizedBox(height: 50, child: CircularProgressIndicator()),


                        ]
                    ),
              )


          ),
        ));
  }
}

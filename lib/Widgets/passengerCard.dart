import 'package:flutter/material.dart';
import 'package:task/Models/Passanger.dart';
import 'package:provider/provider.dart';
import 'package:task/Models/demoData.dart';

class PassengerCard extends StatefulWidget {
  PassengerModel passenger;
  PassengerCard({this.passenger});

  @override
  _PassengerCardState createState() => _PassengerCardState();
}

class _PassengerCardState extends State<PassengerCard> {
  PassengerModel _currentUser;

  @override
  Widget build(BuildContext context) {
    _currentUser = Provider.of<DemoData>(context).currentUser;

    print(widget.passenger.id);
    // return Consumer<DemoData>(builder: (context, demoData, child) {
    return Container(
      padding: EdgeInsets.all(15),
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0.0, 0.2), //(x,y)
            blurRadius: 1.0,
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              if (widget.passenger.fellow[_currentUser.id] == 1) {
                context.read<DemoData>().chatWithUser(widget.passenger.id);
                Navigator.pushNamed(context, '/chat');
              }
            },
            child: Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.person_outline,
                    size: 25,
                  ),
                  SizedBox(
                    width: 7,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            widget.passenger.name,
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            "XXXXXXXX${widget.passenger.id}",
                            style: TextStyle(
                              fontSize: 10,
                              color: Colors.black54,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        widget.passenger.designation,
                        style: TextStyle(fontSize: 14, color: Colors.black54),
                      ),
                      Text(
                        widget.passenger.company,
                        style: TextStyle(fontSize: 12, color: Colors.black38),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              !widget.passenger.fellow.containsKey(_currentUser.id) ||
                      widget.passenger.fellow[_currentUser.id] == 0
                  ? InkWell(
                      child: Icon(
                        Icons.add,
                        size: 30,
                      ),
                      onTap: () {
                        context
                            .read<DemoData>()
                            .requestConnection(widget.passenger.id);
                      },
                    )
                  : widget.passenger.fellow[_currentUser.id] == 1
                      ? InkWell(
                          child: Icon(
                            Icons.done,
                            size: 30,
                            color: Colors.orangeAccent,
                          ),
                        )
                      : widget.passenger.fellow[_currentUser.id] == 2
                          ? InkWell(
                              child: Icon(
                                Icons.loop_rounded,
                                size: 30,
                                color: Colors.red,
                              ),
                              onTap: () {
                                context
                                    .read<DemoData>()
                                    .undoRequest(widget.passenger.id);
                              },
                            )
                          : Row(
                              children: [
                                InkWell(
                                  child: Icon(
                                    Icons.person_remove_outlined,
                                    size: 30,
                                    color: Colors.red,
                                  ),
                                  onTap: () {
                                    context
                                        .read<DemoData>()
                                        .rejectRequest(widget.passenger.id);
                                  },
                                ),
                                SizedBox(
                                  width: 25,
                                ),
                                InkWell(
                                  child: Icon(
                                    Icons.person_add_outlined,
                                    size: 30,
                                    color: Colors.orangeAccent,
                                  ),
                                  onTap: () {
                                    context
                                        .read<DemoData>()
                                        .acceptRequest(widget.passenger.id);
                                  },
                                ),
                              ],
                            ),
              SizedBox(
                height: 10,
              ),
              !widget.passenger.fellow.containsKey(_currentUser.id)
                  ? Text(
                      "Tap to connect",
                      style: TextStyle(fontSize: 10, color: Colors.black87),
                    )
                  : widget.passenger.fellow[_currentUser.id] == 1
                      ? Text(
                          "Connected",
                          style: TextStyle(fontSize: 10, color: Colors.black87),
                        )
                      : widget.passenger.fellow[_currentUser.id] == 2
                          ? Text(
                              "Undo request",
                              style: TextStyle(
                                  fontSize: 10, color: Colors.black87),
                            )
                          : Text(
                              "${widget.passenger.name} has requested to connect",
                              style: TextStyle(
                                  fontSize: 10, color: Colors.black87),
                            ),
            ],
          ),
        ],
      ),
    );
    // });
  }
}

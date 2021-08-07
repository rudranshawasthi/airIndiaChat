import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:task/Models/demoData.dart';
import 'package:provider/provider.dart';
import 'package:task/Models/Passanger.dart';
import 'package:task/Widgets/messageTile.dart';
import 'package:task/Widgets/sugestionText.dart';
import 'package:task/Models/messages.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key key}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  PassengerModel chatWith;
  TextEditingController messageEditingController = new TextEditingController();
  List<String> sugestText = [
    'Hi',
    "How are you?",
    'Would you like to have a buissness chat?'
  ];

  List<Messages> messages = [];
  @override
  void initState() {
    chatWith = context.read<DemoData>().data[context.read<DemoData>().chatWith];
    messages = [
      Messages(
        sendId: chatWith.id,
        reciveId: '0',
        text: 'Hello',
        time: DateTime.now().subtract(
          Duration(minutes: 5),
        ),
      ),
      Messages(
        sendId: '0',
        reciveId: chatWith.id,
        text: 'Hello',
        time: DateTime.now().subtract(
          Duration(minutes: 5),
        ),
      ),
      Messages(
        sendId: '0',
        reciveId: chatWith.id,
        text: 'Thanks for connecting',
        time: DateTime.now().subtract(
          Duration(minutes: 5),
        ),
      ),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          bottom: PreferredSize(
              child: Container(
                color: Colors.grey[400],
                height: 1.0,
              ),
              preferredSize: Size.fromHeight(1.0)),
          toolbarHeight: 60,
          leading: InkWell(
            child: Icon(
              Icons.arrow_back,
              color: Colors.black,
              size: 25,
            ),
            onTap: () => Navigator.of(context).pop(),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          title: Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.person_outline,
                  size: 25,
                  color: Colors.black,
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
                          chatWith.name,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "XXXXXXXX${chatWith.id}",
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.black54.withOpacity(.5),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Text(
                      chatWith.designation,
                      style: TextStyle(fontSize: 13, color: Colors.black54),
                    ),
                    Text(
                      chatWith.company,
                      style: TextStyle(fontSize: 11, color: Colors.black38),
                    ),
                  ],
                ),
              ],
            ),
          ),
          actions: [
            Container(
              padding: EdgeInsets.only(right: 10),
              child: InkWell(
                child: Icon(
                  Icons.close,
                  color: Colors.black,
                  size: 25,
                ),
                onTap: () {},
              ),
            ),
          ],
        ),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: ListView.builder(
                    itemCount: messages.length,
                    itemBuilder: (context, index) {
                      print(messages.length);
                      return MessageTile(
                        message: messages[index].text,
                        sendByMe: context.read<DemoData>().currentUser.id ==
                            messages[index].sendId,
                      );
                    }),
              ),
              Container(
                alignment: Alignment.bottomCenter,
                height: 45,
                child: ListView.builder(
                  itemBuilder: (context, index) =>
                      SuggestionText(text: sugestText[index]),
                  itemCount: sugestText.length,
                  scrollDirection: Axis.horizontal,
                ),
              ),
              Container(
                alignment: Alignment.bottomCenter,
                width: MediaQuery.of(context).size.width,
                child: Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 20),
                  color: Color(0x54FFFFFF),
                  child: Expanded(
                    child: TextField(
                      controller: messageEditingController,
                      style: TextStyle(color: Colors.black87, fontSize: 16),
                      onSubmitted: (val) {
                        addMessage();
                      },
                      decoration: InputDecoration(
                        hintText: "Tap to Type",
                        hintStyle: TextStyle(
                          color: Colors.black54.withOpacity(.2),
                          fontSize: 16,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black54,
                          ),
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey,
                          ),
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  addMessage() {
    if (messageEditingController.text.isNotEmpty) {
      messages.add(Messages(
        sendId: context.read<DemoData>().currentUser.id,
        reciveId: chatWith.id,
        text: messageEditingController.text,
        time: DateTime.now(),
      ));
      setState(() {
        messageEditingController.text = "";
      });
    }
  }
}

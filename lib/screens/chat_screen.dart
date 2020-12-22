import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants.dart';
import 'login_screen.dart';

class ChatScreen extends StatefulWidget
{
  static const String id="chat_screen";
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen>
{

  final messagecontroller=TextEditingController();
  // ignore: deprecated_member_use
  final _firestore=Firestore.instance;
  final _auth=FirebaseAuth.instance;
  // ignore: deprecated_member_use
  FirebaseUser Loggedinuser;

  String messagetext;

  void messagestream() async
  {
    await for(var snapshot in _firestore.collection('messages').snapshots())
      {
        // ignore: deprecated_member_use
        for(var message in snapshot.documents)
          {
            print(message.data);
          }
      }
  }


  void getmessages() async
  {

    // ignore: deprecated_member_use
    final messages=await _firestore.collection('messages').getDocuments();
    // ignore: deprecated_member_use
    for(var message  in messages.documents)
      {
        print(message);
      }
  }

  void getcurrentuser() async
  {
     final user=await _auth.currentUser;
     if(user!=null)
       {
         Loggedinuser=user;
         print(Loggedinuser.email);
       }
  }
  @override
  void initState()
  {

    super.initState();
    getcurrentuser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.white,
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.close),
              onPressed: () async
              {
                SharedPreferences sp=await SharedPreferences.getInstance();
                sp.remove('email');
                messagestream();
                Navigator.pop(context,LoginScreen.id);
                //Implement logout functionality
              }),
        ],
        title: Text('⚡️Chat'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SafeArea(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            StreamBuilder<QuerySnapshot>(
              stream: _firestore.collection('messages').snapshots(),
                builder: (context,snapshot) {
                  if (!snapshot.hasData)
                  {
              return Center(
              child: CircularProgressIndicator(
              backgroundColor: Colors.lightBlueAccent,
              )
              );
              }
                    final messages = snapshot.data.docs.reversed;
                    List<MessageBubble> messageWidgets = [];

                    for (var msg in messages) {
                      final messaget = msg.data()['text'];
                      final messaged = msg.data()['sender'];
                      final curr=kemail;

                      final messageBubble = MessageBubble(
                          sender: messaged
                          ,text: messaget,
                           isMe: curr==messaged,
                           );
                      messageWidgets.add(messageBubble);

                    }
                  return Expanded(
                      child:ListView(
                        reverse: true,
                    children: messageWidgets,
                  ),
                  );
                }
            ),
            Container(
              decoration: kMessageContainerDecoration,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextField(

                      controller: messagecontroller,
                      onChanged: (value)
                      {
                         messagetext=value;
                        //Do something with the user input.
                      },
                      decoration: kMessageTextFieldDecoration,
                    ),
                  ),
                  FlatButton(
                    onPressed: ()
                    {
                      messagecontroller.clear();
                      _firestore.collection('messages').add(
                        {
                          'text':messagetext,
                          'sender':kemail,
                        }
                      );
                      //Implement send functionality.
                    },
                    child: Text(
                      'Send',
                      style: kSendButtonTextStyle,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MessageBubble extends StatelessWidget
{


  MessageBubble({this.sender,this.text,this.isMe});

  String sender;
  String text;
  final bool isMe;

  @override
  Widget build(BuildContext context)
  {
    return Column(
      crossAxisAlignment:isMe?  CrossAxisAlignment.end:CrossAxisAlignment.start,

       children:<Widget>[
         Text(sender,style: TextStyle(
           fontSize: 12,
           color: Colors.white,
         ),),
       Padding(
        padding: EdgeInsets.all(10),
        child: Material(

          elevation: 5,
          borderRadius: BorderRadius.circular(30.0),
          color: isMe? Colors.lightBlue:Colors.brown,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 15,horizontal: 25),
            child: Text(
              '$text',
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
              ),
            ),
          ),
        ),
      ),
            ],
    );


  }
}

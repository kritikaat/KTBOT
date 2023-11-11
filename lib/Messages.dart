import 'package:flutter/material.dart';

class Messagesscreen extends StatefulWidget{
  final List messages;
  const Messagesscreen ({super.key, required this.messages});

  @override
  _MessageState createState() => _MessageState();

}

class _MessageState extends State<Messagesscreen> {
  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    return ListView.separated(itemBuilder:(context, index){
      return Container(
        margin: EdgeInsets.all(10),
        child: Row(
            mainAxisAlignment: widget.messages[index]['isUserMessage']?MainAxisAlignment.end:MainAxisAlignment.start,
            children: [
                  Container(
                      padding: EdgeInsets.symmetric(vertical: 14, horizontal: 14),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(
                              20,
                            ),
                            topRight: Radius.circular(20),
                            bottomRight: Radius.circular(
                                widget.messages[index]['isUserMessage'] ? 0 : 20),
                            topLeft: Radius.circular(
                                widget.messages[index]['isUserMessage'] ? 20 : 0),
                          ),
                          color: widget.messages[index]['isUserMessage']
                              ? Colors.grey.shade800
                              : Colors.grey.shade900.withOpacity(0.8)),
                      constraints: BoxConstraints(maxWidth: w * 2 / 3),
                      child:
                          Text(widget.messages[index]['message'].text.text[0])),
                ]
      
        ),
      );
    } , separatorBuilder:(_, i)=>Padding(padding: EdgeInsets.only(top: 10)), itemCount: widget.messages.length);
  }
}
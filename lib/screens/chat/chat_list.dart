import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:driver_app/models/driver_model.dart';
import 'package:driver_app/models/user_model.dart';
import 'package:driver_app/screens/chat/chat_room.dart';
import 'package:driver_app/screens/chat/model/chat_room_model.dart';
import 'package:driver_app/screens/chat/model/firebase_helper.dart';
import 'package:driver_app/screens/chat/model/message_model.dart';
import 'package:driver_app/screens/chat/model/user_model.dart';
import 'package:driver_app/widgets/appbar_custome.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatList extends StatefulWidget {
  ChatList({Key? key}) : super(key: key);

  @override
  State<ChatList> createState() => _ChatListState();
}

class _ChatListState extends State<ChatList> {
  var uid = FirebaseAuth.instance.currentUser!.uid;
  DriverModel? driverModel;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  getData() async {
    driverModel = await FirebaseHelper.getDriverModelById(uid);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, "Chats".tr),
      body: SafeArea(
        child: Container(
          child: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection("chatrooms")
                .where("participants.${uid}", isEqualTo: true)
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.active) {
                if (snapshot.hasData) {
                  QuerySnapshot chatRoomSnapshot =
                      snapshot.data as QuerySnapshot;

                  return ListView.builder(
                    itemCount: chatRoomSnapshot.docs.length,
                    itemBuilder: (context, index) {
                      ChatRoomModel chatRoomModel = ChatRoomModel.fromMap(
                          chatRoomSnapshot.docs[index].data()
                              as Map<String, dynamic>);
                      print(chatRoomModel.chatroomid.toString());
                      Map<String, dynamic> participants =
                          chatRoomModel.participants!;

                      List<String> participantKeys = participants.keys.toList();

                      participantKeys.remove(uid);
                      print('uid: $uid');
                      print('participantKeys: $participantKeys');

                      return FutureBuilder(
                        future:
                            FirebaseHelper.getUserModelById(participantKeys[0]),
                        builder: (context, userData) {
                          if (userData.connectionState ==
                              ConnectionState.done) {
                            if (userData.data != null) {
                              UserModel targetUser = userData.data as UserModel;

                              print(targetUser.email.toString());
                              print(targetUser.fullname.toString());
                              print(targetUser.profilepic.toString());

                              return ListTile(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) {
                                      return ChatRoom(
                                          // chatroom: chatRoomModel,
                                          // firebaseUser: widget.firebaseUser,
                                          // DriverModel: widget.DriverModel,
                                          // targetUser: targetUser,
                                          chatRoom: chatRoomModel,
                                          userModel: ChatDriverModel(
                                              uid: uid,
                                              fullname: driverModel!.fullName
                                                  .toString(),
                                              email:
                                                  driverModel!.email.toString(),
                                              profilepic:
                                                  driverModel!.dp.toString()),
                                          targetUser: ChatDriverModel(
                                              uid: targetUser.uid,
                                              fullname: targetUser.fullname
                                                  .toString(),
                                              email:
                                                  targetUser.email.toString(),
                                              profilepic: targetUser.profilepic
                                                  .toString()));
                                    }),
                                  );
                                },
                                leading: CircleAvatar(
                                  maxRadius: 30,
                                  backgroundImage: NetworkImage(
                                      targetUser.profilepic.toString()),
                                ),
                                title: Text(targetUser.fullname.toString()),
                                // trailing: Text(targetUser.toString()),
                                subtitle: (chatRoomModel.lastMessage
                                            .toString() !=
                                        "")
                                    ? Text(chatRoomModel.lastMessage.toString())
                                    : Text(
                                        "Say hi to your new friend!",
                                        style: TextStyle(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .secondary,
                                        ),
                                      ),
                              );
                            } else {
                              return Container(
                                child: Center(
                                  child: Text(""),
                                ),
                              );
                            }
                          } else {
                            return Container(
                              child: Center(
                                child: Text(""),
                              ),
                            );
                          }
                        },
                      );
                    },
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text(snapshot.error.toString()),
                  );
                } else {
                  return Center(
                    child: Text("No Chats"),
                  );
                }
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}

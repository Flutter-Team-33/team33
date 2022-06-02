import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:team33_app/authentication/welcome_page.dart';
import 'package:team33_app/model/me_post_json.dart';
import 'package:team33_app/model/user_model.dart';
import 'package:team33_app/components/color.dart';

class ProfilePageee extends StatefulWidget {
  const ProfilePageee({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePageee> {
  bool isPhoto = true;
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      this.loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: PreferredSize(
          child: getAppBar(), preferredSize: Size.fromHeight(180)),
      body: getBody(),
    );
  }

  Widget getAppBar() {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        AppBar(
            automaticallyImplyLeading: false,
            elevation: 5,
            backgroundColor: grimsi,
            flexibleSpace: SafeArea(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(color: black)),
                    child: Center(
                      child: Container(
                        width: 70,
                        height: 70,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(30),
                            image: DecorationImage(
                                image: NetworkImage(
                                    "https://i.pinimg.com/474x/85/3a/a1/853aa15172905546dfd4ca5729e4a661.jpg"),
                                fit: BoxFit.fill)),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "${loggedInUser.firstName} ${loggedInUser.secondName}",
                  style: TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold, color: white),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "${loggedInUser.email}",
                  style: TextStyle(fontSize: 15, color: white),
                ),
              ],
            ))),
        Padding(
          padding: const EdgeInsets.fromLTRB(12, 19, 12, 12),
          child: InkWell(
            onTap: () {
              logout(context);
            },
            child: Container(
                child: Icon(
              Icons.exit_to_app,
              color: white,
            )),
          ),
        ),
      ],
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Text(
                    "Posts",
                    style: TextStyle(fontSize: 15, color: grimsi),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    "35",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    "Followers",
                    style: TextStyle(fontSize: 15, color: grimsi),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    "1,552",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    "Follow",
                    style: TextStyle(fontSize: 15, color: grimsi),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    "182",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              )
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                  onPressed: () {
                    setState(() {
                      isPhoto = true;
                    });
                  },
                  icon: Icon(
                    Icons.photo_size_select_actual, //Foundation.photo,
                    size: 30,
                    color: isPhoto ? bluegre : black,
                  )),
              IconButton(
                  onPressed: () {
                    setState(() {
                      isPhoto = false;
                    });
                  },
                  icon: Icon(
                    Icons.favorite_rounded, // Foundation.play_video,
                    size: 30,
                    color: !isPhoto ? primary : grimsi,
                  ))
            ],
          ),
          SizedBox(
            height: 30,
          ),
          isPhoto
              ? Wrap(
                  spacing: 15,
                  runSpacing: 15,
                  children: List.generate(mePostList.length, (index) {
                    return Container(
                      width: (size.width - 60) / 2,
                      height: (size.width - 60) / 2,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                              image: NetworkImage(mePostList[index]),
                              fit: BoxFit.cover)),
                    );
                  }),
                )
              : Wrap(
                  spacing: 15,
                  runSpacing: 15,
                  children: List.generate(mePostList1.length, (index) {
                    return GestureDetector(
                      onTap: () {
                        // playVideo(context, meVideoList[index]['videoUrl']);
                      },
                      child: Container(
                        width: (size.width - 60) / 2,
                        height: (size.width - 60) / 2,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                                image: NetworkImage(mePostList1[index]),
                                fit: BoxFit.cover)),
                        child: Center(
                          child: Icon(
                            Icons.favorite, // AntDesign.playcircleo,
                            size: 40,
                            color: white,
                          ),
                        ),
                      ),
                    );
                  }),
                )
        ],
      ),
    );
  }

  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => WelcomePage()));
  }
}

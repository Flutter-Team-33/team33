import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:team33_app/components/color.dart';
import 'package:team33_app/components/search_bar.dart';
import 'package:team33_app/model/user_model.dart';
import 'package:team33_app/service/list_service.dart';

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  ListService _statusService = ListService();
  bool isExpanded = false;
  final pageController = PageController(viewportFraction: 0.8);
  int pageIndex = 0;
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
    var size = MediaQuery.of(context).size;
    var size1 = MediaQuery.of(context).size;
    return StreamBuilder<QuerySnapshot>(
      stream: _statusService.getStatus(),
      builder: (context, snaphot) {
        return !snaphot.hasData
            ? const Center(child: CircularProgressIndicator())
            : Scaffold(
                body: Container(
                  color: grimsi,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: Container(
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            height: 30,
                          ),
                          const SearchBar(),
                          Container(
                            height: 498,
                            child: PageView.builder(
                              controller: pageController,
                              itemCount: snaphot.data!.docs.length,
                              itemBuilder: (context, index) {
                                DocumentSnapshot mypost =
                                    snaphot.data!.docs[index];
                                onPageChanged:
                                (index) {
                                  setState(() => pageIndex = index);
                                };
                                return Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    AnimatedPositioned(
                                      duration: Duration(milliseconds: 500),
                                      bottom: isExpanded ? 40 : 100,
                                      width: isExpanded
                                          ? size.width * 0.71
                                          : size.width * 0.6,
                                      height: isExpanded
                                          ? size.height * 0.58
                                          : size.height * 0.5,
                                      child: Container(
                                        decoration: const BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10)),
                                        ),
                                        padding: const EdgeInsets.all(8),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Text(
                                              "${mypost['not']}",
                                              style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: grimsi,
                                                fontSize: 20,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 17,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  children: [
                                                    CircleAvatar(
                                                      child: Image.asset(
                                                          "assets/images/profil.jpg"),
                                                      maxRadius: 15,
                                                      minRadius: 4,
                                                    ),
                                                    SizedBox(
                                                      width: 7,
                                                    ),
                                                    Text(
                                                      "${loggedInUser.firstName} ${loggedInUser.secondName}",
                                                      style: const TextStyle(
                                                        color: Colors.black45,
                                                        fontSize: 14,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Icon(
                                                        Icons.favorite_outline),
                                                    SizedBox(
                                                      width: 9,
                                                    ),
                                                    Icon(Icons
                                                        .mode_comment_outlined),
                                                    SizedBox(
                                                      width: 7,
                                                    ),
                                                    Icon(Icons
                                                        .arrow_forward_ios_rounded),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            const SizedBox(height: 8),
                                          ],
                                        ),
                                      ),
                                    ),
                                    AnimatedPositioned(
                                      duration: Duration(milliseconds: 500),
                                      bottom: isExpanded ? 150 : 100,
                                      child: GestureDetector(
                                        onPanUpdate: onPanUpdate,
                                        onTap: () {},
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 13),
                                          height: size1.height * 0.5,
                                          width: size1.width * 0.71,
                                          decoration: BoxDecoration(
                                            /*    boxShadow: [
                                              BoxShadow(
                                                  color: Colors.black26,
                                                  blurRadius: 0.01,
                                                  spreadRadius: 0.01),
                                            ], */
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(8)),
                                          ),
                                          child: Stack(
                                            alignment: Alignment.topCenter,
                                            children: [
                                              SizedBox.expand(
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(17)),
                                                  child: Image.network(
                                                      (mypost['image']),
                                                      fit: BoxFit.cover),
                                                ),
                                              ),
                                              Container(
                                                width: 141,
                                                height: 14,
                                                color: grimsi,
                                              ),
                                              Container(
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Container(
                                                      width: 140,
                                                      height: 30,
                                                      decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color: grimsi,
                                                            width: 4),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(18),
                                                        color: grimsi,
                                                      ),
                                                      child: const Center(
                                                        child: Text(
                                                          ("Category Name"),
                                                          style: TextStyle(
                                                            color: white,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 15,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
      },
    );
  }

  void onPanUpdate(DragUpdateDetails details) {
    if (details.delta.dy < 0) {
      setState(() {
        isExpanded = true;
      });
    } else if (details.delta.dy > 0) {
      setState(() {
        isExpanded = false;
      });
    }
  }
}

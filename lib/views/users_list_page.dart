import 'package:enjaz_flutter_task/locator.dart';
import 'package:enjaz_flutter_task/view_models/list_of_users_view_model.dart';
import 'package:enjaz_flutter_task/view_models/log_in_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class UsersListPage extends StatefulWidget {
  @override
  _UsersListPageState createState() => _UsersListPageState();
}

class _UsersListPageState extends State<UsersListPage> {
  UsersListViewModelStore usersListViewModel = UsersListViewModelStore();

  // ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    usersListViewModel.fetchUsers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // _scrollController.addListener(() {
    //   if (_scrollController.position.pixels ==
    //           _scrollController.position.maxScrollExtent &&
    //       !usersListViewModel.isLoading) {
    //     usersListViewModel.fetchMoreUsers();
    //     usersListViewModel.isLoading = true;
    //   }
    // });
    return Scaffold(
      appBar: AppBar(leading: Container(), title: Text("Users List Page")),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Observer(
              builder: (_) =>
              Column(
              children: [
                Expanded(
                  child: Container(
                    child: NotificationListener<ScrollNotification>(
                      onNotification: (ScrollNotification scrollInfo) {
                        if (!usersListViewModel.isLoading &&
                            scrollInfo.metrics.pixels ==
                                scrollInfo.metrics.maxScrollExtent) {
                          usersListViewModel.fetchMoreUsers();
                          usersListViewModel.isLoading = true;
                          return true;
                        }
                        return true;
                      },
                      child: ListView.builder(
                        itemCount: usersListViewModel.articlesList!.length,
                        itemBuilder: (context, index) {
                          return Container(
                            child: Column(
                              children: [
                                Container(
                                  color: Colors.white,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Text("Name: "),
                                            Text(usersListViewModel
                                                .articlesList![index]
                                                .name ??
                                                ""),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          children: [
                                            Text("gender: "),
                                            Text(usersListViewModel
                                                .articlesList![index]
                                                .gender ??
                                                ""),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text("Email: "),
                                            Expanded(
                                              child: Text(usersListViewModel
                                                  .articlesList![index]
                                                  .email ??
                                                  ""),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 20,
                                  color: Colors.transparent,
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
                // Container(color: Colors.red,height: 30,),
                Container(
                  height: usersListViewModel.isLoading ? 50.0 : 0,
                  color: Colors.transparent,
                  child: Center(
                    child: new CircularProgressIndicator(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

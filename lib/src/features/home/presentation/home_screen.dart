import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:latihan_dio/src/features/home/domain/user.dart';

import '../../../../dio_client.dart';

class myHomepage extends StatefulWidget {
  const myHomepage({Key? key}) : super(key: key);

  @override
  State<myHomepage> createState() => _myHomepageState();
}

class _myHomepageState extends State<myHomepage> {
  // List<User> users = [];
  var selectedIndex = 0;
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: FutureBuilder<List<User>>(
        future: fetchData(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Text('Loading....');
            default:
              if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                List<User> data = snapshot.data ?? [];

                return ListView.builder(
                  itemBuilder: (context, index) {
                    return Column(children: [
                      Text(data[index].firstName ?? ""),
                    ]);
                  },
                  itemCount: data.length,
                );
              }
          }
        },
      ),
    ));
  }

  Future<List<User>> fetchData() async {
    var Response = await DioClient().apiCall(
      url: 'https://reqres.in/api/users?page=2',
      requestType: RequestType.GET,
      // queryParameters: {},
    );
    if (Response.statusCode == 200) {
      List<dynamic> listUser = Response.data['data'];
      List<User> users = listUser.map((e) => User.fromJson(e)).toList();
      return users;
    } else {
      return [];
    }
  }
}

// Future<void> fetchData() async {
//   var Response = await DioClient().apiCall(
//     url: 'https://reqres.in/api/users?page=2',
//     requestType: RequestType.GET,
//     // queryParameters: {},
//   );

//   // List<dynamic> listUser = Response.data;

//   // OR

//   List<dynamic> listUser =
//       Response.data['data']; // if you want to access data inside it

//   List<User> users = listUser.map((e) => User.fromJson(e)).toList();
// }



import 'package:flutter/material.dart';
import 'package:navigating_routing/model/UserModel.dart';
import 'package:navigating_routing/service/UserService.dart';
import 'package:country_flags/country_flags.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    Size mq = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: const Text("Valyuta Kurslari"),
        ),
        body: FutureBuilder(
            future: UserService().getUser(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.data is String) {
                return Center(
                  child: Text(snapshot.data.toString()),
                );
              } else {
                var data = snapshot.data as List<UserModel>;
                return ListView.builder(
                  itemBuilder: (context, index) {
                    return Card(
                      color: Colors.white24,
                      margin:  EdgeInsets.symmetric(
                          horizontal: mq.width*0.03, vertical: mq.height*0.01),
                      child: ListTile(
                          leading: CountryFlags.flag(
                            data[index].code!.substring(0, 2),
                            height: 50,
                            width: 100,
                          ),
                          title: Text(data[index].title.toString()),
                          subtitle:
                              Text("sanasi  ${data[index].date.toString()}"),
                          trailing: TextButton(
                            child: TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, 'SecondPage',
                                      arguments: data[index]);
                                },
                                child: const Icon(Icons.arrow_forward_ios)),
                            onPressed: () {},
                          )),
                    );
                  },
                  itemCount: data.length,
                );
              }
            }));
  }
}

import 'package:flutter/material.dart';
import 'package:usersfakeapi/layout/get_users.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();

}

class _HomeScreenState extends State<HomeScreen> {
  @override
  initState(){
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Free Fake Users'),
      ),
      body: Container(
          child: Card(
            child: FutureBuilder(
              future:  getAllUsers(),
              builder: (context,snapshot)
              {
                if (snapshot.hasData){
                  return ListView.builder(
                    itemCount: snapshot.data?.length,
                    itemBuilder: (context, i){
                      return ListTile(
                        title: Text(snapshot.data![i].name),
                        subtitle: Text(snapshot.data![i].userName),
                        trailing: Text(snapshot.data![i].email),
                      );
                    },
                  );
                }else if (snapshot.hasError){
                  return Text('${snapshot.error}');
                }else{
                  return CircularProgressIndicator();
                }
              }
              ,
            ),
          ),
      ),
    );
  }
}

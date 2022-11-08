import 'package:flutter/material.dart';
import 'package:test_app_get_it_injecter/Features/user/Controller/UserController.dart';
import 'package:test_app_get_it_injecter/serviceLocator.dart';

class ScreenAllUsers extends StatelessWidget {
  const ScreenAllUsers({super.key});

  @override
  Widget build(BuildContext context) {
    final userController = getIt<UserController>();
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
        future: userController.getUsers(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            // future complete
            // if error or data is false return error widget
            if (snapshot.hasError) {
              print('object');
              return Center(
                child: Text("Error: ${snapshot.error}"),
              );
            }

            if (snapshot.hasData && snapshot.data!.isEmpty) {
              return const Center(child: Text('No data'));
            }

            return ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (context, index) {
                final user = snapshot.data![index];
                return ListTile(
                  leading: user.avatar != null
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Image.network(
                            user.avatar!,
                            width: 50,
                            height: 50,
                          ),
                        )
                      : null,
                  title: Text(user.email ?? ''),
                  subtitle: Text(user.firstName ?? ''),
                );
              },
            );
          }

          // return data widget

          // return loading widget while connection state is active
          else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}

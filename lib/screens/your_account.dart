import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:proj/widgets/widgets.dart';

// ignore: must_be_immutable
class YourAccount extends StatelessWidget {
  late FirebaseAuth? auth;
  YourAccount({required Key key, this.auth}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    User? user =
        auth == null ? FirebaseAuth.instance.currentUser : auth!.currentUser;
    return Scaffold(
      appBar: AppBar(
        title: Text('Your account'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                DevLink(
                  icon: Icons.update,
                  label: 'Update',
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          TextEditingController emailController =
                              TextEditingController();
                          TextEditingController passwordController =
                              TextEditingController();
                          emailController.text = user!.email as String;
                          return AlertDialog(
                            title: Text('Update your email'),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                TextField(
                                  controller: emailController,
                                ),
                                TextField(
                                  controller: passwordController,
                                  obscureText: true,
                                ),
                                ElevatedButton(
                                  onPressed: () async {
                                    auth == null
                                        ? await user
                                            .updateEmail(emailController.text)
                                        : {};
                                    auth == null
                                        ? await user.updatePassword(
                                            passwordController.text)
                                        : {};
                                    print(passwordController.text);
                                    Navigator.pop(context);
                                  },
                                  child: Text('Update'),
                                )
                              ],
                            ),
                          );
                        });
                  },
                  key: UniqueKey(),
                ),
                DevLink(
                  icon: Icons.delete,
                  label: 'Delete',
                  // first pop up asking are you sure you want to delete?
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text('Are you sure?'),
                            content: Text('Are you sure you want to delete?'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text('No'),
                              ),
                              TextButton(
                                onPressed: () {
                                  user!.delete();
                                  Navigator.popUntil(
                                      context, (route) => route.isFirst);
                                },
                                child: Text('Yes'),
                              )
                            ],
                          );
                        });
                  },
                  key: UniqueKey(),
                ),
                DevLink(
                  icon: Icons.logout,
                  label: 'Sign Out',
                  onPressed: () {
                    auth == null ? FirebaseAuth.instance.signOut() : {};
                    Navigator.pushNamed(context, '/');
                  },
                  key: UniqueKey(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

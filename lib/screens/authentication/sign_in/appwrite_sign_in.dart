import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:flutter/material.dart';
import 'package:souq_alqua/helper/db_helper.dart';

class AppwriteSignIn extends StatefulWidget {
  const AppwriteSignIn({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _AppwriteSignInState createState() => _AppwriteSignInState();
}

class _AppwriteSignInState extends State<AppwriteSignIn> {
  final TextEditingController emailController =
      TextEditingController(text: 'user@tcs.com');
  final TextEditingController passwordController =
      TextEditingController(text: 'test@123');
  final TextEditingController nameController =
      TextEditingController(text: 'Test User');
  Client client = Client();
  Account? account;
  User? loggedInUser;

  @override
  void initState() {
    super.initState();
    client
        .setEndpoint(DbHelper.dbUrl)
        .setProject(DbHelper.projectId)
        .setSelfSigned(status: true);
    account = Account(client);
  }

  Future<void> login(String email, String password) async {
    await account!.createEmailPasswordSession(email: email, password: password);
    final user = await account!.get();
    setState(() {
      loggedInUser = user;
    });
  }

  Future<void> register(String email, String password, String name) async {
    await account!.create(
        userId: ID.unique(), email: email, password: password, name: name);
    await login(email, password);
  }

  Future<void> logout() async {
    await account!.deleteSession(sessionId: 'current');
    setState(() {
      loggedInUser = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(loggedInUser != null
                  ? 'Logged in as ${loggedInUser!.name}'
                  : 'Not logged in'),
              const SizedBox(height: 16.0),
              TextField(
                controller: emailController,
                decoration: const InputDecoration(labelText: 'Email'),
              ),
              const SizedBox(height: 16.0),
              TextField(
                controller: passwordController,
                decoration: const InputDecoration(labelText: 'Password'),
                obscureText: true,
              ),
              const SizedBox(height: 16.0),
              TextField(
                controller: nameController,
                decoration: const InputDecoration(labelText: 'Name'),
              ),
              const SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () {
                      login(emailController.text, passwordController.text);
                    },
                    child: const Text('Login'),
                  ),
                  const SizedBox(width: 16.0),
                  ElevatedButton(
                    onPressed: () {
                      register(emailController.text, passwordController.text,
                          nameController.text);
                    },
                    child: const Text('Register'),
                  ),
                  const SizedBox(width: 16.0),
                  ElevatedButton(
                    onPressed: () {
                      logout();
                    },
                    child: const Text('Logout'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

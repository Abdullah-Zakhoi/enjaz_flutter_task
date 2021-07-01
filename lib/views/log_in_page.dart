import 'package:enjaz_flutter_task/locator.dart';
import 'package:enjaz_flutter_task/models/log_in_response_model.dart';
import 'package:enjaz_flutter_task/models/user_model.dart';
import 'package:enjaz_flutter_task/services/users_service.dart';
import 'package:enjaz_flutter_task/view_models/log_in_view_model.dart';
import 'package:flutter/material.dart';

class LogInPage extends StatefulWidget {
  @override
  _LogInPageState createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  TextEditingController? _emailController;
  TextEditingController? _passwordOfUser;

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordOfUser = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    _emailController!.dispose();
    _passwordOfUser!.dispose();

    super.dispose();
  }

  // UserApi userApi = UserApi();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: Container(),title: Text("log In Page")),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(
                  labelText: 'Email',
                  hintText: 'johndoe@ipropal.com',
                ),
                controller: _emailController,
                autofocus: true,
                textInputAction: TextInputAction.next,
              ),
              SizedBox(height: 25),
              TextField(
                decoration: InputDecoration(labelText: 'Password'),
                controller: _passwordOfUser,
                obscureText: true,
              ),
              SizedBox(height: 50),
              Container(
                // decoration: BoxDecoration( borderRadius: BorderRadius.all(Radius.circular(16))),
                height: 55,
                width: double.infinity,
                child: ElevatedButton(
                  child: Text("Log In"),
                  onPressed: () async{ // _emailController!.text // _passwordOfUser!.text
                    await locator.get<LogInViewModel>().fetchLogInToken(email: "eve.holt@reqres.in" , password: "cityslicka" , context: context);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

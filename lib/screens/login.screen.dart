import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_search/model/app,model.dart';
import 'package:restaurant_search/widgets/logo.widget.dart';
import 'package:restaurant_search/widgets/rounded-container.widget.dart';
import 'package:restaurant_search/widgets/sign-up-form.widget.dart';

class LoginScreen extends StatefulWidget {
  static String id = '/login';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  FormType formType = FormType.LOGIN;
  String submitLabel = 'Login';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: context.watch<MyAppState>().loginIn,
        child: SafeArea(
          bottom: false,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Flexible(child: LogoWidget()),
              RoundedContainer(
                child: SignUpForm(
                  formType: formType,
                  submitLabel: submitLabel,
                  onChangeForm: () {
                    setState(() {
                      formType = formType == FormType.LOGIN
                          ? FormType.REGISTER
                          : FormType.LOGIN;
                      submitLabel =
                          formType == FormType.LOGIN ? 'Login' : 'Register';
                    });
                  },
                  onSubmit: () {
                    context.read<MyAppState>().setLoginState(true);
                    try {} on Exception catch (e) {} finally {
                      context.read<MyAppState>().setLoginState(false);
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

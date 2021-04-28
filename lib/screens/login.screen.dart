import 'package:another_flushbar/flushbar_helper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_search/model/app,model.dart';
import 'package:restaurant_search/services/auth.service.dart';
import 'package:restaurant_search/services/error-handler.service.dart';
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
              Flexible(
                flex: 1,
                child: LogoWidget(),
              ),
              Expanded(
                flex: 2,
                child: RoundedContainer(
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
                    onSubmit: (name, email, password) async {
                      context.read<MyAppState>().setLoginState(true);
                      try {
                        if (formType == FormType.REGISTER) {
                          await AuthService()
                              .registerUser(name, email, password);
                        } else {
                          await AuthService().login(email, password);
                        }
                      } on FirebaseAuthException catch (e) {
                        FlushbarHelper.createError(
                          title: 'Error',
                          message: ErrorHandler().getAuthErrorMessage(e),
                          duration: Duration(seconds: 5),
                        )..show(context);
                      } finally {
                        context.read<MyAppState>().setLoginState(false);
                      }
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

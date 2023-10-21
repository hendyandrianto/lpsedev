import 'package:flutter/material.dart';
import 'package:flutterlpsetest/provider/login_provider.dart';
import 'package:flutterlpsetest/utils/custom_themes.dart';
import 'package:provider/provider.dart';
import '../../data/model/login_view_model.dart';
import '../../utils/color_resources.dart';
import '../../utils/validators.dart';
import '../basewidget/animated_custom_dialog.dart';
import '../basewidget/base_view.dart';
import '../basewidget/button.dart';
import '../basewidget/my_dialog.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  Validators validate = Validators();
  late TextEditingController _username;
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _username.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseView<LogInViewModel>(onModelReady: (model) {
      _username = TextEditingController();
    }, builder: (_, model, __) {
      return Scaffold(
        backgroundColor: ColorResources.WHITE,
        resizeToAvoidBottomInset: true,
        body: SafeArea(
          child: CustomScrollView(
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Form(
                    key: model.logInKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Center(
                            child: Image.asset(
                          "assets/images/logo.png",
                          scale: 1,
                        )),
                        const SizedBox(height: 32),
                        Center(
                          child: Text(
                            "Cek LPSE",
                            style: maisonBold.copyWith(
                                color: ColorResources.BLUE, fontSize: 20),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const SizedBox(height: 22),
                        Text(
                          "Mengumpulkan, memilah dan menyajikan data dari ratusan LPSE yang tersebar di seluruh Indonesia.",
                          textAlign: TextAlign.center,
                          style: maisonRegular.copyWith(
                            color: ColorResources.BLUE,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(height: 24),
                        const Divider(
                          height: 1,
                          thickness: 0.2,
                          color: Colors.grey,
                        ),
                        const SizedBox(
                          height: 32,
                        ),
                        Theme(
                          data: Theme.of(context)
                              .copyWith(splashColor: Colors.transparent),
                          child: TextFormField(
                            controller: _username,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Silahkan masukan username anda.';
                              }
                              return null;
                            },
                            autofocus: false,
                            style: const TextStyle(
                                fontSize: 14, color: ColorResources.BLACK),
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: ColorResources.GREY2,
                              hintText: 'Masukan Username',
                              contentPadding: const EdgeInsets.only(
                                  left: 14.0, bottom: 8.0, top: 8.0),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 32,
                        ),
                        Button(
                          text: "Login",
                          onPress: () {
                            model.setAutoValidate(true);
                            if (model.logInKey.currentState!.validate()) {
                              model.clearData(context);
                              _validate();
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }

  _login() async {
    String username = _username.text.trim();
    final provider = Provider.of<LoginProvider>(context, listen: false);
    provider.doLogin(context, username);
  }

  _validate() {
    if (!validateStructure(_username.text)) {
      showAnimatedDialog(
          context,
          const MyDialog(
            icon: Icons.clear,
            title: "Informasi",
            description: "Username tidak valid.",
            isFailed: true,
          ),
          dismissible: false,
          isFlip: true);
      return false;
    } else {
      _login();
    }
  }

  bool validateStructure(String value) {
    String pattern = r'^(?!.*\.\.)(?!.*\.$)[^\W][\w.]{2,30}$';
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(value);
  }
}

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:tut_app/presentation/features/login_view/viewmodel/login_viewmodel.dart';
import 'package:tut_app/presentation/resources/assets_manger.dart';
import 'package:tut_app/presentation/resources/color_manger.dart';
import 'package:tut_app/presentation/widgets/custom_text_button.dart';
import 'package:tut_app/presentation/widgets/custom_text_field.dart';

import '../../../../app/di.dart';
import '../../../resources/app_router.dart';
import '../../../resources/string_manger.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginScreen> {
  final LoginViewModel viewModel = instance<LoginViewModel>();
  // Dependency injection لما كل بدي انشئ تعريف لشي معين وهاد لشي بيعتمد على شي كمان هون دخلنا بمفهوم
  //di  تحل هي المشكلة حيكون حل المشكلة ضمن ملف get_it  ف لح الجأ انو ضيف باكج

  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  _bind() {
    viewModel.start(); // tell viewModel start job
    _userNameController
        .addListener(() => viewModel.setUserName(_userNameController.text));
    _passwordController
        .addListener(() => viewModel.setPassword(_passwordController.text));
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return getContentWidget();
  }

  Widget getContentWidget() {
    return Scaffold(
      backgroundColor: ColorManger.white,
      body: SizedBox(
        child: Container(
          padding: const EdgeInsets.only(
            top: 90,
            left: 28,
            right: 28,
          ),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Center(
                    child: Image.asset(
                      ImageAssets.splashLogo,
                    ),
                  ),
                  const SizedBox(
                    height: 45,
                  ),
                  CustomTextField(
                    stream: viewModel.outIsUserNameValid,
                    textError: AppString.userNameError,
                    textEditingController: _userNameController,
                    isObscureText: false,
                    hintText: AppString.userName,
                    textInputType: TextInputType.emailAddress,
                  ),
                  const SizedBox(
                    height: 20, //hor28
                  ),
                  CustomTextField(
                    stream: viewModel.outIsPasswordValid,
                    textError: AppString.passwordError,
                    textEditingController: _passwordController,
                    isObscureText: true,
                    hintText: AppString.password,
                    textInputType: TextInputType.visiblePassword,
                  ),
                  const SizedBox(
                    height: 45,
                  ),
                  StreamBuilder<bool>(
                      stream: viewModel.outAreAllInputsValid,
                      builder: (context, snapshot) {
                        return SizedBox(
                          width: double.infinity,
                          height: 40,
                          child: ElevatedButton(
                            onPressed: (snapshot.data ?? false)
                                // false يعني اول ما نفوت عل صفحة يكون disable
                                // false كمان يعني مباشرة يروح عل null , وما يفوت عل ميثود
                                ? () {
                                    viewModel.login();
                                  }
                                : null,
                            child: Text(AppString.login),
                          ),
                        );
                      }),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomTextButton(
                        onTab: () {
                          GoRouter.of(context)
                              .pushReplacement(AppRouter.kForgetPasswordView);
                        },
                        text: AppString.forgetPassword,
                        textStyle: Theme.of(context).textTheme.titleMedium,
                      ),
                      CustomTextButton(
                        onTab: () {},
                        text: AppString.notMember,
                        textStyle: Theme.of(context).textTheme.titleMedium,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    viewModel.dispose();
    super.dispose();
  }
}

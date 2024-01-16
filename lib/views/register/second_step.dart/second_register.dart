import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:greenleaf/controller/auth_controller.dart';
import 'package:greenleaf/models/ad_profile.dart';
import 'package:greenleaf/provider/common/user_profile.dart';
import 'package:greenleaf/shared/base.dart';
import 'package:greenleaf/shared/const.dart';
import 'package:greenleaf/utils/snackbar.dart';
import 'package:greenleaf/views/navbar/navbar.dart';
import 'package:greenleaf/views/register/help/help.dart';
import 'package:page_transition/page_transition.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SecondRegisterScreen extends ConsumerStatefulWidget {
  final String email;
  final String phone;
  final String password;
  const SecondRegisterScreen({
    super.key,
    required this.email,
    required this.phone,
    required this.password,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SecondRegisterScreenState();
}

class _SecondRegisterScreenState extends ConsumerState<SecondRegisterScreen> {
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: BaseApp.loginRegisterBackground(
          states: "Daftar",
          children: [
            TextFormField(
              validator: ((val) {
                if (val!.isEmpty) {
                  return 'Please Fill The Name Correctly!';
                }
                return null;
              }),
              controller: firstName,
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 1, color: Colors.black),
                      borderRadius: BorderRadius.circular(10)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          width: 1, color: Constants.colorGreenLeaf),
                      borderRadius: BorderRadius.circular(10)),
                  label: const Text(
                    "First Name",
                    style: TextStyle(fontSize: 14, color: Colors.black),
                  )),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              validator: ((val) {
                if (val!.isEmpty) {
                  return 'Please Fill The Name Correctly!';
                }
                return null;
              }),
              controller: lastName,
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 1, color: Colors.black),
                      borderRadius: BorderRadius.circular(10)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          width: 1, color: Constants.colorGreenLeaf),
                      borderRadius: BorderRadius.circular(10)),
                  label: const Text(
                    "Last Name",
                    style: TextStyle(fontSize: 14, color: Colors.black),
                  )),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
          linkable: "Ada kendala?",
          toLinkable: () {
            Navigator.push(
                context,
                PageTransition(
                    child: const RegisterHelpScreen(),
                    type: PageTransitionType.leftToRight));
          },
          lanjut: () {
            final navigator = Navigator.of(context);
            if (formKey.currentState!.validate()) {
              showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (context) => const Center(
                        child: CircularProgressIndicator.adaptive(
                          backgroundColor: Constants.colorGreenLeaf,
                        ),
                      ));
              Future.delayed(const Duration(milliseconds: 1500), () async {
                try {
                  await ref
                      .read(authControllerProvider.notifier)
                      .emailPassUserSignUp(
                          email: widget.email,
                          password: widget.password,
                          userProfile: UserProfile(
                              email: widget.email,
                              phoneNumber: widget.phone,
                              firstName: firstName.text,
                              lastName: lastName.text,
                              role: 1,
                              privilege: "Peasant"));
                  if (mounted) {
                    Snackbars.showSuccessSnackbar(context,
                        title: "Register Success",
                        message: "Welcome to GreenLeaf");
                    navigator.popUntil((route) => route.isFirst);
                    navigator.pushReplacement(PageTransition(
                        child: const Navbar(), type: PageTransitionType.fade));
                  }
                } on AuthException catch (e) {
                  if (mounted) {
                    navigator.pop();
                    Snackbars.showFailedSnackbar(context,
                        title: "Register Failed", message: e.toString());
                  }
                } catch (e) {
                  if (mounted) {
                    navigator.pop();
                    Snackbars.showFailedSnackbar(context,
                        title: "Unknown error occured", message: e.toString());
                  }
                } finally {
                  ref.read(userProfileProvider);
                }
              });
            }
            setState(() {});
          },
          submit: "Daftar",
          formKey: formKey),
    );
  }
}

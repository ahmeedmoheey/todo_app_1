import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app_1/auth/login/login.dart';
import 'package:todo_app_1/core/utils/colors_manager.dart';
import 'package:todo_app_1/core/utils/images_manager.dart';
import 'package:todo_app_1/core/utils/my_text_style.dart';

import '../../core/utils/constant_manager.dart';
import '../../core/utils/email_validation.dart';
import '../../core/utils/route_managers.dart';
import '../../core/utils/strings_manager.dart';
import '../../data_base_manager/user_DM.dart';
import '../../dialog/dialog.dart';
import '../widgets/custom_text_fields.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  late TextEditingController fullNameController;

  late TextEditingController userNameController;

  late TextEditingController emailController;

  late TextEditingController passwordController;

  late TextEditingController rePasswordController;

  GlobalKey<FormState> formKey = GlobalKey();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fullNameController = TextEditingController();
    userNameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    rePasswordController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    fullNameController.dispose();
    userNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    rePasswordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade900,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SvgPicture.asset(
                  ImagesManager.route,
                  width: 237.w,
                  height: 71.h,
                ),
                Text(
                  'Full name',
                  style: MyTextStyle.title,
                ),
                SizedBox(
                  height: 12.h,
                ),
                CustomTextField(
                  validator: (input) {
                    if (input == null || input.trim().isEmpty) {
                      return 'Plz, enter full name';
                    }
                    return null;
                  },
                  controller: fullNameController,
                  hintText: ConstantManager.fullName,
                  keyboardType: TextInputType.name,
                ),
                SizedBox(
                  height: 12.h,
                ),
                Text(
                  'user name',
                  style: MyTextStyle.title,
                ),
                SizedBox(
                  height: 12.h,
                ),
                CustomTextField(
                  validator: (input) {
                    if (input == null || input.trim().isEmpty) {
                      return 'Plz, enter user name';
                    }
                    return null;
                  },
                  controller: userNameController,
                  hintText: ConstantManager.userName,
                  keyboardType: TextInputType.name,
                ),
                SizedBox(
                  height: 12.h,
                ),
                Text(
                  'Email address',
                  style: MyTextStyle.title,
                ),
                SizedBox(
                  height: 12.h,
                ),
                CustomTextField(
                  validator: (input) {
                    if (input == null || input.trim().isEmpty) {
                      return 'Plz, enter emil';
                    }
                    if (!isValidEmail(input)) {
                      // email is not Valid
                      return 'Email bad format';
                    }
                    return null;
                  },
                  controller: emailController,
                  hintText: ConstantManager.email,
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(
                  height: 12.h,
                ),
                Text(
                  'Password',
                  style: MyTextStyle.title,
                ),
                SizedBox(
                  height: 12.h,
                ),
                CustomTextField(
                  validator: (input) {
                    if (input == null || input.trim().isEmpty) {
                      return 'Plz, enter password';
                    }
                    return null;
                  },
                  controller: passwordController,
                  hintText: ConstantManager.password,
                  keyboardType: TextInputType.visiblePassword,
                  isSecureText: true,
                ), // password
                SizedBox(
                  height: 12.h,
                ),
                Text(
                  'Re-password',
                  style: MyTextStyle.title,
                ),
                SizedBox(
                  height: 12.h,
                ),
                CustomTextField(
                  validator: (input) {
                    if (input == null || input.trim().isEmpty) {
                      return 'Plz, enter re-password';
                    }
                    if (input != passwordController.text) {
                      return "Password doesn't match";
                    }
                    return null;
                  },
                  controller: rePasswordController,
                  hintText: ConstantManager.passwordConfirmation,
                  keyboardType: TextInputType.visiblePassword,
                  isSecureText: true,
                ),
                SizedBox(
                  height: 12.h,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.r)),
                        padding: REdgeInsets.symmetric(vertical: 11)),
                    onPressed: () {
                      register();
                    },
                    child: Text(
                      'Sign-Up',
                      style: MyTextStyle.buttonText,
                    )),
               const SizedBox(height: 10,),
                Container(

                  alignment: Alignment.center,
                  child: InkWell(
                    onTap:() {
                      Navigator.push(context, MaterialPageRoute(builder:(context) => Login()));
                      },
                    child: Text('already have an account',style:
                    GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,fontSize: 15,color: ColorsManager.white,
                        decoration: TextDecoration.underline
                    ),
                    ),
                  ),
                  ),

              ],
            ),
          ),
        ),
      ),
    );
  }

  void register() async {
    if (formKey.currentState?.validate() == false) return;

    try {
      // show Loading
      MyDialog.showLoading(context,
          loadingMessage: 'Waiting...', isDismissible: false);
      final credential =
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      addUserToFireStore(credential.user!.uid);
      //hide loading
      if (mounted) {
        MyDialog.hide(context);
      }
      // show success message
      if (mounted) {
        MyDialog.showMessage(context,
            body: 'User registered successfully',
            posActionTitle: 'Ok', posAction: () {
              Navigator.pushReplacementNamed(context, RoutesManager.login);
            });
      }
    } on FirebaseAuthException catch (authError) {
      if (mounted) {
        MyDialog.hide(context);
      }
      late String message;
      if (authError.code == ConstantManager.weakPassword) {
        message = StringsManager.weakPasswordMessage;
      } else if (authError.code == ConstantManager.emailInUse) {
        message = StringsManager.emailInUseMessage;
      }
      if (mounted) {
        MyDialog.showMessage(
          context,
          title: 'Error',
          body: message,
          posActionTitle: 'OK',
        );
      }
    } catch (error) {
      if (mounted) {
        MyDialog.hide(context);
        MyDialog.showMessage(context,
            title: 'Error',
            body: error.toString(),
            posActionTitle: 'Try again');
      }
    }
  }

  void addUserToFireStore(String uid) async {
    UserDM userDM = UserDM(
      id: uid,
      fullName: fullNameController.text,
      userName: userNameController.text,
      email: emailController.text,
    );
    CollectionReference usersCollection =
    FirebaseFirestore.instance.collection(UserDM.collectionName);
    DocumentReference userDocument = usersCollection.doc(uid);
    await userDocument.set(userDM.toFireStore());
  }


}


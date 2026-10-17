import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nti_shopping_app/core/theme/app_colors.dart';
import 'package:nti_shopping_app/core/widgets/custom_button.dart';
import 'package:nti_shopping_app/core/widgets/custom_text_form_feild.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nti_shopping_app/feature/account/presentation/view_model/account_cubit.dart';
import 'package:nti_shopping_app/feature/account/presentation/view_model/account_state.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  File? profileImage;
  final ImagePicker picker = ImagePicker();
  final _formKey = GlobalKey<FormState>();
  final phoneController = TextEditingController();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future<void> pickImage() async {
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        profileImage = File(image.path);
      });
    }
  }

  void submitForm() {
    if (!_formKey.currentState!.validate()) return;
    context.read<AccountCubit>().updateAccount(
      name: nameController.text.trim(),
      email: emailController.text.trim(),
      phone: phoneController.text.trim(),
      image: profileImage,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AccountCubit, AccountState>(
      listener: (context, state) {
        final messenger = ScaffoldMessenger.of(context);
        if (state is AccountSuccess) {
          nameController.text = state.account.name ?? '';
          emailController.text = state.account.email ?? '';
          phoneController.text = state.account.phone ?? '';

          setState(() => profileImage = null);
        } else if (state is UpdateAccountSuccess) {
          messenger.showSnackBar(
            const SnackBar(content: Text('Profile updated successfully')),
          );
        } else if (state is UpdateAccountError) {
          messenger.showSnackBar(
            SnackBar(
              content: Text(state.message),
              backgroundColor: AppColors.errorBorderColor,
            ),
          );
        } else if (state is AccountError) {
          messenger.showSnackBar(SnackBar(content: Text(state.message)));
        }
      },
      builder: (context, state) {
        final cubit = context.read<AccountCubit>();
        final isUpdating = state is UpdateAccountLoading;

        final networkImage = cubit.account?.image;
        ImageProvider? avatar;
        if (profileImage != null) {
          avatar = FileImage(profileImage!);
        } else if (networkImage != null && networkImage.isNotEmpty) {
          avatar = NetworkImage(networkImage);
        }
        return SafeArea(
          child: Scaffold(
            body: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: SizedBox(
                height: MediaQuery.of(context).size.height - 80,
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          CircleAvatar(
                            radius: 70,
                            backgroundColor: AppColors.defaultBorderColor,
                            backgroundImage: avatar,

                            child: avatar == null
                                ? const Icon(
                                    Icons.person,
                                    size: 70,
                                    color: AppColors.white,
                                  )
                                : null,
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                              decoration: const BoxDecoration(
                                color: AppColors.white,
                                shape: BoxShape.circle,
                              ),
                              child: IconButton(
                                onPressed: () {
                                  pickImage();
                                },
                                icon: const Icon(
                                  Icons.camera_alt_outlined,
                                  color: AppColors.primaryColorBlack,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 39),

                      CustomTextFormField(
                        label: 'Name',
                        hint: 'Enter your name',
                        controller: nameController,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Please enter your name';
                          }
                          return null;
                        },
                      ),

                      const SizedBox(height: 8),

                      CustomTextFormField(
                        label: 'Email',
                        hint: 'Enter your email',
                        keyboardType: TextInputType.emailAddress,
                        controller: emailController,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Please enter your email';
                          }
                          if (!RegExp(
                            r'^[^@]+@[^@]+\.[^@]+$',
                          ).hasMatch(value.trim())) {
                            return 'Please enter a valid email';
                          }
                          return null;
                        },
                      ),

                      const SizedBox(height: 8),

                      CustomTextFormField(
                        label: 'Password',
                        hint: 'Enter your password',
                        obscureText: true,
                        controller: passwordController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 170),

                      CustomButton(
                        text: isUpdating ? "Saving...." : 'Submit',
                        onTap: isUpdating ?(){}: submitForm,
                        colors: [
                          AppColors.blackButtonColor,
                          AppColors.blackButtonColor,
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

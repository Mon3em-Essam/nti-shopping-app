import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nti_shopping_app/core/di/service_locator.dart';
import 'package:nti_shopping_app/core/routes/app_routes.dart';
import 'package:nti_shopping_app/core/widgets/custom_button.dart';
import 'package:nti_shopping_app/core/widgets/custom_text_form_feild.dart';
import 'package:nti_shopping_app/feature/auth/presentation/view_model/register_state/register_cubit.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _submit(BuildContext context) {
    if (!_formKey.currentState!.validate()) return;

    context.read<RegisterCubit>().intent(
      SignUpIntent(
        name: _nameController.text.trim(),
        phone: _phoneController.text.trim(),
        email: _emailController.text.trim(),
        password: _passwordController.text,
        confirmPassword: _confirmPasswordController.text,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => serviceLocator<RegisterCubit>(),
      child: BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {
          if (state is RegisterSuccess) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.message)));
            Navigator.pushReplacementNamed(context, AppRoutes.login);
          } else if (state is RegisterError) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.message)));
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: const Color(0xffEBEBEB),
            appBar: AppBar(
              backgroundColor: const Color(0xffEBEBEB),
              title: const Center(child: Text("Sign up")),
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SingleChildScrollView(
                child: SafeArea(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 5),
                        CustomTextFormField(
                          controller: _nameController,
                          label: "Name",
                          hint: "Enter Your Name",
                          keyboardType: TextInputType.name,
                          validator: (v) => (v == null || v.trim().isEmpty)
                              ? "Name is required"
                              : null,
                        ),
                        const SizedBox(height: 20),
                        CustomTextFormField(
                          controller: _phoneController,
                          label: "Phone",
                          hint: "Enter Your Phone",
                          keyboardType: TextInputType.phone,
                          validator: (v) => (v == null || v.trim().isEmpty)
                              ? "Phone is required"
                              : null,
                        ),
                        const SizedBox(height: 20),
                        CustomTextFormField(
                          controller: _emailController,
                          label: "Email",
                          hint: "Enter Your Email",
                          keyboardType: TextInputType.emailAddress,
                          validator: (v) {
                            if (v == null || v.trim().isEmpty) {
                              return "Email is required";
                            }
                            if (!v.contains('@')) return "Invalid email";
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),
                        CustomTextFormField(
                          controller: _passwordController,
                          label: "Password",
                          hint: "Enter Your Password",
                          obscureText: true,
                          validator: (v) => (v == null || v.length < 6)
                              ? "Password must be at least 6 characters"
                              : null,
                        ),
                        const SizedBox(height: 20),
                        CustomTextFormField(
                          controller: _confirmPasswordController,
                          label: "Confirm Password",
                          hint: "Confirm Your Password",
                          obscureText: true,
                          validator: (v) => v != _passwordController.text
                              ? "Passwords don't match"
                              : null,
                        ),
                        const SizedBox(height: 32),
                        state is RegisterLoading
                            ? const Center(child: CircularProgressIndicator())
                            : CustomButton(
                                text: "Sign up",
                                onTap: () => _submit(context),
                              ),
                        const SizedBox(height: 50),
                        Center(
                          child: Text.rich(
                            TextSpan(
                              text: "Already have an account? ",
                              style: const TextStyle(
                                fontSize: 15,
                                color: Color(0xff212121),
                              ),
                              children: [
                                TextSpan(
                                  text: "Login",
                                  style: const TextStyle(
                                    color: Color(0xff212121),
                                    fontWeight: FontWeight.bold,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Navigator.pushReplacementNamed(
                                        context,
                                        AppRoutes.login,
                                      );
                                    },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
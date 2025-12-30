import 'package:facebook/app_widgets.dart';
import 'package:facebook/data/login_data.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

class LoginFormValidator {
  static FormGroup formGroup() {
    return FormGroup({
      'email': FormControl<String>(
        validators: [Validators.required, Validators.email],
      ),
      'password': FormControl<String>(
        validators: [
          Validators.required,
          Validators.minLength(8),
          Validators.maxLength(25),
        ],
      ),
    });
  }
}

class LoginForm extends StatelessWidget {
  final void Function(LoginData) onSubmit;

  const LoginForm({super.key, required this.onSubmit});

  @override
  Widget build(BuildContext context) {
    final form = LoginFormValidator.formGroup();

    return ReactiveForm(
      formGroup: form,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: 20,
        children: [
          Column(spacing: 12, children: [_EmailField(), _PasswordField()]),
          ReactiveFormConsumer(
            builder: (context, formGroup, _) {
              final isValid = formGroup.valid;

              return SizedBox(
                width: double.infinity,
                height: 52,
                child: AppElevatedButton(
                  label: "Log In",
                  backgroundColor: isValid
                      ? Theme.of(context).primaryColor
                      : Theme.of(context).primaryColor.withOpacity(0.5),
                  onPressed: isValid
                      ? () {
                          onSubmit(
                            LoginData(
                              email: formGroup.control('email').value as String,
                              password:
                                  formGroup.control('password').value as String,
                            ),
                          );
                        }
                      : null,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class _EmailField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ReactiveTextField<String>(
      formControlName: 'email',
      keyboardType: TextInputType.emailAddress,
      decoration: _inputDecoration(label: 'Email', hint: 'john@example.com'),
      validationMessages: {
        ValidationMessage.required: (_) => 'Email is required',
        ValidationMessage.email: (_) => 'Enter a valid email',
      },
    );
  }
}

class _PasswordField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ReactiveTextField<String>(
      formControlName: 'password',
      obscureText: true,
      decoration: _inputDecoration(label: 'Password', hint: '••••••••'),
      validationMessages: {
        ValidationMessage.required: (_) => 'Password is required',
        ValidationMessage.minLength: (_) => 'Minimum 8 characters',
        ValidationMessage.maxLength: (_) => 'Maximum 30 characters',
      },
    );
  }
}

InputDecoration _inputDecoration({
  required String label,
  required String hint,
}) {
  return InputDecoration(
    labelText: label,
    hintText: hint,
    filled: true,
    fillColor: Colors.white,
    contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 16),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide.none,
    ),
  );
}

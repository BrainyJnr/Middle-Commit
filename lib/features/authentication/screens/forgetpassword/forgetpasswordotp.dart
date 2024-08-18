import 'package:amazing/utilis/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class forget_password_otp extends StatelessWidget {
  const forget_password_otp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            "Verification",
            style: Theme.of(context).textTheme.titleMedium,
          )),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Container(
          child: Column(
            children: [
              Text(
                "Enter the 6 digit code that was sent to your email",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 20),
                         OtpTextField(keyboardType: TextInputType.number,
                           numberOfFields: 6,
                           borderColor: Colors.black,
                           showFieldAsBox: true,
                           focusedBorderColor: Colors.black,


                         ),
                         const SizedBox(height: 12),

              const Text.rich(
                  TextSpan(
                      children: [
                        TextSpan(
                            text: "${"I didn't receive code " } "),
                        TextSpan(
                            text: "Resend Code ",
                            style: TextStyle(color: Colors.red)
                        )


                      ]
                  )
              ),

              const SizedBox(height: 25),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      backgroundColor: fColors.error,
                    ),
                    onPressed: () {},
                    child: const Text(
                      "Verify Me",
                      style: TextStyle(color: Colors.white),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}


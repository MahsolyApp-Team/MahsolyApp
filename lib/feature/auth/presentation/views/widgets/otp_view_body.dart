import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:save_plant/core/constants/app_colors.dart';
import 'package:save_plant/core/functions/snackbar_message.dart';
import 'package:save_plant/core/theme/text_style.dart';
import 'package:save_plant/feature/auth/presentation/cubit/otp_cubit.dart';
import 'package:save_plant/feature/auth/presentation/cubit/otp_state.dart';
import 'package:save_plant/feature/auth/presentation/views/login_view.dart';
import 'package:save_plant/feature/auth/presentation/views/widgets/custom_button_auth.dart';
import 'package:save_plant/root.dart';

class OtpViewBody extends StatefulWidget {
  const OtpViewBody({super.key, required this.email});
  final String email;

  @override
  State<OtpViewBody> createState() => _OtpViewBodyState();
}

class _OtpViewBodyState extends State<OtpViewBody> {
  final TextEditingController otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.w),
      child: BlocConsumer<OtpCubit, OtpState>(
        listener: (context, state) {
          if (state is OtpSuccess) {
            snackBarMessage(
              context,
              state.message,
              color: AppColor.primaryColor,
            );

            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => LoginView()),
            );
          }

          if (state is OtpFailure) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.error)));
          }
        },
        builder: (context, state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Enter the OTP sent to your email",
                style: AppTextStyle.giloryBold18(context),
              ),
              SizedBox(height: 5.h),
              Text(
                widget.email,
                style: AppTextStyle.giloryRegular16(
                  context,
                ).copyWith(color: AppColor.primaryColor),
              ),

              SizedBox(height: 25.h),

              TextField(
                controller: otpController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: "OTP Code",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20.h),
              SizedBox(
                width: double.infinity,
                child: CustomButtonAuth(
                  onPressed: state is OtpLoading
                      ? null
                      : () {
                          context.read<OtpCubit>().verifyOtp(
                            email: widget.email,
                            otp: otpController.text.trim(),
                          );
                        },
                  child: state is OtpLoading
                      ? CircularProgressIndicator(
                          color: Theme.of(context).colorScheme.surface,
                        )
                      : Text(
                          "Verify",
                          style: AppTextStyle.giloryRegular18(context),
                        ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

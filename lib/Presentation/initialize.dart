import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whizapp/Presentation/login/login_page.dart';
import 'package:whizapp/Presentation/main/main_page.dart';
import 'package:whizapp/application/initialiize/initilize_bloc.dart';
import 'package:whizapp/core/theme/color.dart';

class Initialize extends StatelessWidget {
  const Initialize({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<InitilizeBloc>(context)
          .add(const InitilizeEvent.initial());
      // context.read<HelpCenterBloc>().add(const HelpCenterEvent.initial());
    });
    return Scaffold(
      backgroundColor: AppColor.backgroundLight,
      body: BlocBuilder<InitilizeBloc, InitilizeState>(
        buildWhen: (previous, current) {
          return previous != current;
        },
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state.isToken) {
            return const MainPage();
          } else if (!state.isToken) {
            return LoginPage();
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}

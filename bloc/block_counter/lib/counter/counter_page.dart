// counter page is responsible for displaying the counter value and incrementing the counter value.
// use a bloc provider to provide the counter cubit to the counter page.

// This is mainly provider page


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'counter_cubit.dart';
import 'counter_view.dart';


class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  //method to build snackbar
  void _buildSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Counter reached $message"),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        behavior: SnackBarBehavior.floating,
        closeIconColor: Colors.red,
        showCloseIcon: true,
      ),
    );
  }


  @override
  Widget build(BuildContext context) {

    //BlocProvider is a widget that provides a bloc to its children via BlocProvider.of(context).

    return BlocProvider(
      create: (context) => CounterCubit(0),
      child: BlocListener<CounterCubit, int>(
          listener: (context, state) {
            if (state == 20)
              _buildSnackBar(context, state.toString());
          },
          child: const CounterView(),
      ),
    );
  }
}



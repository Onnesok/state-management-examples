// counter view is responsible for displaying the counter value and incrementing the counter value.
// -- use a bloc builder to listen to the counter cubit state and rebuild the UI when the state changes.


import 'package:block_counter/counter/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterView extends StatefulWidget {
  const CounterView({super.key});

  @override
  State<CounterView> createState() => _CounterViewState();
}

class _CounterViewState extends State<CounterView> {

  // This creates alert dialogue box
  void _buildDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Cannot have negative value'),
          content: const Text('The counter value cannot be less than 0'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bloc Counter', style: TextStyle(fontFamily: "Anton", letterSpacing: 2),),
        centerTitle: true,
      ),
      body: Center(
        child: BlocBuilder<CounterCubit, int>(
          builder: (context, state) {
            return Center(
              child: Text(
                  state.toString(),
                style: const TextStyle(fontSize: 150, fontFamily: 'RuslanDisplay', color: Colors.deepOrange),
              ),
            );
          }
        ),
      ),


      // Uwu this will float like zedai or something
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
              onPressed: () {
                context.read<CounterCubit>().increment();
              },
            child: const Icon(Icons.add),
          ),

          const SizedBox(width: 20),

          FloatingActionButton(
            onPressed: () {
            if (context.read<CounterCubit>().state > 0)
              context.read<CounterCubit>().decrement();
            else
              _buildDialog(context);

          },
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
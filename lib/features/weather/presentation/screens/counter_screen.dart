import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/features/weather/presentation/bloc-cubit/cubit/counter_cubit.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) { 
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(middle: Text('data')),
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 40,
          children: [
            /*
            Builder(builder: (context) {
            var state = context.watch<CounterCubit>().state;
              return Text('data');
            },)
---------------------------------------------------------------------
              BlocConsumer(buildWhen: (previous, current) {

              },
                builder: (context, state) {

            }, listener: (context, state) {

            },listenWhen: (previous, current) {

            },
            ),
            */
            BlocBuilder<CounterCubit, CounterState>(
              builder: (context, state) {
                if (state is CounterStateChanged) {
                  return Text('${state.counter}');
                }
                return const SizedBox.shrink();
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 30,
              children: [
                CupertinoButton(
                  color: Colors.white,
                  onPressed: () {
                    context.read<CounterCubit>().decrement();
                  },
                  child: Text('decrease'),
                ),
                CupertinoButton(
                  color: Colors.white,
                  onPressed: () {
                    context.read<CounterCubit>().increment();
                  },
                  child: Text('increase'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

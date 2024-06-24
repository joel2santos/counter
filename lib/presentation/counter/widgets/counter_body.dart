import 'package:counter/domain/enum/counter.dart';
import 'package:counter/presentation/counter/bloc/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBody extends StatelessWidget {
  const CounterBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CounterBloc, CounterState>(
      buildWhen: (previous, current) => previous.counter != current.counter,
      builder: (context, state) {
        return Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(state.counter.toString(),
                      style: const TextStyle(
                          fontSize: 160, fontWeight: FontWeight.w100)),
                  const SizedBox(height: 16),
                  Text(state.counter != 1 ? "Clicks" : "Click"),
                ],
              ),
            ),
            floatingActionButton: const CounterButtons());
      },
    );
  }
}

class CounterButtons extends StatelessWidget {
  const CounterButtons({super.key});

  @override
  Widget build(BuildContext context) {
    const int decreaseValue = 1;

    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        // Increase
        CustomCounterButton(
            onPressed: () => context.read<CounterBloc>().add(
                  const CounterPressed(
                    counterType: Counter.increment,
                    counterValue: decreaseValue,
                  ),
                ),
            icon: Icons.add),
        const SizedBox(height: 16),

        // Decrease
        CustomCounterButton(
            onPressed: () => context.read<CounterBloc>().add(
                  const CounterPressed(
                    counterType: Counter.decrease,
                    counterValue: decreaseValue,
                  ),
                ),
            icon: Icons.remove),
      ],
    );
  }
}

class CustomCounterButton extends StatelessWidget {
  const CustomCounterButton({
    super.key,
    required this.onPressed,
    this.icon,
  });

  final void Function()? onPressed;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Visibility(visible: icon != null, child: Icon(icon)),
        ],
      ),
    );
  }
}

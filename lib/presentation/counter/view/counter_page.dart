import 'package:counter/presentation/counter/bloc/counter_bloc.dart';
import 'package:counter/presentation/counter/widgets/counter_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// First layer: Here comes providers and other things
class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  // Providers
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterBloc(),
      child: BlocBuilder<CounterBloc, CounterState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(title: const Text('Counter with Bloc!'), actions: [
              IconButton(
                icon: const Icon(Icons.refresh_rounded),
                onPressed: () =>
                    context.read<CounterBloc>().add(CounterResetPressed()),
              ),
            ]),
            body: const CounterView(),
          );
        },
      ),
    );
  }
}

// Second layer: Listeners
class CounterView extends StatelessWidget {
  const CounterView({super.key});

  @override
  // View
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CounterBody(),
    );
  }
}

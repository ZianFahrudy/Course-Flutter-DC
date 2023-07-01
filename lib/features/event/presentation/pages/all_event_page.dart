import 'package:event_app/components/empty/nothing.dart';
import 'package:event_app/core/di/injection.dart';
import 'package:event_app/features/event/presentation/bloc/event_bloc.dart';
import 'package:event_app/features/event/presentation/widgets/event_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllEventPage extends StatelessWidget {
  const AllEventPage({super.key});

  @override
  Widget build(BuildContext context) {
    final eventBloc = sl<EventBloc>();
    return BlocProvider(
      create: (context) => eventBloc..add(GetAllEventsEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('All Event Page'),
        ),
        body: BlocBuilder<EventBloc, EventState>(
          builder: (context, state) {
            if (state is EventSuccess) {
              return ListView.builder(
                padding: const EdgeInsets.symmetric(vertical: 20),
                itemCount: state.response.data.length,
                itemBuilder: (context, index) =>
                    EventCard(data: state.response.data, index: index),
              );
            } else if (state is EventLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is EventFailure) {
              return Center(
                child: Text(state.message),
              );
            } else {
              return const Nothing();
            }
          },
        ),
      ),
    );
  }
}

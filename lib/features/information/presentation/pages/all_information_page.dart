import 'package:event_app/components/empty/nothing.dart';
import 'package:event_app/core/di/injection.dart';
import 'package:event_app/features/information/presentation/bloc/information_bloc.dart';
import 'package:event_app/features/information/presentation/widgets/home_information_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllInformationPage extends StatelessWidget {
  const AllInformationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final informationBloc = sl<InformationBloc>();
    return BlocProvider(
      create: (context) => informationBloc..add(GetInformationsEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('All Information Page'),
        ),
        body: BlocBuilder<InformationBloc, InformationState>(
          builder: (context, state) {
            if (state is InformationSuccess) {
              return ListView.builder(
                itemCount: state.response.data.length,
                itemBuilder: (context, index) => HomeInformationCard(
                  data: state.response.data,
                  index: index,
                ),
              );
            } else if (state is InformationLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is InformationFailure) {
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

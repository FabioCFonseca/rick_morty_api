import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_morty_bloc/src/common/presentation/custom_app_bar.dart';

import '../bloc/details_bloc.dart';
import 'ui/details_success.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key, required this.selectedCharacter});

  final int selectedCharacter;

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<DetailsBloc>(context).add(
        DetailsInitialFetchEvent(characterIndex: widget.selectedCharacter));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: BlocBuilder<DetailsBloc, DetailsState>(
        builder: (context, state) {
          switch (state.runtimeType) {
            case DetailsLoadingState:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case DetailsSuccessState:
              final detailsState = state as DetailsSuccessState;
              return DetailsSuccess(character: detailsState.characterDetail);
            default:
              return const Text('error');
          }
        },
      ),
    );
  }
}

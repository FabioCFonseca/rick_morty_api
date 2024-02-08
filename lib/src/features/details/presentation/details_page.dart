import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      appBar: AppBar(
        toolbarHeight: 80,
        forceMaterialTransparency: true,
        centerTitle: true,
        title: Padding(
          padding: const EdgeInsets.only(top: 12),
          child: CachedNetworkImage(
            imageUrl: 'https://www.vhv.rs/dpng/f/430-4305710_rick-png.png',
            errorWidget: (context, url, error) => Icon(Icons.error),
            height: 70,
          ),
        ),
      ),
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
              return Text('error');
          }
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:interview_gpt/bloc/chat/chat_bloc.dart';
import 'package:interview_gpt/bloc/chat/chat_states.dart';
import 'package:interview_gpt/bloc/listings_img/listings_img_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListingUI extends StatelessWidget {
  const ListingUI({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ListingImgBloc, ListingImgState>(
      builder: (context, state) {
        final ChatStateWithListing chatState =
            context.read<ChatBloc>().state as ChatStateWithListing;

        return ListTile(
          title: Text(chatState.listings[index].name),
          subtitle: Column(
            children: [
              Text(
                chatState.listings[index].rank.toString(),
              ),
              if (state.images[index] != null)
                Image.network(state.images[index]!),
            ],
          ),
        );
      },
    );
  }
}

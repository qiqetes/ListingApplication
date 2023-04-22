import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview_gpt/bloc/chat/chat_bloc.dart';
import 'package:interview_gpt/bloc/chat/chat_states.dart';
import 'package:interview_gpt/bloc/listings_img/listings_img_bloc.dart';
import 'package:interview_gpt/pages/display_listings/listing_component.dart';

class ListingsPage extends StatefulWidget {
  const ListingsPage({super.key});
  static const routeName = '/listings';

  @override
  State<ListingsPage> createState() => _ListingsPageState();
}

class _ListingsPageState extends State<ListingsPage> {
  @override
  Widget build(BuildContext context) {
    ChatBloc chatBloc = context.read<ChatBloc>();
    List<String> queries = (chatBloc.state as ChatStateWithListing)
        .listings
        .map((e) => e.name)
        .toList();

    return BlocProvider<ListingImgBloc>(
      create: (context) {
        return ListingImgBloc(queries: queries)..add(ListingImgLoad());
      },
      child: BlocBuilder<ChatBloc, ChatState>(
        bloc: context.read<ChatBloc>(),
        builder: (context, state) {
          state as ChatStateWithListing;
          return Scaffold(
            appBar: AppBar(
              title: const Text('Listings'),
            ),
            body: SafeArea(
              child: ListView.builder(
                itemCount: state.listings.length,
                itemBuilder: (_, index) {
                  return ListingUI(index: index);
                },
              ),
            ),
          );
        },
      ),
    );
  }
}

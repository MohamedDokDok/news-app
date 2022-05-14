import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/cubit.dart';
import 'package:news_app/cubit/states.dart';
import 'package:news_app/shared/components.dart';

class SearchScreen extends StatelessWidget {
  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context,state) => {},
      builder: (context, state) {
        var listArticle = NewsCubit.get(context).search;
        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0,),
                child: defaultTextFormFiled(
                    controller: searchController,
                    label: 'Search',
                    prefixICon: Icons.search,
                    onChange: (value){
                      NewsCubit.get(context).getSearch(value);
                    },
                    validate: (String? value) {
                      if (value!.isEmpty) {
                        return 'search must not be empty';
                      }
                    }),
              ),
              Expanded(child: articleBuilder(listArticle, context ,isSearch: true))
            ],
          ),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_second/core/functions/build_border.dart';
import 'package:news_app_second/core/utils/widgets/build_list.dart';
import 'package:news_app_second/feature/search/presentation/manger/search_cubit/search_cubit.dart';
import 'package:news_app_second/feature/search/presentation/manger/search_cubit/search_state.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit,SearchState>(
    builder: (context, state) {
      var cubit = SearchCubit.get(context);
      return Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextFormField(
                onChanged: (value) {
                  cubit.getSearch(valueSearch: value);
                },
               // controller: ,
                keyboardType:TextInputType.text ,
                validator: ( value) {
                  if (value == null)
                  {
                   return 'Search must not be empty';
                  }
                  else
                  {                
                    return null;
                  }},
               decoration: InputDecoration(
                focusedBorder: builBorder(color: Colors.deepOrange),
                enabledBorder: builBorder(color: Colors.deepOrange),
                prefixIcon:const Icon(Icons.search) ,
                labelText: 'Search',
                border: builBorder(color: Colors.white),
               ),
              ),
            ),
            Expanded(child: BuildList(item:cubit.search, isSearch:  true,)),
          ],
        ),
      );
    },
    );
  }
}


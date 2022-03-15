import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/layout/news-app/cubit/cubit.dart';
import 'package:udemy_flutter/layout/news-app/cubit/states.dart';
import 'package:udemy_flutter/shared/components/components.dart';

class BusinessScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var list = NewsCubit.get(context).business;
    return BlocConsumer<NewsCubit,NewsStates>(
        listener: (context,state){},
        builder: (context,state)=> ListView.separated(
          physics: BouncingScrollPhysics(),
            itemBuilder: (context,index)=> buildArticleItem(list[index],context),
            separatorBuilder: (context,index)=> myDivider(),
            itemCount: 10),

        );

  }
}

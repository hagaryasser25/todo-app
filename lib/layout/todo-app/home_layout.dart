
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';
import 'package:udemy_flutter/shared/components/components.dart';
import 'package:udemy_flutter/shared/components/constants.dart';
import 'package:udemy_flutter/shared/cubit/cubit.dart';
import 'package:udemy_flutter/shared/cubit/states.dart';

class HomeLayout extends StatelessWidget {


  List<Map> tasks = [];
  var scaffoldKey = GlobalKey<ScaffoldState>();

  var formKey = GlobalKey<FormState>();
  var titleController = TextEditingController();
  var timeController = TextEditingController();
  var dateController = TextEditingController();
  bool _progressBarActive = true;





  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit()..createDatabase(),
      child: BlocConsumer<AppCubit,AppStates>(
        listener: (context,state){
          if(state is AppInsertDatabaseState){
            Navigator.pop(context);
          }
        },
        builder: (context,state)
        {
          AppCubit cubit = AppCubit.get(context);
         return Scaffold(
            key: scaffoldKey,
            appBar: AppBar(
              title: Text(
                AppCubit.get(context).titles[cubit.currentIndex],
              ),
            ),
            body: cubit.screens[cubit.currentIndex],
            floatingActionButton: FloatingActionButton(
              onPressed: ()  {

                if(cubit.isBottomSheetShown){
                cubit.insertToDatabase(title: titleController.text, time: timeController.text, date: dateController.text,);

                } else {
                  scaffoldKey.currentState?.showBottomSheet((context) =>
                      Container(
                        color: Colors.grey[100],
                        padding: EdgeInsets.all(20.0),
                        child: Form(
                          key: formKey,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              defaultFormField(
                                  controller: titleController,
                                  type: TextInputType.text,
                                  validate: (String value){
                                    if(value.isEmpty){
                                      return 'title must not be empty';

                                    }
                                    return null;
                                  },
                                  label: 'Task Title',
                                  prefix: Icons.title),
                              SizedBox(
                                height: 15.0,
                              ),
                              defaultFormField(
                                  controller: timeController,
                                  type: TextInputType.datetime,
                                  onTap: (){
                                    showTimePicker(
                                      context: context,
                                      initialTime: TimeOfDay.now(),).then((value) {
                                      timeController.text = value!.format(context).toString();
                                      //print(value?.format(context));
                                    }) ;
                                  },
                                  validate: (String value){
                                    if(value.isEmpty){
                                      return 'time must not be empty';

                                    }
                                    return null;
                                  },
                                  label: 'Task Time',
                                  prefix: Icons.watch_later_outlined),
                              SizedBox(
                                height: 15.0,
                              ),
                              defaultFormField(
                                  controller: dateController,
                                  type: TextInputType.datetime,
                                  onTap: (){
                                    showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime.now(),
                                      lastDate: DateTime.parse('2021-12-08'),).then((value) => {
                                      dateController.text = DateFormat.yMMMd().format(value!)

                                    });
                                  },
                                  validate: (String value){
                                    if(value.isEmpty){
                                      return 'time must not be empty';

                                    }
                                    return null;
                                  },
                                  label: 'Task date',
                                  prefix: Icons.calendar_today)
                            ],
                          ),
                        ),
                      ),
                  ).closed.then((value) {
                    cubit.changeBottomSheetState(isShow: false, icon: Icons.edit,);
                  });

                  cubit.changeBottomSheetState(isShow: true, icon: Icons.add,);
                }


              },
              child: Icon(
               cubit.fabIcon,
              ),
            ),
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: AppCubit.get(context).currentIndex,
              onTap: (index){
                AppCubit.get(context).changeIndex(index);
              },
              items: [
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.menu,
                  ),
                  label: 'Tasks',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.check_circle_outline,
                  ),
                  label: 'Done',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.archive_outlined,
                  ),
                  label: 'Archived',
                ),
              ],
            ),
          );
        },
      ),
    );
  }
 Future<String> getName() async
  {
    return 'Hagar Yasser';
  }



}

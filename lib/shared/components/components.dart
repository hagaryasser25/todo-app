  import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:udemy_flutter/modules/news_app/web_view/web_view_screen.dart';
import 'package:udemy_flutter/shared/cubit/cubit.dart';
import 'package:webview_flutter/webview_flutter.dart';

Widget defaultButton({
   double width = double.infinity,
   Color background = Colors.blue,
  required Function function,
  required String text,
  }) => Container(
  width: width,
  color: background,
  child: MaterialButton(
    onPressed: function(),
    child: Text(
      text.toLowerCase(),
      style: TextStyle(
        color: Colors.white,
      ),
    ),
  ),
);

Widget defaultFormField({
    required TextEditingController controller,
  required TextInputType type,
  required Function validate,
  required String label,
  required IconData prefix,
  void Function()? onTap,
  void Function(String)? onChange,
  bool isClickable = true,
  Function? suffixPressed,
  IconData? suffix,
  bool isPassword = false,
  }) => TextFormField(
  controller: controller,
  keyboardType: type,
  obscureText: isPassword,
  onTap: onTap,
  onChanged: onChange,
  enabled: isClickable,
  validator:(s) {validate(s);},
  decoration: InputDecoration(
    labelText: label,
    prefixIcon: Icon(
      prefix,
    ),
    suffixIcon:
      suffix !=null ? IconButton(
        onPressed: suffixPressed!(),
          icon:
          Icon(suffix,
          ),
      ):null ,

    border: OutlineInputBorder(),
  ),
);

Widget buildTaskItem(Map model, context) => Dismissible(
  key: Key(model['id'].toString()),
  child:Padding(
  
    padding: const EdgeInsets.all(20.0),
  
    child: Row(
  
      children: [
  
        CircleAvatar(
  
          radius: 40.0,
  
          child: Text(
  
              '${model['date']}'
  
          ),
  
        ),
  
        SizedBox(
  
          width: 20.0,
  
        ),
  
        Expanded(
  
          child: Column(
  
            mainAxisSize: MainAxisSize.min,
  
            crossAxisAlignment: CrossAxisAlignment.start,
  
            children: [
  
              Text(
  
                '${model['title']}',
  
                style: TextStyle(
  
                  fontSize: 18.0,
  
                  fontWeight: FontWeight.bold,
  
                ),
  
              ),
  
              Text(
  
                '${model['time']}',
  
                style: TextStyle(
  
                  color: Colors.grey,
  
                ),
  
              ),
  
            ],
  
          ),
  
        ),
  
        SizedBox(
  
          width: 20.0,
  
        ),
  
        IconButton(onPressed: (){
  
          AppCubit.get(context).updateData(status: 'done', id: model['id']);
  
        }, icon: Icon(
  
          Icons.check_box,
  
          color: Colors.green,
  
        )),
  
        IconButton(onPressed: (){
  
          AppCubit.get(context).updateData(status: 'archive', id: model['id']);
  
        }, icon: Icon(
  
          Icons.archive,
  
          color: Colors.black45,
  
        )),
  
  
  
      ],
  
    ),
  
  ),
  onDismissed: (direction)
  {
    AppCubit.get(context).deleteData(id: model['id']);

  },
);

Widget buildArticleItem(article,context) =>
   InkWell(
     onTap: (){
       navigateTo(context, WebViewScreen(article['url']));
     },
     child: Padding(

      padding: const EdgeInsets.all(20.0),

      child: Row(

        children: [

          Container(

            width: 120.0,

            height: 120.0,

            decoration: BoxDecoration(

              borderRadius: BorderRadius.circular(10.0,),

              image: DecorationImage(

                image: NetworkImage(

                  '${article['urlToImage']}'

                ),

                fit: BoxFit.cover,

              ),

            ),

          ),

          SizedBox(width: 20.0,),

          Expanded(

            child: Container(

              height: 120.0,

              child: Column(

                crossAxisAlignment: CrossAxisAlignment.start,

                mainAxisAlignment: MainAxisAlignment.start,

                children: [

                  Expanded(

                    child: Text(

                      '${article['title']}',

                      style: Theme.of(context).textTheme.bodyText1,

                    ),

                  ),

                  Text(

                    '${article['publishedAt']}',

                    style: TextStyle(

                      color: Colors.grey,

                    ),

                    maxLines: 3,

                    overflow: TextOverflow.ellipsis,

                  ),



                ],

              ),

            ),

          ),

        ],

      ),

  ),
   );


  Widget myDivider() => Padding(
    padding: const EdgeInsetsDirectional.only(start: 20.0),
    child: Container(
      width: double.infinity,
      height: 1.0,
      color: Colors.grey[300],
    ),
  );

  void navigateTo(context,widget) => Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => widget,
    ),
  );


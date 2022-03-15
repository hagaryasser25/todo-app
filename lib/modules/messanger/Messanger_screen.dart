import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MessangerScreen  extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        titleSpacing: 20.0,
        title: Row(
          children: [
            CircleAvatar(
              radius: 20.0,
              backgroundImage: NetworkImage('https://novelas-magazine.com/wp-content/uploads/2021/08/Neslihan-Atagul.jpg'),
            ),
            SizedBox(
              width: 15.0,
            ),
            Text(
              'Chats',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(onPressed: (){}, icon :CircleAvatar(
            radius: 15.0,
            backgroundColor: Colors.blue,
            child: Icon(
              Icons.camera_alt,
              size: 16.0,
              color: Colors.white,
            ),
          ),
          ),
          IconButton(onPressed: (){}, icon: CircleAvatar(
            radius: 15.0,
            backgroundColor: Colors.blue,
            child: Icon(
              Icons.edit,
              size: 16.0,
              color: Colors.white,
            ),
          ),),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadiusDirectional.circular(5.0),
                  color: Colors.grey[300],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.search,
                      ),
                      SizedBox(
                        width: 15.0,
                      ),
                      Text('Search'),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                height: 100.0,
                child: ListView.separated(
                  shrinkWrap: true,
                itemBuilder: (context,index) => buildStoryItem(),
                separatorBuilder: (context,index) => SizedBox(
                  width: 20.0,
                ),
                itemCount: 5,),
              ),
              SizedBox(
                height: 40.0,
              ),
              ListView.separated(
                shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context,index) => buildChatItem(),
                  separatorBuilder: (context,index) => SizedBox(
                    height: 20.0,
                  ),
                  itemCount: 15,
              ),



            ],
          ),
        ),
      ),
    );
  }


  Widget buildChatItem() => Row(
    children: [
      CircleAvatar(
        radius: 30.0,
        backgroundImage: NetworkImage('https://i.pinimg.com/originals/42/b4/68/42b468a8f4ee5605e8c419b05c4990cb.jpg'),
      ),
      SizedBox(
        width: 20.0,
      ),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Barış Arduç',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Hello my name is Barış Arduç',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10.0,
                  ),
                  child: Container(
                    width: 7.0,
                    height: 7.0,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.circle,
                    ),

                  ),
                ),
                Text(
                  '02:00 pm',
                ),
              ],
            ),
          ],
        ),
      ),
    ],
  );

  Widget buildStoryItem() =>  Container(
    width: 60,
    child: Row(
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomEnd,
              children: [
                CircleAvatar(
                  radius: 30.0,
                  backgroundImage: NetworkImage('https://fr.web.img4.acsta.net/pictures/17/05/24/15/43/533623.jpg'),
                ),
                CircleAvatar(
                  radius: 8.0,
                  backgroundColor: Colors.white,
                ),
                CircleAvatar(
                  radius: 7.0,
                  backgroundColor: Colors.green,
                ),

              ],
            ),
            SizedBox(height: 6),
            Text(
              'Fahriye Evcen',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            )

          ],
        ),
  );


}


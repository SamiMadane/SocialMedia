import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media/modules/NewPost/NewPostScreen.dart';
import 'package:social_media/shared/components/components.dart';
import 'package:social_media/shared/cubit/cubit.dart';
import 'package:social_media/shared/cubit/states.dart';
import 'package:social_media/shared/styles/icon_broken.dart';

class SocialApp extends StatelessWidget {
  const SocialApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit,SocialStates>(
      listener: (BuildContext context, state) {
        if(state is SocialNewPostState){
          navigatorTo(context, NewPostScreen());
        }
      },
      builder: (BuildContext context, Object? state) {
        var cubit = SocialCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text(cubit.titles[cubit.currentIndex]),
            actions: [
              IconButton(icon: Icon(IconBroken.Notification),onPressed: (){}),
              IconButton(icon: Icon(IconBroken.Search),onPressed: (){}),
            ],
          ),
          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.currentIndex,
            onTap: (index){
              cubit.changeBottomNav(index);
            },
            items: [
              BottomNavigationBarItem(
                  icon: Icon(IconBroken.Home),
                  label: 'Home',
              ),
              BottomNavigationBarItem(
                  icon: Icon(IconBroken.Chat),
                  label: 'Chats',
              ),
              BottomNavigationBarItem(
                icon: Icon(IconBroken.Paper_Upload),
                label: 'Post',
              ),
              BottomNavigationBarItem(
                  icon: Icon(IconBroken.Location),
                  label: 'Users',
              ),
              BottomNavigationBarItem(
                  icon: Icon(IconBroken.Setting),
                  label: 'Settings',
              ),
            ],
          ),

        );
      },
    );
  }
}





// email verification in body:
// ConditionalBuilder(
// condition: SocialCubit.get(context).model != null,
// builder: (context){
// var model = SocialCubit.get(context).model;
// return Column(
// children: [
// if (FirebaseAuth.instance.currentUser!.emailVerified == false)
// Container(
// color: Colors.amber.withOpacity(0.6),
// child: Padding(
// padding: const EdgeInsets.symmetric(horizontal: 20),
// child: Row(
// children: [
// Icon(Icons.info_outline),
// SizedBox(width: 10,),
// Expanded(child: Text('Please Verifiy Your Email')),
// SizedBox(width: 20,),
// defaultTextButton(text: 'SEND', function: () {
// FirebaseAuth.instance.currentUser!
//     .sendEmailVerification().then((value) {
// showToast(text: 'Check your mail',
// state: ToastStates.SUCCESS);
// }).catchError((error) {
//
// });
// }),
// ],
// ),
// ),
// ),
// ],
// );
// },
// fallback: (context) => Center(child: CircularProgressIndicator()),
// ),
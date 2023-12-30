import 'package:flutter/material.dart';

class ReelSideActionbar extends StatelessWidget {
  const ReelSideActionbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
     color: Colors.red,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        
        children: [
         Flexible(child: 
          IconButton(
              onPressed: () => {},
              icon: const Icon(Icons.favorite_outline ,),
              iconSize: 28,
              ),
              ),
          IconButton(
              onPressed: () => {},
              icon:  const Icon(Icons.comment_rounded),
              iconSize: 28),
          IconButton(
              onPressed: () => {},
              icon: const Icon(Icons.send),
              iconSize: 28),
          IconButton(
              onPressed: () => {},
              icon:const Icon(Icons.more_vert_sharp),
              iconSize: 28),
               IconButton(
              onPressed: () => {},
              icon:const Icon(Icons.photo_size_select_actual),
              iconSize: 28),
        ],
      ),
    );
  }
} 

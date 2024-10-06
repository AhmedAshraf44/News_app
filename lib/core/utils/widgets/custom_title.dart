import 'package:flutter/material.dart';

import '../../../feature/home/presentation/manger/home_cubit/home_cubit.dart';

class CustomTitle extends StatelessWidget {
  const CustomTitle({
    super.key,
    required this.cubit, this.mainAxisAlignment = MainAxisAlignment.start,
  });

  final HomeCubit cubit;
  final MainAxisAlignment mainAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:mainAxisAlignment, 
      children: [
        Text(
          'News',
          style:cubit.isLight== true?const TextStyle(color: Colors.black,) : const TextStyle(color: Colors.white,),
        ),
       const Text(
          'Cloud',
          style: TextStyle(color: Colors.yellow),
        ),
      ],
    );
  }
}

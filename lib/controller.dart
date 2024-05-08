import 'package:flutter/cupertino.dart';

class Controller
{
   int _x=0;
  void increase()
  {
    _x++;

  }
  void decrease()
  {
    _x--;

  }
  int get x=>_x;
}
// int x=0;
// void increase()
// {
//   x++;
// }
// void decrease()
// {
//   x--;
// }
// int get value=>x;
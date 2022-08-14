

import 'package:flutter/cupertino.dart';

@immutable
abstract class PostEvent {}

class LoadEvent extends PostEvent {}

class PullToRefreshEvent extends PostEvent {}

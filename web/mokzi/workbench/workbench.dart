library workbench;

import '../mokzi.dart';
import '../scene/scene.dart';
import '../event/event.dart';
import '../character/character.dart';

import 'dart:collection';
part 'writequeue.dart';

class StoryContext {
	WriteQueue queue;
	Map<String,	Event> events;
	Map<String, Scene> scenes;
	Map<String, SceneNode> graph;
	Map<String, Character> characters;
}

class StoryEditor {
	
}




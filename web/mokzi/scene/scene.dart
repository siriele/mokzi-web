library scene;

import '../mokzi.dart';
import '../event/event.dart';
import '../character/character.dart';



class SceneGraph {
		Map<String, SceneNode> nodes;
		int paths;
		int entries;
		// other stuff
		SceneGraph(){
			nodes = new Map<String, SceneNode>();
			paths = 0;
			entries = 0;
		}

		void detachParent(String target, String parent){
			if (target == parent){
				throw new StateError("You cannot detach yourself from your self");
			}

			if (nodes.containsKey(target) && nodes.containsKey(parent)){
				nodes[target].detachParent(parent);
				nodes[parent].detachChild(target);
			}
		}

		void detachChild(String target, String child){
			if (target == child){
				throw new StateError("You cannot detach yourself from your self");
			}

			if (nodes.containsKey(target) && nodes.containsKey(child)){
				nodes[target].detachChild(child);
				nodes[child].detachParent(target);
			}
		}

		void attachChild(String target, String child){
			if (target == child){
				throw new StateError("You cannot detach yourself from your self");
			}
			if (!nodes.containsKey(target)){
				throw new StateError("That scene isn't in this graph");
			}
			if (nodes[target].parents.contains(child)){
				throw new StateError("Created a cycle if this node is attached");
			}
			findParent(target, child);// if found cycle will be created
		}

		void attachParent(String target, String parent){
			if (target == parent){
				throw new StateError("You cannot detach yourself from your self");
			}
			if (!nodes.containsKey(target)){
				throw new StateError("That scene isn't in this graph");
			}

			if (nodes[target].children.containsKey(parent)){
				throw new StateError("Created a cycle if this node is attached");
			}

			findChild(target, parent);// if found cycle will be created
		}

		void findParent(String target, String parent){

		}

		// find ch
		void findChild(String target, String child){

		}
		// maybe add some fancy move semantics
}


class SceneNode {
	Map<String, String> children; //key: scene_id, value: transition_id
	List<String> parents;
	SceneNode(){
		children = new Map<String, String>();
		parents = new List<String>();
	}

	void detachParent(String parent){
		parents.remove(parent);
	}

	void detachChild(String child){
		children.remove(child);
	}
	void addChild(String scene,[String st]){
		 children[scene] = st;
	}
}

//probably needs a from json method or something
class EventsRow {
	List<String> events;
	String _transition;

	String get transition => _transition;
	       set transition (String tr) => _transition = tr;

	EventsRow():events = new List<String>(){
	}

	bool contains(String eid){
		return events.contains(eid);
	}

	void removeEvent(String event){
		if (events.contains(event)){
			events.remove(event);
		}
	}
	void addEvent(String event){
		if (!events.contains(event)){
			events.add(event);
		}
	}
}

const String SCENE = "scene";
const String SCENE_TRANSITION = "scene_transition";

class Scene extends Savable {
	String story;
	String title;
	String presummary;
	String postsummary;
	String subtype;
	String thumbnail;
	Map<String,Object>meta;
	List<EventsRow>queue;
	List<String> events; 
	List<String> characters;
	Scene(String id, String this.story,[this.subtype]): super(id, SCENE){
		events = new List<String>();
		characters = new List<String>();
	}

	void loadAssets(){
		print("No assets to load");
	}

	void setup(){

	}

	void loadMeta(){

	}

	void addEvent(Event e){
		if (!events.contains(e.id)){
			events.add(e.id);
			e.addScene(this.id);
		}
	}

	void removeEvent(Event e){
		if (events.contains(e.id)){
			events.remove(e.id);
			e.removeScene(this.id);
		}
	}

	void addCharacter(Character c){
		if (!characters.contains(c.id)){
			characters.add(c.id);
		}
	}

	void removeCharacter(Character c){
		if (characters.contains(c.id)){
			characters.remove(c.id);
		}
	}
}

class SceneTransition extends Savable {
	String subtype;
	Map<String,Object>meta;
	SceneTransition(String id, [this.subtype]): super(id, SCENE_TRANSITION){

	}
}

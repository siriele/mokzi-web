library scene;

import '../mokzi.dart';
import '../event/event.dart';

class SceneNode {
	Map<String, String> children; //key: scene_id, value: transition_id
	List<String> parents;
	SceneNode():children = new Map<String, String>(), parents = new List<String>(){

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

	void add(String eid){
		if (events.contains(eid)){
			return;
		}
		events.add(eid);
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
	Scene(String id, String this.story,[this.subtype]): super(id, SCENE){
		events = new List<String>();
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
}

class SceneTransition extends Savable {
	String subtype;
	Map<String,Object>meta;
	SceneTransition(String id, [this.subtype]): super(id, SCENE_TRANSITION){

	}
}

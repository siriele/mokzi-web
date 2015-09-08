library scene;

import '../mokzi.dart';

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
	String title;
	String presummary;
	String postsummary;
	String subtype;
	String thumbnail;
	Map<String,Object>meta;
	List<EventsRow>queue; 
	Scene(String id, [this.subtype]): super(id, SCENE){
		
	}

	void loadAssets(){
		print("No assets to load");
	}

	void setup(){

	}

	void loadMeta(){

	}

}

class SceneTransition extends Savable {
	String subtype;
	Map<String,Object>meta;
	SceneTransition(String id, [this.subtype]): super(id, SCENE_TRANSITION){

	}
}

library event;

import '../mokzi.dart';

class EventRow {
	List<String>events;
	String transition; 
}

class EventTransition extends Savable {
	EventTransition(String id, String type):super(id,type){

	}
}

const String EVENT = "event";
const String RAW = "raw";
const String DEFAULT = RAW;//may not be needed

class Event extends Savable {
	bool _complete;
	bool get done => _complete;
	String data;
	String subtype;
	List<String>scenes;
	String get subType=> subtype;
	Event(String id, [this.subtype]): super(id, EVENT){
		scenes = new List<String>();
	}
	void loadAssets(){

	}
	void setup(){
		//I'm not totally sure what this is going to do
	}
	void update(DateTime lastFrame){
	
	}//might take time since last tick

	void removeScene(String scene){
		if (scenes.contains(scene)){
			scenes.remove(scene);
		}
	}
	void addScene(String scene){
		if (!scenes.contains(scene)){
			scenes.add(scene);
		}
	}
}


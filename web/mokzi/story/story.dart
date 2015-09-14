library story;
import '../mokzi.dart';
import '../scene/scene.dart';
import '../event/event.dart';
import '../character/character.dart';
import 'package:uuid/uuid.dart';
const String STORY = "story";

class Story extends Savable{
	String title;
	String description;
	String subtype;
	String get subType => subtype;
	List<String> genres;
	Map<String,	Event> events;
	Map<String, Scene> scenes;
	Map<String, SceneNode> graph;
	Map<String, Character> characters;
	Map<String, EventTransition>etransitions;
	Map<String, SceneTransition>stransitions;
	Uuid uuid;
	
	Story(String id, [this.subtype, this.title]):super(id, STORY){
		uuid = new Uuid();
	 	genres = new List<String>();
	 	events = new Map<String, Event>();
	 	scenes = new Map<String, Scene>();
	 	graph = new Map<String, SceneNode>();
	 	characters = new Map<String, Character>();
	 	etransitions = new Map<String, EventTransition>();
	 	stransitions = new Map<String, SceneTransition>();
	}

	void loadMeta(){

	}


    Event newEvent([String stype]){
    	String nid = uuid.v1();
    	Event e = new Event(nid, stype);
    	events[e.id] = e;
    	return e;
    }

    Event updateEvent( Event object){
    	return object;
    }

    void deleteEvent(Event object){
    	for (String s in object.scenes){
    		if (scenes.containsKey(s)){
    			scenes[s].removeEvent(object);
    		}
    	}
    	events.remove(object);
    }
    Scene newScene([String stype]){
    	String nid = uuid.v1();
    	Scene s = new Scene(nid, stype);
    	scenes[s.id] = s;
    	return s;
    }

    Scene updateScene( Scene object){
    	return null;
    }

    void deleteScene(Scene object){
    	for (String e in object.events){
    		if (events.containsKey(e)){
    			events[e].removeScene(object.id);
    		}
    	}
    }

    Character newCharacter([String stype]){
    	String nid = uuid.v1();
    	Character c = new Character(nid, stype);
    	characters[c.id] = c;
    	return c;
    }

    Character updateCharacter( Character object){
    	return null;
    }

    void deleteCharacter(Character object){

    }
    EventTransition newEventTransition([String stype]){
    	String nid = uuid.v1();
    	EventTransition e = new EventTransition(nid, stype);
    	etransitions[e.id] = e;
    	return e;
    }

    EventTransition updateEventTransition( EventTransition object){
    	return null;
    }

    void deleteEventTransition(EventTransition object){

    }
    SceneTransition newSceneTransition([String stype]){
    	String nid = uuid.v1();
    	SceneTransition s = new SceneTransition(nid, stype);
    	stransitions[s.id] = s;
    	return s;
    }

    SceneTransition updateSceneTransition( SceneTransition object){
    	return null;
    }

    void deleteSceneTransition(SceneTransition object){

    }

    void addNodeToGraph(){
    	
    }
	
}



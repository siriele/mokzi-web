library story;
import '../mokzi.dart';
import '../scene/scene.dart';
import '../event/event.dart';
import '../character/character.dart';
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
	
	Story(String id, [this.subtype, this.title]):super(id, STORY){

	}

	void loadMeta(){

	}


    Event newEvent([String stype]){
    	return null;
    }

    Event updateEvent( Event object){
    	return null;
    }

    void deleteEvent(Event object){

    }
    Scene newScene([String stype]){
    	return null;
    }

    Scene updateScene( Scene object){
    	return null;
    }

    void deleteScene(Scene object){

    }
    // SceneNode newSceneNode([String stype]){
    // 	return null;
    // }

    // SceneNode updateSceneNode( SceneNode object){
    // 	return null;
    // }

    // void deleteSceneNode(SceneNode object){


    // }
    Character newCharacter([String stype]){
    	return null;
    }

    Character updateCharacter( Character object){
    	return null;
    }

    void deleteCharacter(Character object){

    }
    EventTransition newEventTransition([String stype]){
    	return null;
    }

    EventTransition updateEventTransition( EventTransition object){
    	return null;
    }

    void deleteEventTransition(EventTransition object){

    }
    SceneTransition newSceneTransition([String stype]){
    	return null;
    }

    SceneTransition updateSceneTransition( SceneTransition object){
    	return null;
    }

    void deleteSceneTransition(SceneTransition object){

    }
	
}



library story;
import '../mokzi.dart';

const String STORY = "story";

class Story extends Savable{
	String title;
	String description;
	String subtype;
	String get subType => subtype;
	List<String> genres;
	Story(String id, [this.subtype, this.title]):super(id, STORY){

	}

	void loadMeta(){

	}
	
}



library character;

import '../mokzi.dart';

const String CHARACTER = "character";

class Character extends Savable {
	String name;
	String thumbnail;
	String subtype;
	Character(String id, [this.subtype, this.name]):super(id, CHARACTER){

	}

	void loadMeta(){

	}
	
}



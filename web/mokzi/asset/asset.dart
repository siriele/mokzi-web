library asset;

import '../mokzi.dart';

const String ASSET = "asset";

class Asset extends Savable {
	String subtype;
	Asset(String id, [this.subtype]):super(id, ASSET){

	}
	void loadAssets(){

	}
	void setup(){
		//I'm not totally sure what this is going to do
	}
}

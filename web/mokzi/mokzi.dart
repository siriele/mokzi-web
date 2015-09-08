library mokzi;


class Author {
	String name;
	//other shit I'm sure
}

class Savable {
	final String id;
	final String type;
	int _writes;
	String revision; // client revision
	String srevision; // server revision
	DateTime updatedOn;
	DateTime createdOn;
	DateTime deletedOn;

	bool get deleted => deletedOn != null;
	Savable(this.id, this.type){
		_writes = 1;
		DateTime now = new DateTime.now();
		updatedOn = now;
		createdOn = now;
		srevision = updatedOn.millisecondsSinceEpoch.toString();
		srevision = "${_writes}-${srevision}";
	}
	
	void validate(){

	}

	void saveUpdate(){
		_writes += 1;
		updatedOn = new DateTime.now();
		srevision = updatedOn.millisecondsSinceEpoch.toString();
		srevision = "${_writes}-${srevision}";
	}

	void delete(){
		deletedOn ?? _delete();
	}

	void _delete(){
		saveUpdate();
		deletedOn = updatedOn;
	}
}
// I imagine the 




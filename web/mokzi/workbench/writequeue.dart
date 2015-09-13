part of workbench;

class QueueItem {
	String id;
	String type;
	QueueItem(this.id, this.type);
}

class WriteQueue {
	Queue<QueueItem> queue;
	Map<String, Map<String, bool>>items;
	WriteQueue(){
		this.queue = new Queue<QueueItem>();
		this.items = new Map<String, Map<String, bool>>();
	}

	void add(Savable s){
		items[s.type]??= new Map<String, bool>();
		if (items[s.type].containsKey(s.id)){
			if (items[s.type].containsKey(s.id) != s.deleted){
				_update(s);
			}
		}else{
			_add(s);
		}
	}

	void _add(Savable s){
		items[s.type][s.id] = s.deleted;
		queue.add(new QueueItem(s.id, s.type));
	}

	void _update(Savable s){
		items[s.type][s.id] = s.deleted;
	}

	QueueItem pop(){
		if (queue.isEmpty){
			return null;
		}
		QueueItem item = queue.removeFirst();
		items[item.type].remove(item.id);
		return item;
	}
}

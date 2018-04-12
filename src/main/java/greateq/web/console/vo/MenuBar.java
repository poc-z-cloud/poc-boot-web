package greateq.web.console.vo;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

public class MenuBar{
	private Long id;
	private String name;
	private String description;
	private String url;
	private Integer sortOrder;
	private List<MenuItem> items = new ArrayList<MenuItem>();
	
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public Integer getSortOrder() {
		return sortOrder;
	}
	public void setSortOrder(Integer sortOrder) {
		this.sortOrder = sortOrder;
	}
	
	public void addItem(MenuItem item){
		this.items.add(item);
	}

	public void addItems(List<MenuItem> itemList){
		this.items.addAll(itemList);
	}

	public void clearItem(){
		this.items.clear();
	}

	public List<MenuItem> getItems() {
		return items;
	}

	public List<MenuItem> getSortedItems() {
		Comparator<MenuItem> comp = new Comparator<MenuItem>(){
			public int compare(MenuItem a, MenuItem b) {
				return a.getSortOrder().compareTo(b.getSortOrder());
			}
		};

		Collections.sort(items, comp);
		return items;
	}
	

	public boolean isEmpty(){
		return items.isEmpty();
	}
//	public void setItems(List<MenuItem> items) {
//		this.items = items;
//	}
	

	
}

package info.beans;

public class InfoBean {
	private String name;
	private String id;
	
	public String getGender(){
		String sex ="";
		char sexNum = id.charAt(7); //801212-1234567
		if(sexNum =='1' | sexNum=='3'|sexNum == '9') {
				sex = "남자";
		}else if(sexNum == '2' |sexNum == '4') {
				sex = "여자";
		}else if(sexNum == '5'|sexNum == '6'|sexNum == '7'|sexNum == '8') {
				sex = "외국인";
		}
		return sex;
	}	
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
}

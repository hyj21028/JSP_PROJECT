package dto;

import java.util.Arrays;

public class Member {
	private String mail;
	private String pwd;
	private String gender;
	private String favorite[];
	private String content;
	private String loc;

	public String getMail() {
		return mail;
	}
	public void setMail(String mail) {
		this.mail = mail;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String[] getFavorite() {
		return favorite;
	}
	public void setFavorite(String[] favorite) {
		this.favorite = favorite;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getLoc() {
		return loc;
	}
	public void setLoc(String loc) {
		this.loc = loc;
	}
	
	@Override
	public String toString() {
		return "Member [mail=" + mail + ", pwd=" + pwd + ", gender=" + gender + ", favorite="
				+ Arrays.toString(favorite) + ", content=" + content + ", loc=" + loc + "]";
	}
	
}

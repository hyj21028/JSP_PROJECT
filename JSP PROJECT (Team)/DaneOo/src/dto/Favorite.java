package dto;

public class Favorite {
	private String bno;
	private String mail;
	private String favorite;
	private String title;
	private String link;
	private String image;
	private String lprice;
	private String hprice;
	private String mallName;
	private Long productId;
	private int productType;
	
	public String getBno() {
		return bno;
	}
	public void setBno(String bno) {
		this.bno = bno;
	}
	public String getMail() {
		return mail;
	}
	public void setMail(String mail) {
		this.mail = mail;
	}
	public String getFavorite() {
		return favorite;
	}
	public void setFavorite(String favorite) {
		this.favorite = favorite;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getLink() {
		return link;
	}
	public void setLink(String link) {
		this.link = link;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getLprice() {
		return lprice;
	}
	public void setLprice(String lprice) {
		this.lprice = lprice;
	}
	public String getHprice() {
		return hprice;
	}
	public void setHprice(String hprice) {
		this.hprice = hprice;
	}
	public String getMallName() {
		return mallName;
	}
	public void setMallName(String mallName) {
		this.mallName = mallName;
	}
	public Long getProductId() {
		return productId;
	}
	public void setProductId(Long productId) {
		this.productId = productId;
	}
	public int getProductType() {
		return productType;
	}
	public void setProductType(int productType) {
		this.productType = productType;
	}
	
	@Override
	public String toString() {
		return "Favorite [bno=" + bno + ", mail=" + mail + ", favorite=" + favorite + ", title=" + title + ", link="
				+ link + ", image=" + image + ", lprice=" + lprice + ", hprice=" + hprice + ", mallName=" + mallName
				+ ", productId=" + productId + ", productType=" + productType + "]";
	}
	
}

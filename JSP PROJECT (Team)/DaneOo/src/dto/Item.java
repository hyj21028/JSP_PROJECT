package dto;

public class Item {
// -- 		"bno"
//	--		"title": "반스 올드스쿨 <b>스니커즈</b> VN000D3HY28 블랙",
//	--		"link": "https://search.shopping.naver.com/gate.nhn?id=11642661041",
//	--		"image": "https://shopping-phinf.pstatic.net/main_1164266/11642661041.20170614110340.jpg",
//	--		"lprice": "20570",
//	--		"hprice": "160000",
//	--		"mallName": "네이버",
//	--		"productId": "11642661041",
//	--		"productType": "1"
	
	private int bno;
	private String title;
	private String link;
	private String image;
	private String lprice;
	private String hprice;
	private String mallName;
	private Long productId;
	private int productType;
	private String category;
	private Long count;
	
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public Long getCount() {
		return count;
	}
	public void setCount(Long count) {
		this.count = count;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
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
		return "Item [bno=" + bno + ", title=" + title + ", link=" + link + ", image=" + image + ", lprice=" + lprice
				+ ", hprice=" + hprice + ", mallName=" + mallName + ", productId=" + productId + ", productType="
				+ productType + ", category=" + category + ", count=" + count + "]";
	}
	
}

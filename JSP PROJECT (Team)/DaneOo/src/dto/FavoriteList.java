package dto;

public class FavoriteList {
	private String favorite;

	public String getFavorite() {
		return favorite;
	}

	public void setFavorite(String favorite) {
		this.favorite = favorite;
	}

	@Override
	public String toString() {
		return "FavoriteList [favorite=" + favorite + "]";
	}
	
}

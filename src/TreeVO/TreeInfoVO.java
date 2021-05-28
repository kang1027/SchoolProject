package TreeVO;

public class TreeInfoVO {
	String treename;
	String treelife;
	String treePoint;
	String treePhoto;
	
	public String getTreename() {
		return treename;
	}
	public void setTreename(String treename) {
		this.treename = treename;
	}
	public String getTreelife() {
		return treelife;
	}
	public void setTreelife(String treelife) {
		this.treelife = treelife;
	}
	public String getTreePoint() {
		return treePoint;
	}
	public void setTreePoint(String treePoint) {
		this.treePoint = treePoint;
	}
	public String getTreePhoto() {
		return treePhoto;
	}
	public void setTreePhoto(String treePhoto) {
		this.treePhoto = treePhoto;
	}
	@Override
	public String toString() {
		return "TreeInfoVO [treename=" + treename + ", treelife=" + treelife + ", treePoint=" + treePoint
				+ ", treePhoto=" + treePhoto + "]";
	}
	
	
}

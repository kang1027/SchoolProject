package VO;

public class CorporationVO {
	String cpname;
	String cpurl;
	String cpintro;
	String cpphoto;
	String cpcall;
	public String getCpname() {
		return cpname;
	}
	public void setCpname(String cpname) {
		this.cpname = cpname;
	}
	public String getCpurl() {
		return cpurl;
	}
	public void setCpurl(String cpurl) {
		this.cpurl = cpurl;
	}
	public String getCpintro() {
		return cpintro;
	}
	public void setCpintro(String cpintro) {
		this.cpintro = cpintro;
	}
	public String getCpphoto() {
		return cpphoto;
	}
	public void setCpphoto(String cpphoto) {
		this.cpphoto = cpphoto;
	}
	public String getCpcall() {
		return cpcall;
	}
	public void setCpcall(String cpcall) {
		this.cpcall = cpcall;
	}
	@Override
	public String toString() {
		return "CorporationVO [cpname=" + cpname + ", cpurl=" + cpurl + ", cpintro=" + cpintro + ", cpphoto=" + cpphoto
				+ ", cpcall=" + cpcall + "]";
	}
	
	
}

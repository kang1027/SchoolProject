package VO;

public class CampainVO {
	int tccode;
	int tcstate;
	String cpname;
	String cpurl;
	String tcname;
	String tcintro;
	String tcurl;
	String tccall;
	public int getTccode() {
		return tccode;
	}
	public void setTccode(int tccode) {
		this.tccode = tccode;
	}
	public int getTcstate() {
		return tcstate;
	}
	public void setTcstate(int tcstate) {
		this.tcstate = tcstate;
	}
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
	public String getTcname() {
		return tcname;
	}
	public void setTcname(String tcname) {
		this.tcname = tcname;
	}
	public String getTcintro() {
		return tcintro;
	}
	public void setTcintro(String tcintro) {
		this.tcintro = tcintro;
	}
	public String getTcurl() {
		return tcurl;
	}
	public void setTcurl(String tcurl) {
		this.tcurl = tcurl;
	}
	public String getTccall() {
		return tccall;
	}
	public void setTccall(String tccall) {
		this.tccall = tccall;
	}
	@Override
	public String toString() {
		return "CampainVO [tccode=" + tccode + ", tcstate=" + tcstate + ", cpname=" + cpname + ", tcname=" + tcname
				+ ", tcintro=" + tcintro + ", tcurl=" + tcurl + ", tccall=" + tccall + "]";
	}
	
	
}

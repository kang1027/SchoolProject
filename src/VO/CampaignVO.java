package VO;

import java.sql.Date;

public class CampaignVO {
	int tccode;
	String cpname;
	String cpurl;
	String tcname;
	String tcintro;
	String tcurl;
	String tccall;
	String tcstate;
	Date tcdate;
	String tcphoto;
	public int getTccode() {
		return tccode;
	}
	public void setTccode(int tccode) {
		this.tccode = tccode;
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
	public String getTcstate() {
		return tcstate;
	}
	public void setTcstate(String tcstate) {
		this.tcstate = tcstate;
	}
	public Date getTcdate() {
		return tcdate;
	}
	public void setTcdate(Date tcdate) {
		this.tcdate = tcdate;
	}
	public String getTcphoto() {
		return tcphoto;
	}
	public void setTcphoto(String tcphoto) {
		this.tcphoto = tcphoto;
	}
	@Override
	public String toString() {
		return "CampaignVO [tccode=" + tccode + ", cpname=" + cpname + ", cpurl=" + cpurl + ", tcname=" + tcname
				+ ", tcintro=" + tcintro + ", tcurl=" + tcurl + ", tccall=" + tccall + ", tcstate=" + tcstate
				+ ", tcdate=" + tcdate +  ", tcphoto=" + tcphoto + "]";
	}
	
	
	
	
	
	
}

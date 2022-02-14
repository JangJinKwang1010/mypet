package com.mypet.vo;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

public class CareVO {
	
	String id, pass, name, hp, email, addr, mdate, birth, gender, cfile, sfile, category, kind, bulk, startdate, enddate;
	String true_category, true_kind, true_bulk, true_startdate, true_enddate;
	CommonsMultipartFile file;	

	
	
	public String getTrue_category() {
		return true_category;
	}

	public void setTrue_category(String true_category) {
		this.true_category = true_category;
	}

	public String getTrue_bulk() {
		return true_bulk;
	}

	public void setTrue_bulk(String true_bulk) {
		this.true_bulk = true_bulk;
	}

	public String getTrue_startdate() {
		return true_startdate;
	}

	public void setTrue_startdate(String true_startdate) {
		this.true_startdate = true_startdate;
	}

	public String getTrue_enddate() {
		return true_enddate;
	}

	public void setTrue_enddate(String true_enddate) {
		this.true_enddate = true_enddate;
	}

	public String getTrue_kind() {
		return true_kind;
	}

	public void setTrue_kind(String true_kind) {
		this.true_kind = true_kind;
	}
	
	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getKind() {
		return kind;
	}

	public void setKind(String kind) {
		this.kind = kind;
	}

	public String getBulk() {
		return bulk;
	}

	public void setBulk(String bulk) {
		this.bulk = bulk;
	}

	public String getStartdate() {
		return startdate;
	}

	public void setStartdate(String startdate) {
		this.startdate = startdate;
	}

	public String getEnddate() {
		return enddate;
	}

	public void setEnddate(String enddate) {
		this.enddate = enddate;
	}

	public CommonsMultipartFile getFile() {
		return file;
	}

	public void setFile(CommonsMultipartFile file) {
		this.file = file;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPass() {
		return pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getHp() {
		return hp;
	}

	public void setHp(String hp) {
		this.hp = hp;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getMdate() {
		return mdate;
	}

	public void setMdate(String mdate) {
		this.mdate = mdate;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getCfile() {
		return cfile;
	}

	public void setCfile(String cfile) {
		this.cfile = cfile;
	}

	public String getSfile() {
		return sfile;
	}

	public void setSfile(String sfile) {
		this.sfile = sfile;
	}
}

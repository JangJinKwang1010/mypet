package com.mypet.vo;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

public class PetVO {
	
	String pid, id, pass, name, hp, email, addr, birth, gender, cfile, sfile, category, kind, bulk, startdate, pname, pkg, pgender, pbirth, pcomment, pfile, psfile, img, pdate, rpet, page;
	CommonsMultipartFile file1;
	CommonsMultipartFile pfile1, pfile2, pfile3, pfile4, pfile5, pfile6, pfile7, pfile8, pfile9, pfile10;	
	
	
	public String getPage() {
		return page;
	}
	public void setPage(String page) {
		this.page = page;
	}
	public String getRpet() {
		return rpet;
	}
	public void setRpet(String rpet) {
		this.rpet = rpet;
	}
	public String getPid() {
		return pid;
	}
	public void setPid(String pid) {
		this.pid = pid;
	}
	public String getPdate() {
		return pdate;
	}
	public void setPdate(String pdate) {
		this.pdate = pdate;
	}
	public String getPbirth() {
		return pbirth;
	}
	public void setPbirth(String pbirth) {
		this.pbirth = pbirth;
	}
	public CommonsMultipartFile getPfile3() {
		return pfile3;
	}
	public void setPfile3(CommonsMultipartFile pfile3) {
		this.pfile3 = pfile3;
	}
	public CommonsMultipartFile getPfile4() {
		return pfile4;
	}
	public void setPfile4(CommonsMultipartFile pfile4) {
		this.pfile4 = pfile4;
	}
	public CommonsMultipartFile getPfile5() {
		return pfile5;
	}
	public void setPfile5(CommonsMultipartFile pfile5) {
		this.pfile5 = pfile5;
	}
	public CommonsMultipartFile getPfile6() {
		return pfile6;
	}
	public void setPfile6(CommonsMultipartFile pfile6) {
		this.pfile6 = pfile6;
	}
	public CommonsMultipartFile getPfile7() {
		return pfile7;
	}
	public void setPfile7(CommonsMultipartFile pfile7) {
		this.pfile7 = pfile7;
	}
	public CommonsMultipartFile getPfile8() {
		return pfile8;
	}
	public void setPfile8(CommonsMultipartFile pfile8) {
		this.pfile8 = pfile8;
	}
	public CommonsMultipartFile getPfile9() {
		return pfile9;
	}
	public void setPfile9(CommonsMultipartFile pfile9) {
		this.pfile9 = pfile9;
	}
	public CommonsMultipartFile getPfile10() {
		return pfile10;
	}
	public void setPfile10(CommonsMultipartFile pfile10) {
		this.pfile10 = pfile10;
	}
	public CommonsMultipartFile getPfile2() {
		return pfile2;
	}
	public void setPfile2(CommonsMultipartFile pfile2) {
		this.pfile2 = pfile2;
	}
	public CommonsMultipartFile getPfile1() {
		return pfile1;
	}
	public void setPfile1(CommonsMultipartFile pfile1) {
		this.pfile1 = pfile1;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
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
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public String getPkg() {
		return pkg;
	}
	public void setPkg(String pkg) {
		this.pkg = pkg;
	}
	public String getPgender() {
		return pgender;
	}
	public void setPgender(String pgender) {
		this.pgender = pgender;
	}
	public String getPcomment() {
		return pcomment;
	}
	public void setPcomment(String pcomment) {
		this.pcomment = pcomment;
	}
	public String getPfile() {
		return pfile;
	}
	public void setPfile(String pfile) {
		this.pfile = pfile;
	}
	public String getPsfile() {
		return psfile;
	}
	public void setPsfile(String psfile) {
		this.psfile = psfile;
	}
	public CommonsMultipartFile getFile1() {
		return file1;
	}
	public void setFile1(CommonsMultipartFile file1) {
		this.file1 = file1;
	}	
	
	
	public CommonsMultipartFile pfile(int i) {
		if (i == 0) {
			return pfile1;
		} else if (i == 1) {
			return pfile2;
		} else if (i == 2) {
			return pfile3;
		} else if (i == 3) {
			return pfile4;
		} else if (i == 4) {
			return pfile5;
		} else if (i == 5) {
			return pfile6;
		} else if (i == 6) {
			return pfile7;
		} else if (i == 7) {
			return pfile8;
		} else if (i == 8) {
			return pfile9;
		} else {
			return pfile10;
		}
		
	}
	
	

}

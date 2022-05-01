package com.mypet.vo;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

public class DiaryVO {
	
	String id, ftitle, fcontent, fdate, fid, ccomment, cdate, cid, pid, ptitle, pfile, psfile, ptag, pdate, true_ptag;	
	int fheart, fnheart, fhit, rno, c_count, pheart, pnheart, phit, pc_count;
	CommonsMultipartFile pfile0, pfile1, pfile2, pfile3, pfile4, pfile5, pfile6, pfile7, pfile8, pfile9, pfile10;	
	
	
	public int getPc_count() {
		return pc_count;
	}
	public void setPc_count(int pc_count) {
		this.pc_count = pc_count;
	}
	public String getPtitle() {
		return ptitle;
	}
	public void setPtitle(String ptitle) {
		this.ptitle = ptitle;
	}
	public String getPfile() {
		return pfile;
	}
	public void setPfile(String pfile) {
		this.pfile = pfile;
	}
	public void setPfile0(CommonsMultipartFile pfile0) {
		this.pfile0 = pfile0;
	}
	public CommonsMultipartFile getPfile0() {
		return pfile0;
	}
	public void setPfile(CommonsMultipartFile pfile0) {
		this.pfile0 = pfile0;
	}
	public CommonsMultipartFile getPfile1() {
		return pfile1;
	}
	public void setPfile1(CommonsMultipartFile pfile1) {
		this.pfile1 = pfile1;
	}
	public CommonsMultipartFile getPfile2() {
		return pfile2;
	}
	public void setPfile2(CommonsMultipartFile pfile2) {
		this.pfile2 = pfile2;
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
	public String getTrue_ptag() {
		return true_ptag;
	}
	public void setTrue_ptag(String true_ptag) {
		this.true_ptag = true_ptag;
	}
	public String getPid() {
		return pid;
	}
	public void setPid(String pid) {
		this.pid = pid;
	}
	public String getPsfile() {
		return psfile;
	}
	public void setPsfile(String psfile) {
		this.psfile = psfile;
	}
	public String getPtag() {
		return ptag;
	}
	public void setPtag(String ptag) {
		this.ptag = ptag;
	}
	public String getPdate() {
		return pdate;
	}
	public void setPdate(String pdate) {
		this.pdate = pdate;
	}
	public int getPheart() {
		return pheart;
	}
	public void setPheart(int pheart) {
		this.pheart = pheart;
	}
	public int getPnheart() {
		return pnheart;
	}
	public void setPnheart(int pnheart) {
		this.pnheart = pnheart;
	}
	public int getPhit() {
		return phit;
	}
	public void setPhit(int phit) {
		this.phit = phit;
	}
	public int getC_count() {
		return c_count;
	}
	public void setC_count(int c_count) {
		this.c_count = c_count;
	}
	public String getCid() {
		return cid;
	}
	public void setCid(String cid) {
		this.cid = cid;
	}
	public String getCcomment() {
		return ccomment;
	}
	public void setCcomment(String ccomment) {
		this.ccomment = ccomment;
	}
	public String getCdate() {
		return cdate;
	}
	public void setCdate(String cdate) {
		this.cdate = cdate;
	}
	public int getRno() {
		return rno;
	}
	public void setRno(int rno) {
		this.rno = rno;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getFtitle() {
		return ftitle;
	}
	public void setFtitle(String ftitle) {
		this.ftitle = ftitle;
	}
	public String getFcontent() {
		return fcontent;
	}
	public void setFcontent(String fcontent) {
		this.fcontent = fcontent;
	}
	public String getFdate() {
		return fdate;
	}
	public void setFdate(String fdate) {
		this.fdate = fdate;
	}
	public String getFid() {
		return fid;
	}
	public void setFid(String fid) {
		this.fid = fid;
	}
	public int getFheart() {
		return fheart;
	}
	public void setFheart(int fheart) {
		this.fheart = fheart;
	}
	public int getFnheart() {
		return fnheart;
	}
	public void setFnheart(int fnheart) {
		this.fnheart = fnheart;
	}
	public int getFhit() {
		return fhit;
	}
	public void setFhit(int fhit) {
		this.fhit = fhit;
	}
	
	public CommonsMultipartFile pfile(int i) {
		if (i == 0) {
			return pfile0;
		} else if (i == 1) {
			return pfile1;
		} else if (i == 2) {
			return pfile2;
		} else if (i == 3) {
			return pfile3;
		} else if (i == 4) {
			return pfile4;
		} else if (i == 5) {
			return pfile5;
		} else if (i == 6) {
			return pfile6;
		} else if (i == 7) {
			return pfile7;
		} else if (i == 8) {
			return pfile8;
		} else if (i == 9) {
			return pfile9;
		} else {
			return pfile10;
		}
		
	}
	
	
}

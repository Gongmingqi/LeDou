package com.wangbo.joybeans.pojo;



import java.util.List;

public class PageBean <T> {
	private int currentPage ; 
	
	//每页显示的条数
	public static final int PAGE_SIZE=3 ;;
	
	
	private int allcounts ; 
	
	
	private int allPages ; 
	
	
	private List<T> list ;
	

	public PageBean() {
		super();
	}


	public PageBean(int currentPage,  int allcounts, int allPages,
			List<T> list) {
		super();
		this.currentPage = currentPage;
		this.allcounts = allcounts;
		this.allPages = allPages;
		this.list = list;
	}


	public int getCurrentPage() {
		return currentPage;
	}


	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}


	


	public int getAllcounts() {
		return allcounts;
	}


	public void setAllcounts(int allcounts) {
		this.allcounts = allcounts;
	}


	public int getAllPages() {
		return allPages;
	}


	public void setAllPages(int allPages) {
		this.allPages = allPages;
	}


	public List<T> getList() {
		return list;
	}


	public void setList(List<T> list) {
		this.list = list;
	} 
	
	
	
}

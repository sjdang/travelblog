package com.sjdang.util.page;

/**
 * @ClassName: com.sjdang.util.page.DataTableVO
 * @Description: TODO(��ҳ��ѯ������������)
 * @author SJDANG
 * @date 2018��3��4�� ����10:34:30
 * @version V1.0
 */
public class DataTableVO {
	
	private Integer draw;
    private Integer start;
    private Integer length;
    private String searchValue;
    
	public Integer getDraw() {
		return draw;
	}
	public void setDraw(Integer draw) {
		this.draw = draw;
	}
	public Integer getStart() {
		return start;
	}
	public void setStart(Integer start) {
		this.start = start;
	}
	public Integer getLength() {
		return length;
	}
	public void setLength(Integer length) {
		this.length = length;
	}
	public String getSearchValue() {
		return searchValue;
	}
	public void setSearchValue(String searchValue) {
		this.searchValue = searchValue;
	}
	
    
}

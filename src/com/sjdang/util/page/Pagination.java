package com.sjdang.util.page;

import java.util.List;

/**
 * @ClassName: com.sjdang.util.page.Pagination
 * @Description: TODO(分页查询结果集工具类)
 * @author SJDANG
 * @date 2018年3月4日 下午9:59:22
 * @version V1.0
 */
public class Pagination<T> {
	
	private Integer draw;
    private Integer recordsTotal;
    private Integer recordsFiltered;
    private List<T> data;
    
	public Integer getDraw() {
		return draw;
	}
	public void setDraw(Integer draw) {
		this.draw = draw;
	}
	public Integer getRecordsTotal() {
		return recordsTotal;
	}
	public void setRecordsTotal(Integer recordsTotal) {
		this.recordsTotal = recordsTotal;
	}
	public Integer getRecordsFiltered() {
		return recordsFiltered;
	}
	public void setRecordsFiltered(Integer recordsFiltered) {
		this.recordsFiltered = recordsFiltered;
	}
	public List<T> getData() {
		return data;
	}
	public void setData(List<T> data) {
		this.data = data;
	}
    
}

package org.zzin.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class PageDTO {

    private int page, amount;
    private String type, keyword;

    public PageDTO(Integer page, Integer amount) {
        this.page = (page == null || page <= 0) ? 1 : page;
        this.amount = (amount == null || amount <= 10) ? 10 : amount;
        this.type = (type == null) ? "t" : type;
        this.keyword = (keyword == null) ? "" : keyword;
    }

    public String[] getTypeArr() {
        return (type == null) ? new String[]{} : type.split("");
    }

    public int getSkip(){
        return (page-1) * amount;
    }

}
